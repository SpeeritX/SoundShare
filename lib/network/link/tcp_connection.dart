import 'dart:async';
import 'dart:typed_data';

import 'direct_connection.dart';

class TcpConnection implements DirectConnection {
  final StreamController<Uint8List> _readController =
      StreamController.broadcast();

  @override
  Stream<Uint8List> get readStream => _readController.stream;

  @override
  Future<bool> write(Uint8List msg) async {
    throw UnimplementedError();
  }
}
