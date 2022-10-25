import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:rxdart/rxdart.dart';

import 'direct_connection.dart';

class TcpConnection implements DirectConnection {
  final StreamController<Uint8List> _readController =
      StreamController.broadcast();
  final socketsOutController = BehaviorSubject<List<Socket>>();
  bool _isListening = false;

  Stream<List<Socket>> get socketsOut => socketsOutController.stream;

  @override
  Stream<Iterable<String>> get connectedDevices =>
      socketsOut.map((event) => event.map((e) => e.address.host));

  @override
  createNetwork() {
    if (!_isListening) {
      ServerSocket.bind(InternetAddress.anyIPv4, 9999)
          .then((ServerSocket server) {
        server.listen(handleClient);
      });
      _isListening = true;
    }
  }

  @override
  Future<bool> connect(String ip) async {
    createNetwork();

    for (var socket in socketsOutController.valueOrNull ?? []) {
      if (socket.address.host == ip) {
        print("Already connected");
        return true;
      }
    }

    try {
      final socket = await Socket.connect(ip, 9999);
      socketsOutController
          .add((socketsOutController.valueOrNull ?? [])..add(socket));
      socket.write("Request to connect");
      print("Socket Out ready");
    } on Exception catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  void handleClient(Socket client) {
    print(
        'server incoming connection from ${client.remoteAddress.address}:${client.remotePort}');
    client.listen((data) {
      print("Data received: ${String.fromCharCodes(data).trim()}");
      connect(client.remoteAddress.address);
    }, onDone: () {
      print("server done");
    });
    client.close();
  }

  @override
  Stream<Uint8List> get readStream => _readController.stream;

  @override
  Future<bool> write(Uint8List msg) async {
    throw UnimplementedError();
  }
}
