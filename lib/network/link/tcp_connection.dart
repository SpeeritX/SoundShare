import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:rxdart/rxdart.dart';
import 'package:sound_share/common/logger.dart';

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
        message = json['message'] == null
            ? null
            : Uint8List.fromList(
                (json['message'] as List).map((e) => e as int).toList());

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

  String buffer = "";
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
      final message = SocketMessage(messageType: MessageType.requestToConnect);
      socket.write(message.toString() + "\n");
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
      buffer = buffer + receivedString;
      logger.w(receivedString);
      _handleBuffer(client);
    }, onDone: () {
      print("server done");
    });
    client.close();
  }

  void _handleBuffer(Socket client) {
    while (true) {
      final splitted = buffer.split("\n");
      if (splitted.length > 1) {
        buffer = buffer.substring(splitted.first.length);
        if (buffer.startsWith("\n")) {
          buffer = buffer.substring(1);
        }
        _handleMessage(splitted.first, client);
      } else {
        return;
      }
    }
  }

  void _handleMessage(String message, Socket client) {
    final receivedMessage = SocketMessage.fromJson(json.decode(message));
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
  }

  @override
  Stream<Uint8List> get readStream => _readController.stream;

  @override
  Future<bool> write(Uint8List msg) async {
    final message =
        SocketMessage(messageType: MessageType.musicPackage, message: msg);
    for (Socket socket in socketsOutController.valueOrNull ?? []) {
      socket.write(message.toString() + "\n");
      print("socket ip: ${socket.address.host}");
      await socket.flush();
    }
    return true;
  }
}
