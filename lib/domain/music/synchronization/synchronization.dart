import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:audio_streamer/audio_streamer.dart';
import 'package:audioplayers/audioplayers.dart';

class Synchronization {
  Synchronization();
  final AudioStreamer _streamer = AudioStreamer();
  final _player = AudioPlayer(); // Create a player

  final List<double> _audio = [];
  final List<double> _maxSounds = [];
  final List<int> _miliseconds = [];

  void _onAudio(List<double> buffer) {
    _audio.addAll(buffer);
  }

  void _onError() {
    throw Exception("Error recording");
  }

  void _chunkStats(int i) {
    _maxSounds.add(_audio.reduce(max));
    _miliseconds.add((_audio.indexOf(_maxSounds[i]).toDouble() /
            AudioStreamer.sampleRate.toDouble() *
            1000)
        .floor());
    _audio.clear();
  }

  Future<Duration> sync() async {
    try {
      _streamer.start(_onAudio, _onError);
    } catch (error) {
      throw Exception("Error recording");
    }
    _player.setVolume(1);
    await Future.delayed(const Duration(milliseconds: 1700));
    _chunkStats(0);
    _player.play(AssetSource('beep.mp3'));
    await Future.delayed(const Duration(milliseconds: 1700));
    _chunkStats(1);
    _player.play(AssetSource('beep.mp3'));
    await Future.delayed(const Duration(milliseconds: 1700));
    _chunkStats(2);
    _player.play(AssetSource('beep.mp3'));
    await Future.delayed(const Duration(milliseconds: 1700));
    _chunkStats(3);
    _player.play(AssetSource('beep.mp3'));
    await Future.delayed(const Duration(milliseconds: 1700));
    _chunkStats(4);
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
