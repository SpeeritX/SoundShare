import 'package:sound_share/domain/music/player/music_resource.dart';

class MusicQueue {
  SongResource previousSong() {
    throw UnimplementedError();
  }

  SongResource nextSong() {
    throw UnimplementedError();
  }

  void addSong(SongResource music) {}

  void removeSong(SongResource music) {}
}
