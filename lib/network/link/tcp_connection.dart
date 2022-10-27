import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:rxdart/rxdart.dart';

import 'direct_connection.dart';

enum MessageType {
  requestToConnect,
  listOfDevices,
  musicPackage,
}

class SocketMessage {
  final MessageType messageType;
  final Uint8List? message;

  SocketMessage({
    required this.messageType,
    this.message,
  });

  SocketMessage.fromJson(Map<String, dynamic> json)
      : messageType = MessageType.values.byName(json['messageType']),
        message = json['message'];

  Map<String, dynamic> toJson() => {
        'messageType': messageType.name,
        'message': message,
      };

  @override
  String toString() {
    return json.encode(toJson());
  }
}

class TcpConnection implements DirectConnection {
  static const messageLength = 64;
  final StreamController<Uint8List> _readController =
      StreamController.broadcast();
  final socketsOutController = BehaviorSubject<List<Socket>>();
  bool _isListening = false;

  Stream<List<Socket>> get socketsOut => socketsOutController.stream;

  @override
  Stream<Iterable<String>> get connectedDevices =>
      socketsOut.map((event) => event.map((e) => e.address.host));

  @override
  listenForConnections() {
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
    listenForConnections();

    for (Socket socket in socketsOutController.valueOrNull ?? []) {
      if (socket.address.host == ip) {
        print("Already connected");
        return true;
      }
    }

    try {
      final socket = await Socket.connect(ip, 9999);
      socketsOutController
          .add((socketsOutController.valueOrNull ?? [])..add(socket));
      final jsonObject =
          SocketMessage(messageType: MessageType.requestToConnect).toJson();
      print("json decoded: ${json.decode(json.encode(jsonObject))}");
      socket.write(json.encode(jsonObject));
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
      final receivedString = String.fromCharCodes(data);
      final receivedMessage =
          SocketMessage.fromJson(json.decode(receivedString));
      switch (receivedMessage.messageType) {
        case MessageType.requestToConnect:
          print("requestToConnect");
          connect(client.remoteAddress.address);
          break;
        case MessageType.listOfDevices:
          print("listOfDevices");
          // TODO: Handle this case.
          break;
        case MessageType.musicPackage:
          print("musicPackage");
          _readController.add(receivedMessage.message!);
          break;
      }
    }, onDone: () {
      print("server done");
    });
    client.close();
  }

  @override
  Stream<Uint8List> get readStream => _readController.stream;

  @override
  Future<bool> write(Uint8List msg) async {
    final message =
        SocketMessage(messageType: MessageType.musicPackage, message: msg);
    for (Socket socket in socketsOutController.valueOrNull ?? []) {
      socket.write(message);
    }
    return true;
  }
}
