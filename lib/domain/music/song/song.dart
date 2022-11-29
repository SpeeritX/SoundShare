import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:id3/id3.dart';
import 'package:mp3_info/mp3_info.dart';
import 'package:path/path.dart';
import 'package:sound_share/common/logger.dart';
import 'package:sound_share/domain/music/package/details_package.dart';

class MusicSong {
  final File file;
  late final DetailsPackage details;

  MusicSong._create(
    List<int> bytes,
    String songId,
    Duration duration, {
    required this.file,
  }) {
    MP3Instance mp3instance = MP3Instance(bytes);
    Map<String, dynamic>? attributes;
    String? artist, title, album;
    dynamic apic;
    if (mp3instance.parseTagsSync()) {
      try {
        attributes = mp3instance.getMetaTags();
        artist = attributes?['Artist'] ?? "Unknown artist";
        title = attributes?['Title'] ?? basename(file.path);
        album = attributes?['Album'];
        apic = attributes?['APIC'];
      } catch (e, st) {
        logger.e("Failed to read song attributes", e, st);
      }
    } else {
      artist = "Unknown artist";
      title = basename(file.path);
    }
    details = DetailsPackage(
      songId: songId,
      duration: duration,
      bytesLength: bytes.length,
      artist: artist,
      title: title,
      album: album,
      apic: apic,
    );
  }

  static Future<MusicSong> create({required File file}) async {
    List<int> mp3Bytes = await file.readAsBytes();
    var songId = md5.convert(mp3Bytes).toString();
    Duration duration = MP3Processor.fromFile(file).duration;
    return MusicSong._create(mp3Bytes, songId, duration, file: file);
  }
}
