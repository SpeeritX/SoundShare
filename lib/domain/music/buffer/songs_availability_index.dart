import 'dart:async';

import 'package:collection/collection.dart';
import 'package:sound_share/domain/network/p2p/p2p_messages.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';

const searchTimeout = Duration(milliseconds: 1000);
const searchAgainDuration = Duration(milliseconds: 5000);

class SongIndex {
  DateTime lastUpdate;
  bool _updating = false;

  final Map<String, DateTime> _peers = {};

  bool get isUpdating => _updating;

  SongIndex(this.lastUpdate);

  void setUpdating() {
    _updating = true;
  }

  void addPeer(String peerId) {
    if (_updating) {
      _peers.clear();
      _updating = false;
    }
    _peers[peerId] = DateTime.now();
  }

  List<String> getActivePeers() {
    if ((DateTime.now().difference(lastUpdate)) > searchTimeout && isUpdating) {
      _updating = false;
      _peers.clear();
    }
    return _peers.keys.toList();
  }
}

class SongsAvailabilityIndex {
  final P2pNetwork _p2pNetwork;
  final Map<String, SongIndex> _songs = {};

  SongsAvailabilityIndex(this._p2pNetwork);

  Future<String?> getPeer(String songId, int startIndex) async {
    final song = _getSong(songId);

    if ((song._peers.isEmpty && !song.isUpdating) ||
        (DateTime.now().difference(song.lastUpdate)) > searchAgainDuration) {
      updateSong(songId);
      await Future.delayed(searchTimeout);
      return _songs[songId]?.getActivePeers().firstOrNull;
    }
    return song.getActivePeers().firstOrNull;
  }

  void invalidatePeer(String peerId) {}

  void onMusicAvailable(String peerId, ResourceAvailabilityMsg resource) {
    final song = _songs[resource.songId] ?? SongIndex(DateTime.now());
    song.addPeer(peerId);
    _songs[resource.songId] = song;
  }

  void updateSong(String songId) {
    final song = _getSong(songId);
    song.setUpdating();
    song.lastUpdate = DateTime.now();
    _p2pNetwork.sendMessage(P2pMessage.searchResource(songId: songId));
  }

  SongIndex _getSong(String songId) {
    if (!_songs.containsKey(songId)) {
      _songs[songId] = SongIndex(DateTime(0));
    }
    return _songs[songId]!;
  }
}
