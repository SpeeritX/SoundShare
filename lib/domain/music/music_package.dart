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
}
