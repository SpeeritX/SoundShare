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
import 'package:sound_share/domain/network/p2p/ping_measurement.dart';
import 'package:sound_share/domain/network/p2p/synchronized_clock.dart';

class PlayerController extends ChangeNotifier with Disposable {
  final _musicQueue = MusicQueue();
  final P2pNetwork _p2pNetwork;
  late final _musicBufferController =
      MusicBufferController(_musicQueue, _p2pNetwork);
  late final MusicPlayer _player =
      MusicPlayer(_musicBufferController, _musicQueue);
  late final MusicProvider _musicProvider;
  late final PingMeasurement _pingMeasurement;
  bool _isPlaying = false;

  DetailsPackage? get currentSong => _musicQueue.currentSong;
  List<DetailsPackage> get songList => _musicQueue.songList;
  int get musicChunkSize => _musicProvider.musicChunkSize;

  bool get isPlaying => _isPlaying;

  PlayerController(this._p2pNetwork) {
    _p2pNetwork.musicPlayerListener = _player;
    _musicProvider =
        MusicProvider(_p2pNetwork, _musicBufferController.bufferCollection);
    _pingMeasurement = PingMeasurement(_p2pNetwork);

    _musicQueue.updateEvents.listen((_) {
      notifyListeners();
    }).canceledBy(this);

    _player.playerState.listen((state) {
      _isPlaying = state.playing;
      notifyListeners();
    }).canceledBy(this);
  }

  @override
  void dispose() {
    _player.stop();
    _player.dispose();
    _musicProvider.dispose();
    _musicBufferController.dispose();
    _p2pNetwork.dispose();
    _p2pNetwork.musicPlayerListener = null;
    _pingMeasurement.dispose();
    super.dispose();
  }

  void pickSong() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && extension(result.files.single.path!) == '.mp3') {
      File file = File(result.files.single.path!);
      final currentSong = await MusicSong.create(file: file);
      addSong(currentSong);
    } else {
      notifyListeners();
    }
  }

  void synchronizeClock() async {
    _pingMeasurement.measureAverageTimeOffset();
  }

  void addSong(MusicSong song) async {
    _musicProvider.addSong(song);
    await _p2pNetwork.sendMessage(P2pMessage.addSongToQueue(song.details));
    notifyListeners();
  }

  void nextSong() async {
    final now = SynchronizedClock.now();
    _musicQueue.currentSongIndex = _musicQueue.currentSongIndex + 1;
    if (_musicQueue.currentSongIndex >= _musicQueue.songList.length) {
      _musicQueue.currentSongIndex = 0;
    }
    _p2pNetwork.sendMessage(
      P2pMessage.play(_musicQueue.currentSongIndex, now, Duration.zero),
    );
  }

  void previousSong() async {
    final now = SynchronizedClock.now();
    _musicQueue.currentSongIndex = _musicQueue.currentSongIndex - 1;
    if (_musicQueue.currentSongIndex < 0) {
      _musicQueue.currentSongIndex = _musicQueue.songList.length - 1;
    }
    _p2pNetwork.sendMessage(
      P2pMessage.play(_musicQueue.currentSongIndex, now, Duration.zero),
    );
  }

  void removeSong(String song) async {
    // TODO: Implement
  }

  void setMusicChunkSize(int size) {
    _p2pNetwork.sendMessage(P2pMessage.setMusicChunkSize(size));
  }

  void play() async {
    final now = SynchronizedClock.now();
    _p2pNetwork.sendMessage(
      P2pMessage.play(_musicQueue.currentSongIndex, now, _player.time),
    );
  }

  void pause() {
    _p2pNetwork.sendMessage(const P2pMessage.pause());
  }

  void playSong(int index) async {
    var now = await NTP.now();
    _p2pNetwork.sendMessage(
      P2pMessage.play(index, now, Duration.zero),
    );
  }

  Duration? getCurrentSongDuration() {
    return _player.getCurrentSongDuration();
  }

  Duration? getCurrentSongPosition() {
    return _player.getCurrentSongPosition();
  }

  double getCurrentSongPositionPercentage() {
    var duration = getCurrentSongDuration() ?? currentSong?.duration;
    var position = getCurrentSongPosition();
    if (duration == null || position == null) {
      return 0;
    }
    return position.inMilliseconds / duration.inMilliseconds;
  }
}
