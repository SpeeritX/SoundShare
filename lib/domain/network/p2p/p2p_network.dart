import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:sound_share/common/logger.dart';
import 'package:sound_share/domain/network/link/direct_connection.dart';
import 'package:sound_share/domain/network/link/tcp_connection.dart';
import 'package:sound_share/domain/network/p2p/p2p_messages.dart';

class Peer {
  final String address;
  final Socket socket;

  Peer(this.address, this.socket);
}

class P2pNetwork {
  final TcpConnection _connection;

  final _songBytesSink = StreamController<Uint8List>.broadcast();

  Stream<Uint8List> get songBytesStream => _songBytesSink.stream;

  P2pNetwork({
    required DirectConnection connection,
  }) : _connection = connection as TcpConnection {
    _connection.readStream.listen((data) {
      final message = P2pMessage.fromJson(jsonDecode(data));
      _handleMessage(message);
    });
  }

  Future<void> sendBytes(Uint8List bytes) async {
    final msg = P2pMessage.musicPackage(
      songId: "",
      serializedBytes: MusicPackageExt.serializeBytes(bytes),
    );
    await _sendMsg(msg);
  }

  void _handleMessage(P2pMessage message) {
    if (message is RequestStateUpdateMsg) {
      logger.d("requestToConnect");
      _sendMsg(P2pMessage.stateUpdateMsg(
        devices: _connection.socketsOut.map((e) => e.address.host).toList(),
      ));
    } else if (message is StateUpdateMsg) {
      logger.d("listOfDevices");
      _connection.connectDevices(message.devices);
    } else if (message is MusicPackageMsg) {
      logger.d("musicPackage");
      _songBytesSink.add(message.deserializeBytes());
    }
  }

  Future<void> _sendMsg(P2pMessage message) async {
    await _connection.write(jsonEncode(message.toJson()));
  }
}
