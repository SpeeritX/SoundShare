import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:id3/id3.dart';
import 'package:mp3_info/mp3_info.dart';
import 'package:sound_share/common/logger.dart';

class MusicSong {
  final File file;
  late final Duration duration;
  late final String? artist;
  late final String? title;
  late final String? album;
  late final dynamic apic;
  late final String songId;
  MusicSong._create(bytes, this.songId, this.duration, {required this.file}) {
    MP3Instance mp3instance = MP3Instance(bytes);
    Map<String, dynamic>? attributes;
    if (mp3instance.parseTagsSync()) {
      try {
        attributes = mp3instance.getMetaTags();
        artist = attributes?['Artist'];
        title = attributes?['Title'];
        album = attributes?['Album'];
        apic = attributes?['APIC'];
      } catch (e, st) {
        logger.e("Failed to read song attributes", e, st);
      }
    }
  }
  static Future<MusicSong> create({required File file}) async {
    List<int> mp3Bytes = await file.readAsBytes();
    var songId = md5.convert(mp3Bytes).toString();
    Duration duration = MP3Processor.fromFile(file).duration;
    return MusicSong._create(mp3Bytes, songId, duration, file: file);
  }
}
