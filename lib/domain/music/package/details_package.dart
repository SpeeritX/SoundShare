import 'dart:typed_data';

class DetailsPackage {
  final String songId;
  final DateTime duration;
  final String artist;
  final String title;

  DetailsPackage({
    required this.songId,
    required this.duration,
    required this.artist,
    required this.title,
  });

  DetailsPackage.fromJson(Map<String, dynamic> json)
      : songId = json['songId'],
        duration = json['duration'],
        artist = json['artist'],
        title = json['name'];

  Map<String, dynamic> toJson() => {
        'songId': songId,
        'auration': duration,
        'artist': artist,
        'name': title,
      };
}
