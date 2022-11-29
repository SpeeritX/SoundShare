import 'dart:async';

import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sound_share/common/logger.dart';
import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/domain/music/buffer/music_buffer_controller.dart';
import 'package:sound_share/domain/music/package/details_package.dart';
import 'package:sound_share/domain/music/package/music_package.dart';
import 'package:sound_share/domain/music/player/bytes_audio_source.dart';
import 'package:sound_share/domain/music/player/music_queue.dart';
import 'package:sound_share/domain/music/synchronization/play_synchronizer.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';
import 'package:sound_share/domain/network/p2p/synchronized_clock.dart';

class MusicPlayer with Disposable implements MusicPlayerListener {
  static const songPlayDelay = Duration(seconds: 3);

  final _player = AudioPlayer();
  final MusicBufferController _musicBuffer;
  final MusicQueue _musicQueue;
  AudioSession? _session;
  var _source = BytesAudioSource(null);
  Timer? _timer;
  DetailsPackage? _currentSong;
  Duration? _songPosition = const Duration();
  DateTime _nextSongTime = DateTime.now();

  Stream<PlayerState> get playerState => _player.playerStateStream;

  Duration? get songPosition => _songPosition;

  MusicPlayer(this._musicBuffer, this._musicQueue) {
    _player.processingStateStream.listen((event) {
      if (event == ProcessingState.completed) {
        final song = _musicQueue.nextSong();
        _playSong(song, _nextSongTime, Duration.zero);
      }
    }).canceledBy(this);
    AudioSession.instance.then((value) {
      _session = value;
      _session!.configure(const AudioSessionConfiguration.music());
    });
  }

  Future<void> _setSong(DetailsPackage song) async {
    if (_currentSong?.songId == song.songId) {
      return;
    }
    _currentSong = song;
    logger.d("#### Set new song ${song.bytesLength}");

    final source = _musicBuffer.getSong(song);
    _source = source;
    pause();
    try {
      await _player.setAudioSource(source);
    } on PlayerInterruptedException catch (_) {
      logger.w("setAudioSource interrupted");
    }
  }

  void addPackage(MusicPackage package) {
    logger.d("#### Add song package ${package.data.length}");
    _source.addData(package.startIndex, package.data.toList());
  }

  Duration? getCurrentSongDuration() {
    return _player.duration;
  }

  Duration? getCurrentSongPosition() {
    return _player.position;
  }

  void pause() {
    _songPosition = _player.position;
    _player.pause();
  }

  Future<void> stop() async {
    await _player.stop();
  }

  Future<void> _playSong(
      DetailsPackage song, DateTime time, Duration songPosition) async {
    _nextSongTime = time.add(song.duration + songPlayDelay);
    logger.d("NEXT SONG TIME: ${_nextSongTime}");
    await _setSong(song);
    final position = songPosition +
        SynchronizedClock.now().difference(time) +
        PlaySynchronizer.instance.playOffset;

    if (position.isNegative) {
      _player.seek(Duration.zero);
      _timer?.cancel();
      _timer = Timer(-position + Duration(milliseconds: 200), () {
        _player.play();
      });
    } else {
      _player.seek(position);
      _timer?.cancel();
      _timer = Timer(Duration(milliseconds: 200), () {
        _player.play();
      });
    }
  }

  @override
  void addToQueue(DetailsPackage song) {
    _musicQueue.addSong(song);
  }

  @override
  List<DetailsPackage> getQueue() {
    return _musicQueue.songList;
  }

  @override
  void onPause() {
    pause();
  }

  @override
  void onPlay(int index, DateTime time, {Duration? songPosition}) async {
    _musicQueue.setIndex(index);
    final song = _musicQueue.currentSong;
    if (song == null) {
      logger.e("onPlay song index '$index' is null");
      return;
    }
    _playSong(song, time, songPosition ?? Duration.zero);
  }

  @override
  void removeFromQueue(int index) {
    _musicQueue.removeSong(index);
  }

  @override
  void updateQueue(List<DetailsPackage> songs) {
    if (_musicQueue.songList.isEmpty) {
      for (var song in songs) {
        _musicQueue.addSong(song);
      }
    }
  }

  @override
  void dispose() {
    _player.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
