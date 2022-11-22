import 'dart:async';
import 'dart:io';

import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/domain/network/link/tcp/tcp_connection_factory.dart';
import 'package:sound_share/domain/network/link/tcp/tcp_server.dart';
import 'package:sound_share/domain/network/p2p/peer.dart';

class PeerFactory with Disposable {
  final TcpServer _tcpServer;
  final String remoteIp;
  Socket? _readSocket;

  PeerFactory(this._tcpServer, this.remoteIp, {Socket? readSocket}) {
    _readSocket = readSocket;
  }

  Future<Peer> connect() async {
    final factoryCommunicationConnection = TcpConnectionFactory(
      _tcpServer,
      remoteIp,
      TcpServer.communicationPort,
      readSocket: _readSocket,
    );

    final factoryDataConnection = TcpConnectionFactory(
      _tcpServer,
      remoteIp,
      TcpServer.dataPort,
    );

    final communicationConnection =
        await factoryCommunicationConnection.connect();
    final dataConnection = await factoryDataConnection.connect();
    return Peer(
        communicationConnection: communicationConnection,
        dataConnection: dataConnection);
  }
}
