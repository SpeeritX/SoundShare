import 'dart:async';
import 'dart:math';

import 'package:audio_session/audio_session.dart';
import 'package:audio_streamer/audio_streamer.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sound_share/domain/music/synchronization/play_synchronizer.dart';

class Synchronization {
  Synchronization();
  final AudioStreamer _streamer = AudioStreamer();
  final _player = AudioPlayer(); // Create a player
  AudioSession? _session;

  final List<double> _audio = [];
  final List<double> _maxSounds = [];
  final List<int> _miliseconds = [];

  DateTime? started;

  void _onAudio(List<double> buffer) {
    _audio.addAll(buffer);
  }

  void _onError() {
    throw Exception("Error recording");
  }

  void _chunkStats(int i) {
    var duration =
        (1000 * _audio.length.toDouble() / AudioStreamer.sampleRate.toDouble());
    var actualDuration = DateTime.now().millisecondsSinceEpoch -
        (started?.millisecondsSinceEpoch ?? 0);
    var maxSound = _audio.reduce(max);
    _maxSounds.add(maxSound);
    try {
      var firstBeep = _audio.firstWhere((element) => element > maxSound * 0.8);
      _miliseconds.add((((_audio.indexOf(firstBeep).toDouble() /
                      AudioStreamer.sampleRate.toDouble() *
                      1000) /
                  duration) *
              actualDuration)
          .floor());
      var idx = _audio.indexOf(_maxSounds[i]);
      print(_audio.sublist(idx - 3, idx + 3));
    } catch (e) {
      print(e);
    }

    _audio.clear();
  }

  Future<void> _play() async {
    try {
      await _player.play();
    } catch (e) {
      print(e);
    }
  }

  Future<void> sync() async {
    _session = await AudioSession.instance;
    await _session!.configure(const AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
      avAudioSessionCategoryOptions:
          AVAudioSessionCategoryOptions.defaultToSpeaker,
      avAudioSessionMode: AVAudioSessionMode.videoChat,
      avAudioSessionRouteSharingPolicy:
          AVAudioSessionRouteSharingPolicy.defaultPolicy,
      avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      androidAudioAttributes: AndroidAudioAttributes(
        contentType: AndroidAudioContentType.sonification,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.unknown,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      androidWillPauseWhenDucked: true,
    ));
    if (await _session!.setActive(true)) {
      try {
        _streamer.start(_onAudio, _onError);
      } catch (error) {
        throw Exception("Error recording");
      }
      _player.setVolume(1);
      started = DateTime.now();
      await Future.delayed(const Duration(milliseconds: 3000));
      _chunkStats(0);
      for (int i = 1; i < 15; i++) {
        _player.setAsset("assets/beep.mp3");
        started = DateTime.now();
        _play();
        await Future.delayed(const Duration(milliseconds: 1700));
        _chunkStats(i);
        if (i > 3 &&
            _miliseconds.last < _miliseconds[_miliseconds.length - 2] * 1.1 &&
            _miliseconds.last > _miliseconds[_miliseconds.length - 2] * 0.9 &&
            _miliseconds.last < _miliseconds[_miliseconds.length - 3] * 1.1 &&
            _miliseconds.last > _miliseconds[_miliseconds.length - 3] * 0.9) {
          break;
        }
      }
      try {
        await _streamer.stop();
        await _player.stop();
      } catch (e) {
        return;
      }
      print(_maxSounds.toString());
      print(_miliseconds.toString());
      _miliseconds.sort();
      await _session?.setActive(false);

      final offset = (_miliseconds
                  .sublist(_miliseconds.length - 3)
                  .reduce((val, el) => val + el) /
              3)
          .floor();
      PlaySynchronizer.instance.measuredOffset = Duration(milliseconds: offset);
    } else {
      print("Session did not activate.");
    }
  }
}
