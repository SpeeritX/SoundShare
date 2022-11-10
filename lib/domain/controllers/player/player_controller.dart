import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/domain/music/package/music_package.dart';
import 'package:sound_share/domain/music/player/music_buffer.dart';
import 'package:sound_share/domain/music/player/music_player.dart';
import 'package:sound_share/domain/music/player/music_queue.dart';
import 'package:sound_share/domain/music/reader/music_reader.dart';
import 'package:sound_share/domain/music/song/song.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';

class PlayerController extends ChangeNotifier with Disposable {
  final MusicPlayer _player = MusicPlayer(MusicBuffer(), MusicQueue());
  late final P2pNetwork _p2pNetwork;
  MusicSong? currentSong;
  var _isPlaying = false;

  PlayerController(this._p2pNetwork) {
    _p2pNetwork.songBytesStream.listen((event) {
      if (!_isPlaying) {
        _player.setSong(null);
        _player.play();
        _isPlaying = true;
      }
      _player.addPackage(MusicPackage(
        songId: "",
        data: event,
        startIndex: 0,
        endIndex: 0,
      ));
    }).canceledBy(this);
  }

  @override
  void dispose() {
    _p2pNetwork.dispose();
    super.dispose();
  }

  void pickSong() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && extension(result.files.single.path!) == '.mp3') {
      File file = File(result.files.single.path!);
      currentSong = await MusicSong.create(file: file);
      var packages = MusicReader(currentSong!);
      while (true) {
        var package = packages.next();
        if (package == null) {
          break;
        }
        await _p2pNetwork.sendBytes(Uint8List.fromList(package.data));
      }
    }
    notifyListeners();
  }
}
