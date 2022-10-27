import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sound_share/common/utils/iterable_extensions.dart';
import 'package:sound_share/domain/music/music_directory/music_directory.dart';
import 'package:sound_share/domain/music/music_package.dart';
import 'package:sound_share/domain/music/player/music_player.dart';
import 'package:sound_share/ui/widgets/buttons/primary_full_button.dart';

class MusicTestScreen extends StatefulWidget {
  const MusicTestScreen({Key? key}) : super(key: key);

  @override
  State<MusicTestScreen> createState() => _MusicTestScreenState();
}

class _MusicTestScreenState extends State<MusicTestScreen> {
  final _player = MusicPlayer();
  final _directory = MusicDirectory();
  List<int> _bytes = [];
  final List<File> _files = [];
  var _currentFileName = "";

  @override
  void initState() {
    _loadFile();
    super.initState();
  }

  @override
  void dispose() async {
    _player.stop();
    _directory.relinquish();
    super.dispose();
  }

  void _loadFile() async {
    _directory.relinquish();
    String? result = await FilePicker.platform.getDirectoryPath();
    if (result != null) {
      var f = await _directory.load(result);
      setState(() {
        _files.clear();
        _files.addAll(f);
      });
    }
  }

  void _pickSong(ind) async {
    _bytes = await _files[ind].readAsBytes();
    setState(() {
      _currentFileName = basename(_files[ind].path);
    });
  }

  void _play() async {
    _player.setSong(_bytes.length);
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
            for (var i = 0; i < _files.length; i++)
              PrimaryFullButton(
                onPressed: () {
                  _pickSong(i);
                },
                child: Text(basename(_files[i].path)),
              ),
          ],
        ),
      ),
    );
  }
}
