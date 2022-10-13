import 'dart:async';
import 'dart:typed_data';

abstract class DirectConnection {
  createNetwork();

  Future<bool> connect(String ip);

  Stream<Uint8List> get readStream;

  Future<bool> write(Uint8List msg);
}
