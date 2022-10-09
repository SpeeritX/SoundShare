import 'dart:io';

import 'package:sound_share/domain/music/music_package.dart';

/// Reads the music in packages from the selected file
class MusicReader {
  MusicReader({
    required File file,
  });

  Future<MusicPackage> next() {
    throw UnimplementedError();
  }
}
