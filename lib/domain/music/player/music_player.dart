import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sound_share/domain/music/music_package.dart';
import 'package:sound_share/domain/music/player/stream_source.dart';

extension IterableExtensions<E> on Iterable<E> {
  Iterable<List<E>> chunked(int chunkSize) sync* {
    if (length <= 0) {
      yield [];
      return;
    }
    int skip = 0;
    while (skip < length) {
      final chunk = this.skip(skip).take(chunkSize);
      yield chunk.toList(growable: false);
      skip += chunkSize;
      if (chunk.length < chunkSize) return;
    }
  }
}
/// Plays the music from the received packages
class MusicPlayer {
  final player = AudioPlayer();
  MusicPlayer();

  void loadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      final bytes = await file.readAsBytes();
      var packages = bytes.toList().chunked((bytes.length/6).floor());
      for(var package in packages) {
        player.setAudioSource(BytesAudioSource(package));
        await Future.delayed(Duration(milliseconds: 100));
      }
    } else {
      // User canceled the picker
    }
  }

  void addPackage(MusicPackage package) {
    throw UnimplementedError();
  }

  void play() {
    player.play();
  }

  void pause() {
    player.pause();
  }

  void stop() {
    player.stop();
  }
}
