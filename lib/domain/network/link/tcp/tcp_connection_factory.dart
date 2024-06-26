import 'dart:async';
import 'dart:io';

import 'package:sound_share/common/logger.dart';
import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/domain/network/link/tcp/tcp_server.dart';
import 'package:sound_share/domain/network/link/tcp_connection.dart';

class TcpConnectionFactory with Disposable {
  final TcpServer _tcpServer;
  final String remoteIp;
  final int port;
  Socket? _readSocket;
  Socket? _writeSocket;

  TcpConnectionFactory(this._tcpServer, this.remoteIp, this.port,
      {Socket? readSocket}) {
    _readSocket = readSocket;
  }

  Future<TcpConnection> connect() async {
    await Future.wait([_createWriteSocket(), _createReadSocket()]);

    if (_readSocket == null) {
      logger.w('TcpConnectionFactory: Read socket is null');
    }
    if (_writeSocket == null) {
      logger.w('TcpConnectionFactory: Write socket is null');
    }
    try {
      return TcpConnection(
          readSocket: _readSocket!, writeSocket: _writeSocket!);
    } catch (exception) {
      throw Exception("Couldn't connect");
    }
  }

  Future<void> _createReadSocket() async {
    if (_readSocket != null) return;

    final completer = Completer<void>();
    final subscription = _tcpServer.incomingClients.listen((client) {
      if (client.remoteAddress.address == remoteIp && client.port == port) {
        _readSocket = client;
        completer.complete(null);
      }
    });
    await Future.any([
      completer.future,
      Future.delayed(const Duration(seconds: 5)),
    ]);
    subscription.cancel();
  }

  Future<void> _createWriteSocket() async {
    try {
      _writeSocket = await Socket.connect(remoteIp, port);
    } on Exception catch (e) {
      logger.e(e);
    }
  }
}
