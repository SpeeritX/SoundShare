import 'dart:io';
import 'package:path/path.dart';

import 'package:security_scoped_resource/security_scoped_resource.dart';

/// Set music directory
class MusicDirectory {
  var _path = "";
  MusicDirectory();

  load(String path) async {
    _path = path;
    if(Platform.isIOS) await SecurityScopedResource.instance.startAccessingSecurityScopedResource(Directory(path));
    var fileList = await Directory(path).list().toList();
    List<File> files = fileList.whereType<File>().where((i) => extension(i.path) == '.mp3').toList();
    return files;
  }

  relinquish() async {
    if(Platform.isIOS) await SecurityScopedResource.instance.stopAccessingSecurityScopedResource(Directory(_path));
  }
}
