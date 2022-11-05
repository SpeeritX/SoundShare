import 'package:flutter_test/flutter_test.dart';
import 'package:sound_share/domain/music/player/music_queue.dart';

import 'package:sound_share/domain/music/player/music_resource.dart';

void main() {
  test('Song should be added to queue', () {
    MusicQueue musicQueue = MusicQueue();

    SongResource song0 = SongResource("0");
    SongResource song1 = SongResource("1");
    SongResource song2 = SongResource("2");
    SongResource song3 = SongResource("3");

    musicQueue.addSong(song0);
    musicQueue.addSong(song1);
    musicQueue.addSong(song2);
    musicQueue.addSong(song3);

    expect(musicQueue.songList, [song0, song1, song2, song3]);

    for (int i = 0; i < 96; i++) {
      musicQueue.addSong(song1);
    }

    musicQueue.nextSong();
    musicQueue.addSong(song1);

    expect(musicQueue.songList[0].id, "1");
  });

  test('Song should be removed from queue', () {
    MusicQueue musicQueue = MusicQueue();

    SongResource song = SongResource("1");
    musicQueue.addSong(song);

    musicQueue.removeSong(0);

    expect(musicQueue.songList, []);
  });

  test('Previous song', () {
    MusicQueue musicQueue = MusicQueue();

    SongResource song1 = SongResource("1");
    musicQueue.addSong(song1);
    SongResource song2 = SongResource("2");
    musicQueue.addSong(song2);
    SongResource song3 = SongResource("3");
    musicQueue.addSong(song3);

    musicQueue.previousSong();
    expect(musicQueue.currentSongIndex, 2);

    musicQueue.previousSong();
    expect(musicQueue.currentSongIndex, 1);

    musicQueue.previousSong();
    expect(musicQueue.currentSongIndex, 0);
  });

  test('Next song', () {
    MusicQueue musicQueue = MusicQueue();

    SongResource song1 = SongResource("1");
    musicQueue.addSong(song1);
    SongResource song2 = SongResource("2");
    musicQueue.addSong(song2);
    SongResource song3 = SongResource("3");
    musicQueue.addSong(song3);

    musicQueue.nextSong();
    musicQueue.nextSong();
    expect(musicQueue.currentSongIndex, 2);

    musicQueue.nextSong();
    expect(musicQueue.currentSongIndex, 0);

    musicQueue.nextSong();
    expect(musicQueue.currentSongIndex, 1);
  });
}
