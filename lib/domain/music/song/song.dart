import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:id3/id3.dart';
import 'package:media_info/media_info.dart';

class MusicSong {
  final File file;
  late Map<String, dynamic>? _attributes;
  MusicSong({required this.file});

  /// returns { duration, artist, title, album, apic: { mime, textEncoding, picType, description, base64 }, songId}
  getAttributes() async {
    List<int> mp3Bytes = await file.readAsBytes();
    MP3Instance mp3instance = MP3Instance(mp3Bytes);
    if (mp3instance.parseTagsSync()) {
      _attributes = mp3instance.getMetaTags();
    }
    return {
      'duration': (await MediaInfo().getMediaInfo(file.path))['duration'],
      'artist': _attributes?['Artist'],
      'title': _attributes?['Title'],
      'album': _attributes?['Album'],
      'apic': _attributes?['APIC'],
      'songId': md5.convert(await file.readAsBytes())
    };
  }
}
