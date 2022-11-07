import 'dart:async';
import 'dart:io';

import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/network/link/direct_connection.dart';
import 'package:sound_share/network/link/tcp/tcp_connection_factory.dart';
import 'package:sound_share/network/link/tcp/tcp_server.dart';

class PeersIncubator with Disposable {
  final TcpServer _tcpServer;
  final _connectingPeers = List<TcpConnectionFactory>.empty(growable: true);

  final _peerConnected = StreamController<DirectConnection>.broadcast();

  Stream<DirectConnection> get peerConnected => _peerConnected.stream;

  PeersIncubator(this._tcpServer);

  void connect(String peerId, {Socket? incomingReadSocket}) async {
    final factory = TcpConnectionFactory(
      _tcpServer,
      peerId,
      TcpServer.defaultPort,
      readSocket: incomingReadSocket,
    );

    _connectingPeers.add(factory);
    final peer = await factory.connect();
    _connectingPeers.remove(factory);
    _peerConnected.add(peer);
  }

  bool contains(String peerId) {
    return _connectingPeers.any((e) => e.remoteIp == peerId);
  }
}
