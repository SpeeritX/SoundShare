import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sound_share/domain/music/buffer/music_buffer_controller.dart';
import 'package:sound_share/domain/music/directory/music_directory.dart';
import 'package:sound_share/domain/music/player/music_player.dart';
import 'package:sound_share/domain/music/player/music_queue.dart';
import 'package:sound_share/domain/music/reader/music_reader.dart';
import 'package:sound_share/domain/music/song/song.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';
import 'package:sound_share/ui/widgets/buttons/primary_full_button.dart';

import '../../widgets/scaffold/app_bar.dart';

class MusicTestScreen extends StatefulWidget {
  const MusicTestScreen({Key? key}) : super(key: key);

  @override
  State<MusicTestScreen> createState() => _MusicTestScreenState();
}

class _MusicTestScreenState extends State<MusicTestScreen> {
  final _musicBuffer = MusicBufferController(MusicQueue(), P2pNetwork());
  late final _player = MusicPlayer(_musicBuffer, MusicQueue());
  MusicDirectory? _directory;
  MusicSong? _song;
  final List<MusicSong> _songs = [];
  var _currentFileName = "";

  @override
  void initState() {
    _loadFile();
    super.initState();
  }

  @override
  void dispose() {
    _player.stop();
    _directory?.relinquish();
    super.dispose();
  }

  void _loadFile() async {
    await _directory?.relinquish();
    String? result = await FilePicker.platform.getDirectoryPath();
    if (result != null) {
      _directory = MusicDirectory(result);
      await _directory?.getAccess();
      await _directory?.load();
      setState(() {
        _songs.clear();
        _songs.addAll(_directory?.songs ?? List.empty());
      });
    }
  }

  void _pickSong(ind) async {
    _song = _songs[ind];
    setState(() {
      _currentFileName = _song?.file.path ?? "";
    });
  }

  void _play() async {
    var song = await MusicSong.create(file: File(_currentFileName));
    var packages = MusicReader(song, 100000);
    while (true) {
      var package = packages.next();
      if (package == null) {
        break;
      }
      _player.addPackage(package);
    }
  }

  void _stop() {
    _player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "Player"),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...[
              Text(
                _currentFileName,
                style: Theme.of(context).textTheme.headline5,
              ),
              PrimaryFullButton(
                onPressed: () {
                  _play();
                },
                text: "Play",
              ),
              PrimaryFullButton(
                onPressed: () {
                  _stop();
                },
                text: "Pause",
              ),
              PrimaryFullButton(
                onPressed: () {
                  _loadFile();
                },
                text: "Pick songs",
              ),
            ],
            for (var i = 0; i < _songs.length; i++) ...[
              PrimaryFullButton(
                onPressed: () {
                  _pickSong(i);
                },
                text: basename(_songs[i].file.path),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
