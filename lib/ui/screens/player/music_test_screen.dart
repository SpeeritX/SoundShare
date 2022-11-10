import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sound_share/common/utils/iterable_extensions.dart';
import 'package:sound_share/domain/music/directory/directory.dart';
import 'package:sound_share/domain/music/package/music_package.dart';
import 'package:sound_share/domain/music/player/music_buffer.dart';
import 'package:sound_share/domain/music/player/music_player.dart';
import 'package:sound_share/domain/music/reader/music_reader.dart';
import 'package:sound_share/domain/music/song/song.dart';
import 'package:sound_share/domain/music/player/music_queue.dart';
import 'package:sound_share/ui/widgets/buttons/primary_full_button.dart';

class MusicTestScreen extends StatefulWidget {
  const MusicTestScreen({Key? key}) : super(key: key);

  @override
  State<MusicTestScreen> createState() => _MusicTestScreenState();
}

class _MusicTestScreenState extends State<MusicTestScreen> {
  final _musicBuffer = MusicBuffer();
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
    _player.setSong(_song?.file.readAsBytesSync().length);
    setState(() {
      _currentFileName = _song?.file.path ?? "";
    });
  }

  void _play() async {
    _player.play();
    _player.stop();
    _player.play();
    var song = await MusicSong.create(file: File(_currentFileName));
    var packages = MusicReader(song);
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
      appBar: AppBar(
        title: const Text("Player"),
      ),
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
                child: const Text("Play"),
              ),
              PrimaryFullButton(
                onPressed: () {
                  _stop();
                },
                child: const Text("Pause"),
              ),
              PrimaryFullButton(
                onPressed: () {
                  _loadFile();
                },
                child: const Text("Pick songs"),
              ),
            ],
            for (var i = 0; i < _songs.length; i++) ...[
              PrimaryFullButton(
                onPressed: () {
                  _pickSong(i);
                },
                child: Text(basename(_songs[i].file.path)),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
