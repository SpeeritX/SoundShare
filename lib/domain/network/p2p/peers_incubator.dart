import 'dart:async';
import 'dart:io';

import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/domain/network/link/tcp/tcp_server.dart';
import 'package:sound_share/domain/network/p2p/peer.dart';
import 'package:sound_share/domain/network/p2p/peer_factory.dart';

class PeersIncubator with Disposable {
  final TcpServer _tcpServer;
  final _connectingPeers = List<PeerFactory>.empty(growable: true);

  final _peerConnected = StreamController<Peer>.broadcast();

  Stream<Peer> get peerConnected => _peerConnected.stream;

  PeersIncubator(this._tcpServer);

  Future<void> connect(String peerId, {Socket? incomingReadSocket}) async {
    final factory = PeerFactory(
      _tcpServer,
      peerId,
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
