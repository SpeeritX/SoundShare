import 'dart:typed_data';

import 'package:collection/collection.dart';
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
  Future<bool> isSongAvailable(String id) async {
    final song = _songs.firstWhereOrNull((e) => e.details.songId == id);
    return song != null;
  }

  @override
  void dispose() {
    _p2pNetwork.musicProviderListener = null;
    super.dispose();
  }

  @override
  Future<Uint8List> getSongBytes(String songId, int startIndex) async {
    final song = _songs.firstWhereOrNull((e) => e.details.songId == songId);
    var reader = MusicReader(song!);
    return await reader.getBytes(startIndex);
  }
}
