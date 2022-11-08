import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:id3/id3.dart';
import 'package:media_info/media_info.dart';

class MusicSong {
  final File file;
  MusicSong({required this.file});

  /// returns { duration, artist, title, album, apic: { mime, textEncoding, picType, description, base64 }, songId}
  getAttributes() async {
    List<int> mp3Bytes = await file.readAsBytes();
    MP3Instance mp3instance = MP3Instance(mp3Bytes);
    Map<String, dynamic>? attributes;
    if (mp3instance.parseTagsSync()) {
      attributes = mp3instance.getMetaTags();
    }
    return {
      'duration': (await MediaInfo().getMediaInfo(file.path))['duration'],
      'artist': attributes?['Artist'],
      'title': attributes?['Title'],
      'album': attributes?['Album'],
      'apic': attributes?['APIC'],
      'songId': md5.convert(await file.readAsBytes())
    };
  }
}
