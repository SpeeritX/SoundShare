import 'dart:async';

import 'package:sound_share/common/logger.dart';
import 'package:sound_share/domain/music/package/details_package.dart';

class MusicQueue {
  final _updateEvents = StreamController<void>.broadcast();
  List<DetailsPackage> songList = [];
  int _currentSongIndex = 0;

  int get currentSongIndex => _currentSongIndex;

  set currentSongIndex(int value) {
    if (value < 0) {
      logger.e("Index out of bound");
      value = songList.length - 1;
    }

    if (value >= songList.length) {
      logger.e("Index out of bound");
      value = 0;
    }

    _currentSongIndex = value;

    _notifyUpdate();
  }

  DetailsPackage? get currentSong {
    if (_currentSongIndex >= songList.length) {
      return null;
    }
    return songList[_currentSongIndex];
  }

  Stream<void> get updateEvents => _updateEvents.stream;

  List<DetailsPackage> getQueuedSongs() {
    if (_currentSongIndex >= songList.length) {
      return [];
    }
    return songList.sublist(_currentSongIndex);
  }

  void setIndex(int index) {
    _currentSongIndex = index;
    _notifyUpdate();
  }

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
    if (_currentSongIndex >= index && _currentSongIndex > 0) {
      _currentSongIndex = _currentSongIndex - 1;
    }
    songList.removeAt(index);
    _notifyUpdate();
  }

  void _notifyUpdate() {
    _updateEvents.add(null);
  }
}
