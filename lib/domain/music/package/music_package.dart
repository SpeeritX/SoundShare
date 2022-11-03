import 'dart:typed_data';

class MusicPackage {
  final int startIndex;
  final int endIndex;
  final String songId;
  final Uint8List data;

  MusicPackage({
    required this.startIndex,
    required this.endIndex,
    required this.songId,
    required this.data,
  });

  MusicPackage.fromJson(Map<String, dynamic> json)
      : startIndex = json['startIndex'],
        endIndex = json['endIndex'],
        songId = json['songId'],
        data = json['data'];

  Map<String, dynamic> toJson() => {
        'startIndex': startIndex,
        'endIndex': endIndex,
        'songId': songId,
        'data': data,
      };
}
