import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/domain/music/package/details_package.dart';
import 'package:sound_share/domain/network/link/tcp/tcp_server.dart';
import 'package:sound_share/domain/network/p2p/peers_container.dart';

import 'p2p_messages.dart';

class Peer {
  final String address;
  final Socket socket;

  Peer(this.address, this.socket);
}

abstract class MusicPlayerListener {
  void onPlay();
  void onPause();
  void updateQueue();
  void addToQueue(int index);
  void removeFromQueue(int index);
  void startNewSong(DetailsPackage songData);
}

abstract class MusicBufferListener {
  void addBytes(String song, Uint8List bytes);
}

class P2pNetwork with Disposable {
  final _peers = PeersContainer(TcpServer(port: TcpServer.defaultPort));

  final _songBytesSink = StreamController<Uint8List>.broadcast();

  Stream<Uint8List> get songBytesStream => _songBytesSink.stream;

  MusicPlayerListener? _musicPlayerListener;

  set musicPlayerListener(listener) {
    _musicPlayerListener = listener;
  }

  P2pNetwork() {
    _peers.receivedMessages.listen(_handleMessage).canceledBy(this);
    _peers.peerConnected.listen(_onPeerConnected).canceledBy(this);
  }

  Future<void> sendBytes(Uint8List bytes) async {
    final msg = P2pMessage.musicPackage(
      songId: "",
      serializedBytes: MusicPackageExt.serializeBytes(bytes),
    );
    await _peers.sendToAll(msg);
  }

  Future<void> sendMessage(P2pMessage message) async {
    await _peers.sendToAll(message);
  }

  void _handleMessage(P2pMessage message) {
    if (message is RequestStateUpdateMsg) {
      _peers.sendToAll(P2pMessage.stateUpdateMsg(devices: _peers.allIds));
    } else if (message is StateUpdateMsg) {
      connectDevices(message.devices);
    } else if (message is MusicPackageMsg) {
      _songBytesSink.add(message.deserializeBytes());
    } else if (message is AddSongToQueueMsg) {
      _musicPlayerListener?.startNewSong(message.songData);
    }
  }

  void _onPeerConnected(String peerId) {
    _peers.sendToPeer(peerId, const P2pMessage.requestStateUpdate());
  }

  void connectDevices(List<String> peersIds) {
    for (final ip in peersIds) {
      connect(ip);
    }
  }

  void connect(String peerId) {
    if (!_peers.contains(peerId)) {
      _peers.connect(peerId);
    }
  }

  @override
  void dispose() {
    _peers.dispose();
    super.dispose();
  }
}
