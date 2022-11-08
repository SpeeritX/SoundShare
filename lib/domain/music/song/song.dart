import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:id3/id3.dart';
import 'package:media_info/media_info.dart';
import 'package:sound_share/common/logger.dart';

class MusicSong {
  final File file;
  MusicSong({required this.file});

  /// returns { duration, artist, title, album, apic: { mime, textEncoding, picType, description, base64 }, songId}
  getAttributes() async {
    List<int> mp3Bytes = await file.readAsBytes();
    MP3Instance mp3instance = MP3Instance(mp3Bytes);
    Map<String, dynamic>? attributes;
    if (mp3instance.parseTagsSync()) {
      try {
        attributes = mp3instance.getMetaTags();
      } catch (e, st) {
        logger.e("Failed to read song attributes", e, st);
      }
    }
    Duration? duration;
    try {
      duration = (await MediaInfo().getMediaInfo(file.path))['duration'];
    } catch (e, st) {
      logger.e("Failed to read song duration", e, st);
    }
    return {
      'duration': duration,
      'artist': attributes?['Artist'],
      'title': attributes?['Title'],
      'album': attributes?['Album'],
      'apic': attributes?['APIC'],
      'songId': md5.convert(await file.readAsBytes()).toString()
    };
  }
}
