import 'package:flutter/foundation.dart';
import 'package:sound_share/common/utils/iterable_extensions.dart';
import 'package:sound_share/domain/music/package/music_package.dart';
import 'package:sound_share/domain/music/song/song.dart';

/// Reads the music in packages from the selected file
class MusicReader {
  late Iterator<MusicPackage> _packages;
  MusicReader(MusicSong song) {
    List<MusicPackage> arr = [];
    song.file
        .readAsBytesSync()
        .chunked(10000)
        .toList()
        .asMap()
        .forEach((index, element) {
      arr.add(MusicPackage(
          startIndex: index * 10000,
          endIndex: (index + 1) * 10000 - 1,
          songId: song.songId,
          data: Uint8List.fromList(element)));
    });
    _packages = arr.iterator;
  }

  MusicPackage? next() {
    if (_packages.moveNext()) {
      return _packages.current;
    } else {
      return null;
    }
  }
}
