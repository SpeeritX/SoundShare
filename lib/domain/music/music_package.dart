import 'dart:typed_data';

class MusicPackage {
  final DateTime startTime;
  final Duration duration;
  final Uint8List data;

  MusicPackage({
    required this.startTime,
    required this.duration,
    required this.data,
  });

  MusicPackage.fromJson(Map<String, dynamic> json)
      : startTime = json['startTime'],
        duration = json['duration'],
        data = json['data'];

  Map<String, dynamic> toJson() => {
        'startTime': startTime,
        'duration': duration,
        'data': data,
      };
}
