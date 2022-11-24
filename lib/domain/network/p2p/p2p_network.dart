import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/domain/music/package/details_package.dart';
import 'package:sound_share/domain/network/link/tcp/tcp_server.dart';
import 'package:sound_share/domain/network/p2p/peers_container.dart';

import '../../../common/logger.dart';
import 'p2p_messages.dart';

class Peer {
  final String address;
  final Socket socket;

  Peer(this.address, this.socket);
}

abstract class MusicPlayerListener {
  void onPlay(int index, DateTime time, {Duration? songPosition});

  void onPause();

  void updateQueue(List<DetailsPackage> songs);

  void addToQueue(DetailsPackage songData);

  List<DetailsPackage> getQueue();

  void removeFromQueue(int index);

  void onSync();
}

abstract class MusicProviderListener {
  Future<bool> isSongAvailable(String id);

  Future<Uint8List?> getSongBytes(String songId, int startIndex);
}

abstract class MusicBufferListener {
  void onMusicPackage(MusicPackageMsg package);

  void onMusicAvailable(String peerId, ResourceAvailabilityMsg resource);
}

class P2pNetwork with Disposable {
  final _peers = PeersContainer(TcpServer());

  final _receivedMessage = StreamController<P2pMessageEvent>.broadcast();
  MusicPlayerListener? _musicPlayerListener;
  MusicProviderListener? _musicProviderListener;
  MusicBufferListener? _musicBufferListener;

  bool _initialized = false;

  Stream<P2pMessageEvent> get messageReceived => _receivedMessage.stream;

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

  Future<void> sendToPeer(String peerId, P2pMessage message) async {
    await _peers.sendToPeer(peerId, message);
  }

  Future<void> sendToOthers(P2pMessage message) async {
    await _peers.sendToAll(message);
  }

  Future<void> sendMessage(P2pMessage message) async {
    await _peers.sendToAll(message);
  }

  void _handleMessage(P2pMessageEvent event) {
    final message = event.message;
    if (message is RequestStateUpdateMsg) {
      _peers.sendToPeer(
          event.peerId,
          P2pMessage.stateUpdateMsg(
            devices: _peers.allIds,
            queue: _musicPlayerListener?.getQueue() ?? [],
            queuePosition: 0,
          ));
    } else if (message is StateUpdateMsg) {
      connectDevices(message.devices);
      _musicPlayerListener!.updateQueue(message.queue);
    } else if (message is MusicPackageMsg) {
      _musicBufferListener?.onMusicPackage(message);
    } else if (message is AddSongToQueueMsg) {
      _musicPlayerListener?.addToQueue(message.songData);
    } else if (message is SearchResourceMsg) {
      _handelSearchResource(message, event.peerId);
    } else if (message is RequestResourceMsg) {
      _handleRequestResource(message, event.peerId);
    } else if (message is PlayMsg) {
      _musicPlayerListener?.onPlay(message.index, message.time,
          songPosition: message.songPosition);
    } else if (message is PauseMsg) {
      _musicPlayerListener?.onPause();
    } else if (message is SyncMsg) {
      _musicPlayerListener?.onSync();
    } else if (message is ResourceAvailabilityMsg) {
      _musicBufferListener?.onMusicAvailable(event.peerId, message);
    }

    _receivedMessage.add(event);
  }

  void _handelSearchResource(SearchResourceMsg msg, String peerId) async {
    final isAvailable =
        await _musicProviderListener?.isSongAvailable(msg.songId);

    if (isAvailable == true) {
      sendToPeer(peerId, P2pMessage.resourceAvailability(songId: msg.songId));
    }
  }

  void _handleRequestResource(RequestResourceMsg msg, String peerId) async {
    final bytes =
        await _musicProviderListener?.getSongBytes(msg.songId, msg.startIndex);

    if (bytes == null) {
      logger.w("_handleRequestResource bytes == null");
      return;
    }

    sendToPeer(
        peerId,
        P2pMessage.musicPackage(
          requestId: msg.requestId,
          songId: msg.songId,
          startIndex: msg.startIndex,
          serializedBytes: MusicPackageMsgExt.serializeBytes(bytes),
        ));
  }

  void _onPeerConnected(String peerId) {
    if (!_initialized) {
      _initialized = true;
      _peers.sendToPeer(peerId, const P2pMessage.requestStateUpdate());
    }
  }

  void connectDevices(List<String> peersIds) {
    for (final ip in peersIds) {
      connect(ip);
    }
  }

  Future<void> connect(String peerId) async {
    if (!_peers.contains(peerId)) {
      await _peers.connect(peerId);
    }
  }

  @override
  void dispose() {
    _peers.dispose();
    super.dispose();
  }
}
