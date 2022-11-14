import 'dart:typed_data';

import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/domain/music/reader/music_reader.dart';
import 'package:sound_share/domain/music/song/song.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';

class MusicProvider with Disposable implements MusicProviderListener {
  final P2pNetwork _p2pNetwork;
  final _songs = List<MusicSong>.empty(growable: true);

  MusicProvider(this._p2pNetwork) {
    _p2pNetwork.musicProviderListener = this;
  }

  void addSong(MusicSong song) {
    _songs.add(song);
  }

  @override
  Future<void> requestSong(String id) async {
    final song = _songs.firstWhere((e) => e.details.songId == id);

    var packages = MusicReader(song);
    while (true) {
      var package = packages.next();
      if (package == null) {
        break;
      }
      await _p2pNetwork.sendBytes(
        song.details.songId,
        Uint8List.fromList(package.data),
      );
    }
  }

  @override
  void dispose() {
    _p2pNetwork.musicProviderListener = null;
    super.dispose();
  }
}
