import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sound_share/common/logger.dart';
import 'package:sound_share/network/p2p/p2p_messages.dart';

import 'direct_connection.dart';

class TcpConnection implements DirectConnection {
  static const messageLength = 64;

  final int port;
  final StreamController<String> _readController = StreamController.broadcast();
  final socketsOutController = BehaviorSubject<List<Socket>>();
  bool _isListening = false;

  String buffer = "";

  List<Socket> get socketsOut => socketsOutController.valueOrNull ?? [];

  set socketsOut(List<Socket> newValue) {
    socketsOutController.add(newValue);
  }

  TcpConnection({required this.port});

  @override
  Stream<Iterable<String>> get connectedDevices => socketsOutController.stream
      .map((event) => event.map((e) => e.address.host));

  @override
  Future<void> listenForConnections() async {
    if (!_isListening) {
      final server = await ServerSocket.bind(InternetAddress.anyIPv4, port);
      server.listen(_handleClient);
      _isListening = true;
    }
  }

  @override
  Future<bool> connect(String ip) async {
    logger.d("Connecting to $ip");
    listenForConnections();

    final existingSocket = _getSocketByIp(ip);
    if (existingSocket != null) {
      logger.d("Already connected");
      return false;
    }

    try {
      final socket = await Socket.connect(ip, port);
      socketsOut = socketsOut..add(socket);
      const message = P2pMessage.requestStateUpdate();
      socket.write("$message\n");
    } on Exception catch (e) {
      logger.d(e);
      return false;
    }
    return true;
  }

  void _handleClient(Socket client) {
    connect(client.remoteAddress.address);

    client.listen((data) async {
      final receivedString = String.fromCharCodes(data);
      buffer = buffer + receivedString;
      logger.w(receivedString);
      _handleBuffer(client);
    }, onDone: () {
      logger.d("server done");
    });
    client.close();
  }

  void _handleBuffer(Socket client) {
    while (true) {
      final splitted = buffer.split("\n");
      logger.d("splitted!");
      logger.d(splitted);
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
    _readController.add(message);
  }

  @override
  Stream<String> get readStream => _readController.stream;

  @override
  Future<bool> write(String msg) async {
    for (Socket socket in socketsOutController.valueOrNull ?? []) {
      socket.write("$msg\n");
      logger.d("socket ip: ${socket.address.host}");
      await socket.flush();
    }
    return true;
  }

  Socket? _getSocketByIp(String ip) {
    return socketsOut.firstWhereOrNull((socket) => socket.address.host == ip);
  }

  @override
  void connectDevices(List<String> peersIds) {
    for (final ip in peersIds) {
      connect(ip);
    }
  }
}
