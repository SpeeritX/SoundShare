import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:sound_share/common/logger.dart';
import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/domain/network/link/tcp/tcp_server.dart';
import 'package:sound_share/domain/network/p2p/p2p_messages.dart';
import 'package:sound_share/domain/network/p2p/peer.dart';
import 'package:sound_share/domain/network/p2p/peers_incubator.dart';

class PeersContainer with Disposable {
  final TcpServer _tcpServer;
  late final PeersIncubator _incubator = PeersIncubator(_tcpServer);
  final _peers = List<Peer>.empty(growable: true);
  final _receivedMessages = StreamController<P2pMessageEvent>.broadcast();
  final _peerConnected = StreamController<String>.broadcast();

  Stream<P2pMessageEvent> get receivedMessages => _receivedMessages.stream;
  Stream<String> get peerConnected => _peerConnected.stream;

  List<String> get allIds => _peers.map((e) => e.id).toList();

  PeersContainer(this._tcpServer) {
    _tcpServer.incomingClients.listen((readSocket) {
      final id = readSocket.remoteAddress.address;
      if (_incubator.contains(id)) {
        return;
      }
      final connectedPeer = _peers.firstWhereOrNull((e) => e.id == id);

      if (connectedPeer != null) {
        connectedPeer.dispose();
        _peers.remove(connectedPeer);
      }

      _incubator.connect(id, incomingReadSocket: readSocket);
    }).canceledBy(this);
    _incubator.peerConnected.listen(_addPeer).canceledBy(this);
  }

  Future<void> connect(String peerId) async {
    await _incubator.connect(peerId);
  }

  Future<void> sendToAll(P2pMessage message) async {
    await Future.wait(_peers.map((peer) => peer.send(message)));
  }

  Future<void> sendToOthers(P2pMessage message) async {
    await Future.wait(_peers.map((peer) async {
      if (!peer.isLocal) {
        await peer.send(message);
      }
    }));
  }

  Future<void> sendToPeer(String peerId, P2pMessage message) async {
    final peer = _peers.firstWhereOrNull((peer) => peer.id == peerId);

    if (peer == null) {
      logger.w("Peer with id '$peerId' not found");
      return;
    }
    await peer.send(message);
  }

  bool contains(String peerId) {
    return _peers.any((e) => e.id == peerId) || _incubator.contains(peerId);
  }

  void _addPeer(Peer peer) {
    _peers.add(peer);
    peer.setListener((data) {
      final message = P2pMessage.fromJson(jsonDecode(data));
      logger.d("RECEIVED $message");
      _receivedMessages.add(P2pMessageEvent(message, peer.id));
    });
    _peerConnected.add(peer.id);
  }

  @override
  void dispose() {
    _incubator.dispose();
    _tcpServer.dispose();
    for (var peer in _peers) {
      peer.dispose();
    }
    super.dispose();
  }
}
