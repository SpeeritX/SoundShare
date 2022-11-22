import 'dart:async';
import 'dart:typed_data';

abstract class DirectConnection {
  String get id;

  Stream<String> get readStream;

  Future<bool> write(Uint8List msg);

  bool isLocal();

  void dispose();
}
