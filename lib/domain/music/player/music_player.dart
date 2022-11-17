import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:ntp/ntp.dart';
import 'package:sound_share/common/logger.dart';
import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/domain/music/buffer/music_buffer_controller.dart';
import 'package:sound_share/domain/music/package/details_package.dart';
import 'package:sound_share/domain/music/package/music_package.dart';
import 'package:sound_share/domain/music/player/bytes_audio_source.dart';
import 'package:sound_share/domain/music/player/music_queue.dart';
import 'package:sound_share/domain/music/synchronization/synchronization.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';

/// Plays the music from the received packages
class MusicPlayer with Disposable implements MusicPlayerListener {
  final _player = AudioPlayer();
  final MusicBufferController _musicBuffer;
  final MusicQueue _musicQueue;
  final Duration _playOffset;
  var _source = BytesAudioSource(null);
  var _offset = const Duration();
  Timer? _timer;

  MusicPlayer(this._musicBuffer, this._musicQueue, this._playOffset) {
    _player.processingStateStream.listen((event) {
      if (event == ProcessingState.completed) {
        final song = _musicQueue.nextSong();
        _playSong(song);
      }
    }).canceledBy(this);
  }

  Future<void> _setSong(BytesAudioSource source) async {
    _source = source;
    pause();
    await _player.setAudioSource(source);
  }

  void addPackage(MusicPackage package) {
    logger.d("#### Add song package ${package.data.length}");
    _source.addData(package.data.toList());
  }

  Future<void> play() async {
    await _player.play();
  }

  Future<void> _playSong(DetailsPackage song) async {
    logger.d("#### Set new song ${song.bytesLength}");
    final source = _musicBuffer.getSong(song);
    _setSong(source);
    play();
  }

  void pause() {
    _player.pause();
  }

  Future<void> stop() async {
    await _player.stop();
  }

  @override
  void addToQueue(DetailsPackage song) {
    _musicQueue.addSong(song);
  }

  @override
  void onPause() {
    // TODO: implement onPause
  }

  @override
  void onPlay(int index, DateTime time) {
    _musicQueue.setIndex(index);
    final song = _musicQueue.currentSong;
    if (song == null) {
      logger.e("onPlay song index '$index' is null");
      return;
    }
    _timer?.cancel();
    _timer = Timer(
        DateTime.now().difference(time) + _offset + const Duration(seconds: 10),
        () {
      _playSong(song);
    });
  }

  @override
  void removeFromQueue(int index) {
    // TODO: implement removeFromQueue
  }

  @override
  void updateQueue() {
    // TODO: implement updateQueue
  }

  @override
  void onSync() {
    NTP.getNtpOffset(localTime: DateTime.now()).then((timeOffset) =>
        _offset = Duration(milliseconds: timeOffset) + _playOffset);
  }
}
