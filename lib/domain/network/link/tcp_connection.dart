import 'dart:async';
import 'dart:io';

import 'package:sound_share/common/logger.dart';
import 'package:sound_share/common/utils/disposable.dart';

import 'direct_connection.dart';

class TcpConnection with Disposable implements DirectConnection {
  static const messageLength = 64;

  final StreamController<String> _readController = StreamController.broadcast();
  final Socket _readSocket;
  final Socket _writeSocket;

  String buffer = "";

  TcpConnection({required Socket readSocket, required Socket writeSocket})
      : _readSocket = readSocket,
        _writeSocket = writeSocket {
    _readSocket.listen((data) async {
      final receivedString = String.fromCharCodes(data);
      buffer = buffer + receivedString;
      // logger.w(receivedString);
      _handleBuffer();
    }, onDone: () {
      logger.d("server done");
    }).canceledBy(this);
  }

  void _handleBuffer() {
    while (true) {
      final splitted = buffer.split("\n");
      logger.d("splitted!");
      logger.d(splitted);
      if (splitted.length > 1) {
        buffer = buffer.substring(splitted.first.length);
        if (buffer.startsWith("\n")) {
          buffer = buffer.substring(1);
        }
        _handleMessage(splitted.first);
      } else {
        return;
      }
    }
  }

  void _handleMessage(String message) {
    _readController.add(message);
  }

  @override
  Stream<String> get readStream => _readController.stream;

  @override
  Future<bool> write(String msg) async {
    _writeSocket.write("$msg\n");
    logger.d("socket ip: ${_writeSocket.address.host}");
    await _writeSocket.flush();
    return true;
  }

  @override
  String get id => _readSocket.remoteAddress.address;
}
