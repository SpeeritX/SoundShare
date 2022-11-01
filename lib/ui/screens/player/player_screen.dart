import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sound_share/common/utils/iterable_extensions.dart';
import 'package:sound_share/domain/music/music_package.dart';
import 'package:sound_share/domain/music/player/music_buffer.dart';
import 'package:sound_share/domain/music/player/music_player.dart';
import 'package:sound_share/domain/music/player/music_queue.dart';
import 'package:sound_share/network/link/direct_connection.dart';
import 'package:sound_share/ui/widgets/buttons/primary_full_button.dart';

class PlayerScreen extends StatefulWidget {
  final DirectConnection connection;

  const PlayerScreen({
    required this.connection,
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final MusicPlayer _player = MusicPlayer(MusicBuffer(), MusicQueue());
  late final DirectConnection _connection;
  List<int> _bytes = [];
  var _fileName = "";
  var _isPlaying = false;

  late StreamSubscription _subscription;

  @override
  void initState() {
    _connection = widget.connection;

    _subscription = _connection.readStream.listen((event) {
      _player.addPackage(MusicPackage(
        startTime: DateTime(0),
        duration: Duration.zero,
        data: event,
      ));
      if (!_isPlaying) {
        _player.setSong(null);
        _player.play();
        _isPlaying = true;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void _pickFile() async {
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

    // await _connection.write(Uint8List.fromList(_bytes));
    var packages = _bytes.toList().chunked((10000).floor());
    for (var package in packages) {
      await _connection.write(Uint8List.fromList(package));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Player"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Devices:"),
            StreamBuilder(
              stream: _connection.connectedDevices,
              builder: (BuildContext context,
                  AsyncSnapshot<Iterable<String>> snapshot) {
                final connections = snapshot.data ?? [];
                return Column(
                    children: connections.map((e) => Text(e)).toList());
              },
            ),
            Text(
              _fileName,
              style: Theme.of(context).textTheme.headline5,
            ),
            PrimaryFullButton(
              onPressed: () {
                _pickFile();
              },
              child: Text("Pick file"),
            ),
          ],
        ),
      ),
    );
  }
}
