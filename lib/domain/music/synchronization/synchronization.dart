import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:audio_streamer/audio_streamer.dart';
import 'package:just_audio/just_audio.dart';

class Synchronization {
  Synchronization();
  final AudioStreamer _streamer = AudioStreamer();
  final _player = AudioPlayer(); // Create a player

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
    var maxInd = (_audio.indexOf(maxSound));
    _maxSounds.add(maxSound);
    var firstBeep = _audio.firstWhere((element) => element > maxSound * 0.9);
    _miliseconds.add((((_audio.indexOf(firstBeep).toDouble() /
                    AudioStreamer.sampleRate.toDouble() *
                    1000) /
                duration) *
            actualDuration)
        .floor());
    var idx = _audio.indexOf(_maxSounds[i]);
    print(_audio.sublist(idx - 3, idx + 3));
    _audio.clear();
  }

  Future<Duration> sync() async {
    try {
      _streamer.start(_onAudio, _onError);
    } catch (error) {
      throw Exception("Error recording");
    }
    started = DateTime.now();
    await Future.delayed(const Duration(milliseconds: 1700));
    _chunkStats(0);
    started = DateTime.now();
    for (int i = 1; i < 7; i++) {
      _player.setAsset("assets/beep.mp3");
      _player.play();
      await Future.delayed(const Duration(milliseconds: 1700));
      _chunkStats(i);
      started = DateTime.now();
    }
    return await _stop();
  }

  Future<Duration> _stop() async {
    try {
      await _streamer.stop();
      await _player.stop();
    } catch (e) {
      return const Duration();
    }
    print(_maxSounds.toString());
    print(_miliseconds.toString());
    _miliseconds.sort();
    return Duration(
        milliseconds: _miliseconds[(_miliseconds.length / 2).floor()]);
  }
}
