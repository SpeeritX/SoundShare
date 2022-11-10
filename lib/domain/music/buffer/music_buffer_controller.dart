import 'dart:typed_data';

import 'package:sound_share/domain/music/buffer/music_buffer.dart';
import 'package:sound_share/domain/music/player/music_queue.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';

class MusicBufferController implements MusicBufferListener {
  final MusicQueue _queue;
  final P2pNetwork _p2pNetwork;
  final buffer = MusicBufferCollection();

  MusicBufferController(this._queue, this._p2pNetwork);

  @override
  void addBytes(String song, Uint8List bytes) {
    buffer.onBytesReceived(song, bytes);
  }
}
