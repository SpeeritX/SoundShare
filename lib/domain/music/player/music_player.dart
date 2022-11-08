import 'package:just_audio/just_audio.dart';
import 'package:sound_share/domain/music/package/music_package.dart';
import 'package:sound_share/domain/music/player/music_buffer.dart';
import 'package:sound_share/domain/music/player/music_queue.dart';
import 'package:sound_share/domain/music/player/bytes_audio_source.dart';

/// Plays the music from the received packages
class MusicPlayer {
  final _player = AudioPlayer();
  final MusicBuffer _musicBuffer;
  final MusicQueue _musicQueue;
  var _source = BytesAudioSource(null);

  MusicPlayer(this._musicBuffer, this._musicQueue) {
    //_player.setAudioSource(_source);
  }

  void setSong(int? length) {
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
