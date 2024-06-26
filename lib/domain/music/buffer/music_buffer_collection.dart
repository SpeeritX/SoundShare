import 'dart:async';

import 'package:sound_share/common/logger.dart';
import 'package:sound_share/domain/music/package/details_package.dart';
import 'package:sound_share/domain/music/player/bytes_audio_source.dart';

class MusicBufferCollection {
  static const maxSongs = 10;
  final Map<String, BytesAudioSource> _songs = {};
  final Map<String, DateTime> _songsTime = {};
  final Map<String, Duration> _songsDownloadDuration = {};

  final _onDownloadFinished = StreamController<void>.broadcast();

  Stream<void> get onDownloadFinished => _onDownloadFinished.stream;

  void addSong(DetailsPackage songData) {
    if (_songs.containsKey(songData.songId)) {
      return;
    }
    _songs[songData.songId] = BytesAudioSource(songData.bytesLength);
    _songsTime[songData.songId] = DateTime.now();
  }

  void removeSong(String id) {
    _songs.remove(id);
  }

  void onMusicPackage(String id, int startIndex, List<int> bytes) {
    final song = _songs[id];
    if (song == null) {
      logger.e("Received unexpected package for song '$id'");
      return;
    }
    song.addData(startIndex, bytes);
    if (song.isDownloaded) {
      _onDownloadFinished.add(null);
      _songsDownloadDuration[id] = DateTime.now().difference(_songsTime[id]!);
      logger.w(_songsDownloadDuration.values.toString());
    }
  }

  BytesAudioSource getSong(String id) {
    return _songs[id]!;
  }

  bool contains(String id) {
    return _songs.containsKey(id);
  }

  bool isSongDownloaded(String songId) {
    return _songs[songId]!.isDownloaded;
  }

  int getNextPackageIndex(String songId) {
    return _songs[songId]!.getNextPackageIndex();
  }
}
