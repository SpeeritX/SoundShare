import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:sound_share/common/logger.dart';
import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/domain/music/buffer/music_buffer_collection.dart';
import 'package:sound_share/domain/music/reader/music_reader.dart';
import 'package:sound_share/domain/music/song/song.dart';
import 'package:sound_share/domain/network/p2p/p2p_messages.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';

class MusicProvider with Disposable implements MusicProviderListener {
  final MusicBufferCollection _bufferCollection;
  final P2pNetwork _p2pNetwork;
  final _songs = List<MusicSong>.empty(growable: true);
  var musicChunkSize = MusicReader.defaultChunkSize;

  MusicProvider(this._p2pNetwork, this._bufferCollection) {
    _p2pNetwork.musicProviderListener = this;
    _p2pNetwork.messageReceived.listen((event) {
      final message = event.message;
      if (message is SetMusicChunkSizeMsg) {
        musicChunkSize = message.size;
      }
    }).canceledBy(this);
  }

  void addSong(MusicSong song) {
    _songs.add(song);
  }

  void removeSong(int index) {
    if (index >= 0 && index < _songs.length) {
      _songs.removeAt(index);
    }
  }

  @override
  Future<bool> isSongAvailable(String id) async {
    if (_bufferCollection.contains(id)) {
      final song = _bufferCollection.getSong(id);
      if (song.isDownloaded) {
        return true;
      }
    }

    final song = _songs.firstWhereOrNull((e) => e.details.songId == id);
    return song != null;
  }

  @override
  void dispose() {
    _p2pNetwork.musicProviderListener = null;
    super.dispose();
  }

  @override
  Future<Uint8List?> getSongBytes(String songId, int startIndex) async {
    if (_bufferCollection.contains(songId)) {
      final song = _bufferCollection.getSong(songId);
      if (song.isDownloaded) {
        return Uint8List.fromList(
            (song.bytes.sublist(startIndex).take(musicChunkSize).toList()));
      }
    }

    final song = _songs.firstWhereOrNull((e) => e.details.songId == songId);
    if (song == null) {
      logger.w("Failed to find loaded song $songId");
      return null;
    }
    var reader = MusicReader(song, musicChunkSize);
    return await reader.getBytes(startIndex);
  }
}
