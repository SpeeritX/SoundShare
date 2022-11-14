import 'dart:io';
import 'package:path/path.dart';

import 'package:security_scoped_resource/security_scoped_resource.dart';
import 'package:sound_share/domain/music/song/song.dart';

/// Set music directory
class MusicDirectory {
  var path = "";
  bool accessed = false;
  List<MusicSong>? songs;
  MusicDirectory(this.path);

  load() async {
    if (!accessed) {
      throw Exception(
          "You have to ask for access with getAccess(). Do not forget to reliquish() when done with reading files.");
    }
    var fileList = await Directory(path).list().toList();
    var files = fileList
        .whereType<File>()
        .where((i) => extension(i.path) == '.mp3')
        .toList();
    songs = [];
    for (var file in files) {
      var song = await MusicSong.create(file: file);
      songs?.add(song);
    }
  }

  Future<void> getAccess() async {
    if (accessed) throw Exception("Already accessed!");
    if (Platform.isIOS) {
      await SecurityScopedResource.instance
          .startAccessingSecurityScopedResource(Directory(path));
    }
    accessed = true;
  }

  Future<void> relinquish() async {
    if (!accessed) throw Exception("Did not have access!");
    if (Platform.isIOS) {
      await SecurityScopedResource.instance
          .stopAccessingSecurityScopedResource(Directory(path));
    }
    accessed = false;
  }
}
