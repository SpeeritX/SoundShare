import 'dart:async';
import 'dart:io';

/// Listens for incoming connections
class TcpServer {
  static const communicationPort = 9999;
  static const dataPort = 9998;

  late final Future<ServerSocket> _communicationServer;
  late final Future<ServerSocket> _dataServer;
  StreamSubscription? _subscriptionCommunication;
  StreamSubscription? _subscriptionData;

  final _incomingClients = StreamController<Socket>.broadcast();

  Stream<Socket> get incomingClients => _incomingClients.stream;

  TcpServer() {
    _communicationServer =
        ServerSocket.bind(InternetAddress.anyIPv4, communicationPort);
    _dataServer = ServerSocket.bind(InternetAddress.anyIPv4, dataPort);
    init();
  }

  void init() async {
    final communicationServer = await _communicationServer;
    final dataServer = await _dataServer;
    _subscriptionCommunication = communicationServer.listen((client) {
      _incomingClients.add(client);
    });
    _subscriptionData = dataServer.listen((client) {
      _incomingClients.add(client);
    });
  }

  Future<void> dispose() async {
    (await _communicationServer).close();
    (await _dataServer).close();
    _subscriptionCommunication?.cancel();
    _subscriptionData?.cancel();
  }
}
