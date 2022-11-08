import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:sound_share/common/logger.dart';
import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/domain/network/link/message_buffer.dart';

import 'direct_connection.dart';

class TcpConnection with Disposable implements DirectConnection {
  static const messageLength = 64;

  final StreamController<String> _readController = StreamController.broadcast();
  final Socket _readSocket;
  final Socket _writeSocket;

  MessageBuffer buffer = MessageBuffer();

  TcpConnection({required Socket readSocket, required Socket writeSocket})
      : _readSocket = readSocket,
        _writeSocket = writeSocket {
    _readSocket.listen((data) async {
      logger.d("Add to buffer");
      buffer.add(data);
      var nextMessage = buffer.next();
      while (nextMessage != null) {
        logger.d("Next message");
        _handleMessage(String.fromCharCodes(nextMessage));
        nextMessage = buffer.next();
      }
    }, onDone: () {
      logger.d("server done");
    }).canceledBy(this);
  }

  void _handleMessage(String message) {
    _readController.add(message);
  }

  @override
  Stream<String> get readStream => _readController.stream;

  @override
  Future<bool> write(Uint8List msg) async {
    final msgLength = msg.length;
    final header = MessageHeader.encode(msgLength);
    logger.d(header);
    logger.d(header.toString());
    _writeSocket.add(header);
    _writeSocket.add(msg);
    await _writeSocket.flush();
    return true;
  }

  @override
  String get id => _readSocket.remoteAddress.address;
}
