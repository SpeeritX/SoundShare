import 'dart:async';

abstract class DirectConnection {
  Stream<Iterable<String>> get connectedDevices;

  listenForConnections();

  Future<bool> connect(String ip);

  Stream<String> get readStream;

  Future<bool> write(String msg);

  void connectDevices(List<String> peersIds);
}
