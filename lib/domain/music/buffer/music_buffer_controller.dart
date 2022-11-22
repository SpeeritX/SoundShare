import 'dart:async';

import 'package:sound_share/common/logger.dart';
import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/domain/music/buffer/music_buffer_collection.dart';
import 'package:sound_share/domain/music/buffer/songs_availability_index.dart';
import 'package:sound_share/domain/music/package/details_package.dart';
import 'package:sound_share/domain/music/player/bytes_audio_source.dart';
import 'package:sound_share/domain/music/player/music_queue.dart';
import 'package:sound_share/domain/network/p2p/p2p_messages.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';

class MusicBufferController with Disposable implements MusicBufferListener {
  final MusicQueue _queue;
  final P2pNetwork _p2pNetwork;
  final bufferCollection = MusicBufferCollection();
  late final _songsIndex = SongsAvailabilityIndex(_p2pNetwork);

  final Map<String, Timer> _requestsInProgress = {};

  MusicBufferController(this._queue, this._p2pNetwork) {
    _p2pNetwork.musicBufferListener = this;

    _queue.updateEvents.listen((_) {
      _updateBuffer();
    }).canceledBy(this);

    bufferCollection.onDownloadFinished.listen((_) {
      _updateBuffer();
    }).canceledBy(this);
  }

  @override
  void onMusicPackage(MusicPackageMsg package) {
    _requestsInProgress[package.requestId]?.cancel();
    _requestsInProgress.remove(package.requestId);

    bufferCollection.onMusicPackage(
        package.songId, package.startIndex, package.deserializeBytes());
    _updateBuffer();
  }

  BytesAudioSource getSong(DetailsPackage song) {
    if (!bufferCollection.contains(song.songId)) {
      _addSongToBuffer(song);
    }

    return bufferCollection.getSong(song.songId);
  }

  void _updateBuffer() {
    if (_requestsInProgress.isNotEmpty) {
      // Still waiting for some requests to finish
      return;
    }

    final songs = _queue.getQueuedSongs();
    for (final song in songs.take(MusicBufferCollection.maxSongs)) {
      if (!bufferCollection.contains(song.songId)) {
        _addSongToBuffer(song);
      }
      if (!bufferCollection.isSongDownloaded(song.songId)) {
        final startIndex = bufferCollection.getNextPackageIndex(song.songId);
        _requestData(song.songId, startIndex);
        return;
      }
    }
  }

  void _addSongToBuffer(DetailsPackage song) {
    bufferCollection.addSong(song);
  }

  Future<void> _requestData(String songId, int startIndex) async {
    final requestId = "$startIndex|$songId";
    // TODO: refactor
    final timer = Timer(const Duration(seconds: 2), () {
      _requestsInProgress.remove(requestId);
      logger.w("Request timeout $requestId");
      _updateBuffer();
    });
    _requestsInProgress[requestId] = timer;

    final peer = await _songsIndex.getPeer(songId, startIndex);
    if (peer == null) {
      // TODO handle in the UI?
      logger.e("Failed to find peer with song $songId");
      return;
    }
    _p2pNetwork.sendToPeer(
        peer,
        P2pMessage.requestResource(
          requestId: requestId,
          songId: songId,
          startIndex: startIndex,
        ));
  }

  @override
  void dispose() {
    _p2pNetwork.musicBufferListener = this;
    for (var timer in _requestsInProgress.values) {
      timer.cancel();
    }
    _requestsInProgress.clear();
    super.dispose();
  }

  @override
  void onMusicAvailable(String peerId, ResourceAvailabilityMsg resource) {
    _songsIndex.onMusicAvailable(peerId, resource);
  }
}
