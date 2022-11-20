import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:ntp/ntp.dart';
import 'package:path/path.dart';
import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/domain/music/buffer/music_buffer_controller.dart';
import 'package:sound_share/domain/music/package/details_package.dart';
import 'package:sound_share/domain/music/player/music_player.dart';
import 'package:sound_share/domain/music/player/music_queue.dart';
import 'package:sound_share/domain/music/reader/music_provider.dart';
import 'package:sound_share/domain/music/song/song.dart';
import 'package:sound_share/domain/network/p2p/p2p_messages.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';

class PlayerController extends ChangeNotifier with Disposable {
  final _musicQueue = MusicQueue();
  final P2pNetwork _p2pNetwork;
  final Duration _playOffset;
  late final _musicBufferController =
      MusicBufferController(_musicQueue, _p2pNetwork);
  late final MusicPlayer _player =
      MusicPlayer(_musicBufferController, _musicQueue, _playOffset);
  late final MusicProvider _musicProvider = MusicProvider(_p2pNetwork);

  DetailsPackage? get currentSong => _musicQueue.currentSong;
  List<DetailsPackage> get songList => _musicQueue.songList;

  PlayerController(this._p2pNetwork, this._playOffset) {
    _p2pNetwork.musicPlayerListener = _player;

    _musicQueue.updateEvents.listen((_) {
      notifyListeners();
    }).canceledBy(this);

    _p2pNetwork.sendMessage(const P2pMessage.sync());
  }

  @override
  void dispose() {
    _player.dispose();
    _musicProvider.dispose();
    _musicBufferController.dispose();
    _p2pNetwork.dispose();
    _p2pNetwork.musicPlayerListener = null;
    super.dispose();
  }

  void pickSong() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && extension(result.files.single.path!) == '.mp3') {
      File file = File(result.files.single.path!);
      final currentSong = await MusicSong.create(file: file);
      playSong(currentSong);
    } else {
      notifyListeners();
    }
  }

  void playSong(MusicSong song) async {
    _musicProvider.addSong(song);
    await _p2pNetwork.sendMessage(const P2pMessage.sync());
    await _p2pNetwork.sendMessage(P2pMessage.addSongToQueue(song.details));
    notifyListeners();
  }

  void removeSong(String song) async {
    // TODO: Implement
  }

  void play() async {
    var now = await NTP.now();
    // final now = DateTime.now();
    _p2pNetwork.sendMessage(P2pMessage.play(_musicQueue.currentSongIndex, now));
  }

  Duration? getCurrentSongDuration() {
    return _player.getCurrentSongDuration();
  }

  Duration? getCurrentSongPosition() {
    return _player.getCurrentSongPosition();
  }

  double getCurrentSongPositionPercentage() {
    var duration = getCurrentSongDuration() ?? currentSong?.duration;
    if (duration == null) {
      return -1;
    }
    var position = getCurrentSongPosition() ?? const Duration();
    return position.inMilliseconds / duration.inMilliseconds;
  }
}
