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
  void onPlay(int index);
  void onPause();
  void updateQueue();
  void addToQueue(DetailsPackage songData);
  void removeFromQueue(int index);
}

abstract class MusicProviderListener {
  void requestSong(String id);
}

abstract class MusicBufferListener {
  void onMusicPackage(MusicPackageMsg package);
}

class P2pNetwork with Disposable {
  final _peers = PeersContainer(TcpServer(port: TcpServer.defaultPort));

  MusicPlayerListener? _musicPlayerListener;
  MusicProviderListener? _musicProviderListener;
  MusicBufferListener? _musicBufferListener;

  set musicPlayerListener(MusicPlayerListener? listener) {
    _musicPlayerListener = listener;
  }

  set musicProviderListener(MusicProviderListener? listener) {
    _musicProviderListener = listener;
  }

  set musicBufferListener(MusicBufferListener? listener) {
    _musicBufferListener = listener;
  }

  P2pNetwork() {
    _peers.receivedMessages.listen(_handleMessage).canceledBy(this);
    _peers.peerConnected.listen(_onPeerConnected).canceledBy(this);
  }

  Future<void> sendBytes(String id, Uint8List bytes) async {
    final msg = P2pMessage.musicPackage(
      songId: id,
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
      _musicBufferListener?.onMusicPackage(message);
    } else if (message is AddSongToQueueMsg) {
      _musicPlayerListener?.addToQueue(message.songData);
    } else if (message is RequestResourceMsg) {
      _musicProviderListener?.requestSong(message.id);
    } else if (message is PlayMsg) {
      _musicPlayerListener?.onPlay(message.index);
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
