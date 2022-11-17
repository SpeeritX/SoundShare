import 'package:flutter/foundation.dart';
import 'package:sound_share/common/utils/iterable_extensions.dart';
import 'package:sound_share/domain/music/package/music_package.dart';
import 'package:sound_share/domain/music/song/song.dart';

/// Reads the music in packages from the selected file
class MusicReader {
  static const chunkSize = 10000;
  final MusicSong _song;
  late Iterator<MusicPackage> _packages;

  MusicReader(this._song) {
    List<MusicPackage> arr = [];
    _song.file
        .readAsBytesSync()
        .chunked(chunkSize)
        .toList()
        .asMap()
        .forEach((index, element) {
      arr.add(MusicPackage(
          startIndex: index * chunkSize,
          endIndex: (index + 1) * chunkSize - 1,
          songId: _song.details.songId,
          data: Uint8List.fromList(element)));
    });
    _packages = arr.iterator;
  }

  Future<Uint8List> getBytes(int startIndex) async {
    return Uint8List.fromList((await _song.file.readAsBytes())
        .sublist(startIndex)
        .take(chunkSize)
        .toList());
  }

  MusicPackage? next() {
    if (_packages.moveNext()) {
      return _packages.current;
    } else {
      return null;
    }
  }
}
