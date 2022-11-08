import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:sound_share/common/logger.dart';
import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/network/link/direct_connection.dart';
import 'package:sound_share/network/link/tcp/tcp_server.dart';
import 'package:sound_share/network/p2p/p2p_messages.dart';
import 'package:sound_share/network/p2p/peers_incubator.dart';

class PeersContainer with Disposable {
  final TcpServer _tcpServer;
  late final PeersIncubator _incubator = PeersIncubator(_tcpServer);
  final _peers = List<DirectConnection>.empty(growable: true);
  final _receivedMessages = StreamController<P2pMessage>.broadcast();
  final _peerConnected = StreamController<String>.broadcast();

  Stream<P2pMessage> get receivedMessages => _receivedMessages.stream;
  Stream<String> get peerConnected => _peerConnected.stream;

  List<String> get allIds => _peers.map((e) => e.id).toList();

  PeersContainer(this._tcpServer) {
    _tcpServer.incomingClients.listen((readSocket) {
      final id = readSocket.remoteAddress.address;
      if (contains(id)) {
        return;
      }

      _incubator.connect(id, incomingReadSocket: readSocket);
    }).canceledBy(this);
    _incubator.peerConnected.listen(_addPeer).canceledBy(this);
  }

  void connect(String peerId) {
    _incubator.connect(peerId);
  }

  Future<void> sendToAll(P2pMessage message) async {
    await Future.wait(_peers.map((e) => _send(e, message)));
  }

  Future<void> sendToPeer(String peerId, P2pMessage message) async {
    final peer = _peers.firstWhereOrNull((peer) => peer.id == peerId);

    if (peer == null) {
      logger.w("Peer with id '$peerId' not found");
      return;
    }
    await _send(peer, message);
  }

  Future<void> _send(DirectConnection peer, P2pMessage message) async {
    logger.d("SENDING to ${peer.id} - $message");
    await peer.write(message.toBytes());
  }

  bool contains(String peerId) {
    return _peers.any((e) => e.id == peerId) || _incubator.contains(peerId);
  }

  void _addPeer(DirectConnection peer) {
    _peers.add(peer);
    peer.readStream.listen((data) {
      final message = P2pMessage.fromJson(jsonDecode(data));
      logger.d("RECEIVED $message");
      _receivedMessages.add(message);
    }).canceledBy(this);

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
