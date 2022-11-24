import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/domain/network/link/direct_connection.dart';
import 'package:sound_share/domain/network/p2p/p2p_messages.dart';

class Peer with Disposable {
  final DirectConnection _communicationConnection;
  final DirectConnection _dataConnection;

  Peer({
    required DirectConnection communicationConnection,
    required DirectConnection dataConnection,
  })  : _dataConnection = dataConnection,
        _communicationConnection = communicationConnection;

  String get id => _communicationConnection.id;
  bool get isLocal => _communicationConnection.isLocal();

  Future<void> send(P2pMessage message) async {
    if (message is MusicPackageMsg || message is RequestResourceMsg) {
      await _dataConnection.write(message.toBytes());
    } else {
      await _communicationConnection.write(message.toBytes());
    }
  }

  void setListener(void Function(String) listener) async {
    _dataConnection.readStream.listen(listener).canceledBy(this);
    _communicationConnection.readStream.listen(listener).canceledBy(this);
  }

  @override
  void dispose() {
    _dataConnection.dispose();
    _communicationConnection.dispose();
    super.dispose();
  }
}
