import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'direct_connection.dart';

class TcpConnection implements DirectConnection {
  final StreamController<Uint8List> _readController =
      StreamController.broadcast();
  Socket? socketIn;
  List<Socket> socketsOut = [];
  bool isListening = false;

  @override
  createNetwork() {
    if (!isListening) {
      ServerSocket.bind(InternetAddress.anyIPv4, 9999)
          .then((ServerSocket server) {
        server.listen(handleClient);
      });
      isListening = true;
    }
  }

  @override
  Future<bool> connect(String ip) async {
    createNetwork();

    for (var socket in socketsOut) {
      if (socket.address.host == ip) {
        print("Already connected");
        return true;
      }
    }

    try {
      socketsOut.add(await Socket.connect(ip, 9999));
      socketsOut.last.write("Request to connect");
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
