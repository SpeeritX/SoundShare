import 'dart:async';
import 'dart:io';

/// Listens for incoming connections
class TcpServer {
  static const defaultPort = 9999;

  final int port;

  late final Future<ServerSocket> _server;
  StreamSubscription? _subscription;

  final _incomingClients = StreamController<Socket>.broadcast();

  Stream<Socket> get incomingClients => _incomingClients.stream;

  TcpServer({required this.port}) {
    _server = ServerSocket.bind(InternetAddress.anyIPv4, port);
    init();
  }

  void init() async {
    final server = await _server;
    _subscription = server.listen((client) {
      _incomingClients.add(client);
    });
  }

  Future<void> dispose() async {
    (await _server).close();
    _subscription?.cancel();
  }
}
