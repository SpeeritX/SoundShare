import 'dart:typed_data';

import 'package:sound_share/domain/music/package/details_package.dart';
import 'package:sound_share/domain/music/player/bytes_audio_source.dart';
import 'package:sound_share/domain/music/song/song.dart';

class MusicBufferCollection {
  static const maxSongs = 10;
  Map<String, BytesAudioSource> songs = {};

  void addSong(DetailsPackage musicInfo) {}

  void removeSong(String id) {
    throw UnimplementedError();
  }

  void onBytesReceived(String id, Uint8List bytes) {}

  BytesAudioSource getSong(MusicSong musicResource) {
    throw UnimplementedError();
  }
}
