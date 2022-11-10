import 'dart:async';

import 'package:sound_share/domain/music/package/details_package.dart';

class MusicQueue {
  final _updateEvents = StreamController<void>.broadcast();
  List<DetailsPackage> songList = [];
  int _currentSongIndex = 0;

  int get currentSongIndex => _currentSongIndex;

  Stream<void> get updateEvents => _updateEvents.stream;

  DetailsPackage previousSong() {
    _currentSongIndex = _currentSongIndex - 1;
    if (_currentSongIndex < 0) {
      _currentSongIndex = songList.length - 1;
    }

    _notifyUpdate();
    return songList[_currentSongIndex];
  }

  DetailsPackage nextSong() {
    _currentSongIndex = _currentSongIndex + 1;
    if (_currentSongIndex >= songList.length) {
      _currentSongIndex = 0;
    }

    _notifyUpdate();
    return songList[_currentSongIndex];
  }

  void addSong(DetailsPackage song) {
    if (songList.length >= 100) {
      if (_currentSongIndex != 0) {
        songList.removeAt(0);
        _currentSongIndex = _currentSongIndex - 1;
      } else {
        songList.removeAt(songList.length - 1);
      }
    }
    songList.add(song);

    _notifyUpdate();
  }

  void removeSong(int index) {
    if (_currentSongIndex >= index) {
      _currentSongIndex = _currentSongIndex - 1;
    }
    songList.removeAt(index);

    _notifyUpdate();
  }

  void _notifyUpdate() {
    _updateEvents.add(null);
  }
}
