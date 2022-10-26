import 'package:just_audio/just_audio.dart';
import 'package:sound_share/domain/music/music_package.dart';
import 'package:sound_share/domain/music/player/stream_source.dart';

/// Plays the music from the received packages
class MusicPlayer {
  final _player = AudioPlayer();
  var _source = BytesAudioSource(0);

  MusicPlayer();

  void setSong(int length) {
    _source = BytesAudioSource(length);
    _player.setAudioSource(_source);
  }

  void addPackage(MusicPackage package) {
    _source.addData(package.data.toList());
  }

  void play() async {
    _player.play();
  }

  void pause() {
    _player.pause();
  }

  void stop() {
    _player.stop();
  }
}
