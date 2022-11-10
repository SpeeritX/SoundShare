import 'package:flutter_test/flutter_test.dart';
import 'package:sound_share/domain/music/package/details_package.dart';
import 'package:sound_share/domain/music/player/music_queue.dart';

void main() {
  DetailsPackage createSong(String id) {
    return DetailsPackage(
      songId: id,
      duration: Duration.zero,
      artist: "",
      title: "",
      album: "",
      apic: null,
    );
  }

  test('Song should be added to queue', () {
    MusicQueue musicQueue = MusicQueue();

    final song0 = createSong("0");
    final song1 = createSong("1");
    final song2 = createSong("2");
    final song3 = createSong("3");

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

    expect(musicQueue.songList[0].songId, "1");
  });

  test('Song should be removed from queue', () {
    MusicQueue musicQueue = MusicQueue();

    final song = createSong("1");
    musicQueue.addSong(song);

    musicQueue.removeSong(0);

    expect(musicQueue.songList, []);
  });

  test('Previous song', () {
    MusicQueue musicQueue = MusicQueue();

    final song1 = createSong("1");
    musicQueue.addSong(song1);
    final song2 = createSong("2");
    musicQueue.addSong(song2);
    final song3 = createSong("3");
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

    final song1 = createSong("1");
    musicQueue.addSong(song1);
    final song2 = createSong("2");
    musicQueue.addSong(song2);
    final song3 = createSong("3");
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
