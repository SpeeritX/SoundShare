import 'package:sound_share/domain/music/player/music_resource.dart';

class MusicQueue {
  List<SongResource> songList = [];
  int _currentSongIndex = 0;

  int get currentSongIndex => _currentSongIndex;

  SongResource previousSong() {
    _currentSongIndex = _currentSongIndex - 1;
    if (_currentSongIndex < 0) {
      _currentSongIndex = songList.length - 1;
    }
    return songList[_currentSongIndex];
  }

  SongResource nextSong() {
    _currentSongIndex = _currentSongIndex + 1;
    if (_currentSongIndex >= songList.length) {
      _currentSongIndex = 0;
    }
    return songList[_currentSongIndex];
  }

  void addSong(SongResource song) {
    if (songList.length >= 100) {
      if (_currentSongIndex != 0) {
        songList.removeAt(0);
        _currentSongIndex = _currentSongIndex - 1;
      } else {
        songList.removeAt(songList.length - 1);
      }
    }
    songList.add(song);
  }

  void removeSong(int index) {
    if (_currentSongIndex >= index) {
      _currentSongIndex = _currentSongIndex - 1;
    }
    songList.removeAt(index);
  }
}
