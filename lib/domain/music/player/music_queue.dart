import 'package:sound_share/domain/music/song/song.dart';

class MusicQueue {
  MusicSong previousSong() {
    throw UnimplementedError();
  }

  MusicSong nextSong() {
    throw UnimplementedError();
  }

  void addSong(MusicSong music) {}

  void removeSong(MusicSong music) {}
}
