import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:collection/collection.dart';
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
  final Uint8List? musicPackage;
  final List<String>? listOfDevices;

  SocketMessage({
    required this.messageType,
    this.musicPackage,
    this.listOfDevices,
  });

  SocketMessage.fromJson(Map<String, dynamic> json)
      : messageType = MessageType.values.byName(json['messageType']),
        musicPackage = json['musicPackage'] == null
            ? null
            : Uint8List.fromList(
                (json['musicPackage'] as List).map((e) => e as int).toList()),
        listOfDevices = json['listOfDevices'] == null
            ? null
            : (json['listOfDevices'] as List).map((e) => e as String).toList();

  Map<String, dynamic> toJson() => {
        'messageType': messageType.name,
        'message': musicPackage,
        'listOfDevices': listOfDevices,
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
  List<Socket> get socketsOut => socketsOutController.valueOrNull ?? [];
  set socketsOut(List<Socket> newValue) {
    socketsOutController.add(newValue);
  }

  @override
  Stream<Iterable<String>> get connectedDevices => socketsOutController.stream
      .map((event) => event.map((e) => e.address.host));

  @override
  listenForConnections() {
    if (!_isListening) {
      ServerSocket.bind(InternetAddress.anyIPv4, 9999)
          .then((ServerSocket server) {
        server.listen(_handleClient);
      });
      _isListening = true;
    }
  }

  @override
  Future<bool> connect(String ip) async {
    print("Connecting to ${ip}");
    listenForConnections();

    final existingSocket = _getSocketByIp(ip);
    if (existingSocket != null) {
      print("Already connected");
      return false;
    }

    try {
      final socket = await Socket.connect(ip, 9999);
      socketsOut = socketsOut..add(socket);
      final message = SocketMessage(messageType: MessageType.requestToConnect);
      socket.write(message.toString() + "\n");
    } on Exception catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  void _handleClient(Socket client) {
    client.listen((data) async {
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
      print("splitted!");
      print(splitted);
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
    final clientIp = client.remoteAddress.address;
    final receivedMessage = SocketMessage.fromJson(json.decode(message));
    print(receivedMessage);
    switch (receivedMessage.messageType) {
      case MessageType.requestToConnect:
        print("requestToConnect");
        connect(clientIp);
        _sendListOfConnectedDevices(clientIp);
        break;
      case MessageType.listOfDevices:
        print("listOfDevices");
        final devices = receivedMessage.listOfDevices!;
        for (final ip in devices) {
          connect(ip);
        }
        break;
      case MessageType.musicPackage:
        print("musicPackage");
        _readController.add(receivedMessage.musicPackage!);
        break;
    }
  }

  @override
  Stream<Uint8List> get readStream => _readController.stream;

  @override
  Future<bool> write(Uint8List msg) async {
    final message =
        SocketMessage(messageType: MessageType.musicPackage, musicPackage: msg);
    // Send the message to all sockets
    for (Socket socket in socketsOutController.valueOrNull ?? []) {
      socket.write(message.toString() + "\n");
      print("socket ip: ${socket.address.host}");
      await socket.flush();
    }
    return true;
  }

  _sendListOfConnectedDevices(String ip) {
    final socket = _getSocketByIp(ip);
    if (socket == null) return;

    final message = SocketMessage(
        messageType: MessageType.listOfDevices,
        listOfDevices: _getListOfDevices());
    socket.write(message.toString() + "\n");
  }

  List<String> _getListOfDevices() {
    return socketsOut.map((e) => e.address.host).toList();
  }

  Socket? _getSocketByIp(String ip) {
    return socketsOut.firstWhereOrNull((socket) => socket.address.host == ip);
  }
}
