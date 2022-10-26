import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sound_share/common/utils/iterable_extensions.dart';
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
  List<int> _bytes = [];
  var _fileName = "";

  @override
  void initState() {
    _loadFile();
    super.initState();
  }

  @override
  void dispose() {
    _player.stop();
    super.dispose();
  }

  void _loadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      _bytes = await file.readAsBytes();
      setState(() {
        _fileName = file.path.split(Platform.pathSeparator).last;
      });
    } else {
      // User canceled the picker
      setState(() {
        _fileName = "";
      });
    }
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
      await Future.delayed(Duration(milliseconds: 50));
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
              _fileName,
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
              child: const Text("Pick song"),
            ),
          ],
        ),
      ),
    );
  }
}
