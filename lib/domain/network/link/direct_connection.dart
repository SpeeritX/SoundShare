import 'dart:async';

abstract class DirectConnection {
  String get id;

  Stream<String> get readStream;

  Future<bool> write(String msg);

  void dispose();
}
