import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';

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
        musicPackage = json['message'],
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
      socket.write(message);
    } on Exception catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  void _handleClient(Socket client) {
    final clientIp = client.remoteAddress.address;
    client.listen((data) async {
      final receivedString = String.fromCharCodes(data);
      final receivedMessage =
          SocketMessage.fromJson(json.decode(receivedString));
      print("Received Message $receivedMessage");
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
        SocketMessage(messageType: MessageType.musicPackage, musicPackage: msg);
    // Send the message to all sockets
    for (Socket socket in socketsOutController.valueOrNull ?? []) {
      socket.write(message);
    }
    return true;
  }

  _sendListOfConnectedDevices(String ip) {
    final socket = _getSocketByIp(ip);
    if (socket == null) return;

    final message = SocketMessage(
        messageType: MessageType.listOfDevices,
        listOfDevices: _getListOfDevices());
    socket.write(message);
  }

  List<String> _getListOfDevices() {
    return socketsOut.map((e) => e.address.host).toList();
  }

  Socket? _getSocketByIp(String ip) {
    return socketsOut.firstWhereOrNull((socket) => socket.address.host == ip);
  }
}
