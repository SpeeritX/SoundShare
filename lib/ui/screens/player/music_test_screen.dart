import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sound_share/common/utils/iterable_extensions.dart';
import 'package:sound_share/domain/music/directory/directory.dart';
import 'package:sound_share/domain/music/music_package.dart';
import 'package:sound_share/domain/music/player/music_player.dart';
import 'package:sound_share/domain/music/song/song.dart';
import 'package:sound_share/ui/widgets/buttons/primary_full_button.dart';

class MusicTestScreen extends StatefulWidget {
  const MusicTestScreen({Key? key}) : super(key: key);

  @override
  State<MusicTestScreen> createState() => _MusicTestScreenState();
}

class _MusicTestScreenState extends State<MusicTestScreen> {
  final _player = MusicPlayer();
  MusicDirectory? _directory;
  List<int> _bytes = [];
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
    _bytes = await _songs[ind].file.readAsBytes();
    setState(() {
      _currentFileName = basename(_songs[ind].file.path);
    });
  }

  void _play() async {
    _player.setSong(_bytes.length);
    _player.play();
    _player.stop();
    _player.play();
    var packages = _bytes.toList().chunked((10000).floor());
    for (var package in packages) {
      _player.addPackage(MusicPackage(
        startTime: DateTime(0),
        duration: Duration.zero,
        data: Uint8List.fromList(package),
      ));
      //await Future.delayed(Duration(milliseconds: 50));
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
                child: Text(basename(
                    (_songs[i].attributes?['Title'] ?? _songs[i].file.path))),
              ),
              Text(_songs[i].duration().toString()),
            ]
          ],
        ),
      ),
    );
  }
}
