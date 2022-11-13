import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:sound_share/common/logger.dart';
import 'package:sound_share/domain/music/package/details_package.dart';
import 'package:sound_share/domain/music/package/music_package.dart';
import 'package:sound_share/domain/music/buffer/music_buffer.dart';
import 'package:sound_share/domain/music/player/music_queue.dart';
import 'package:sound_share/domain/music/player/bytes_audio_source.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';

/// Plays the music from the received packages
class MusicPlayer implements MusicPlayerListener {
  final _player = AudioPlayer();
  final MusicBufferCollection _musicBuffer;
  final MusicQueue _musicQueue;
  var _source = BytesAudioSource(null);

  MusicPlayer(this._musicBuffer, this._musicQueue) {
    //_player.setAudioSource(_source);
  }

  Future<void> setSong(int? length) async {
    logger.d("#### Set new song $length");
    _source = BytesAudioSource(length);
    await _player.setAudioSource(_source);
  }

  void addPackage(MusicPackage package) {
    logger.d("#### Add song package ${package.data.length}");
    _source.addData(package.data.toList());
  }

  Future<void> play() async {
    await _player.play();
  }

  void pause() {
    _player.pause();
  }

  Future<void> stop() async {
    await _player.stop();
  }

  @override
  void addToQueue(int index) {
    // TODO: implement addToQueue
  }

  @override
  void onPause() {
    // TODO: implement onPause
  }

  @override
  void onPlay() {
    // TODO: implement onPlay
  }

  @override
  void removeFromQueue(int index) {
    // TODO: implement removeFromQueue
  }

  @override
  void startNewSong(DetailsPackage songData) async {
    stop();
    setSong(songData.bytesLength);
    play();
  }

  @override
  void updateQueue() {
    // TODO: implement updateQueue
  }
}
