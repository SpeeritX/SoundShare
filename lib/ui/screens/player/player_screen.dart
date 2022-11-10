import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sound_share/domain/music/package/music_package.dart';
import 'package:sound_share/domain/music/buffer/music_buffer.dart';
import 'package:sound_share/domain/music/player/music_player.dart';
import 'package:sound_share/domain/music/player/music_queue.dart';
import 'package:sound_share/domain/music/reader/music_reader.dart';
import 'package:sound_share/domain/music/song/song.dart';
import 'package:sound_share/domain/network/p2p/p2p_messages.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';
import 'package:sound_share/ui/widgets/buttons/primary_full_button.dart';

class PlayerScreen extends StatefulWidget {
  final P2pNetwork p2pNetwork;

  const PlayerScreen({
    required this.p2pNetwork,
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final MusicPlayer _player =
      MusicPlayer(MusicBufferCollection(), MusicQueue());
  late final P2pNetwork _p2pNetwork;
  var _fileName = "";

  late StreamSubscription _subscription;

  @override
  void initState() {
    _p2pNetwork = widget.p2pNetwork;
    _p2pNetwork.musicPlayerListener = _player;

    _subscription = _p2pNetwork.songBytesStream.listen((event) {
      _player.addPackage(MusicPackage(
        songId: "",
        data: event,
        startIndex: 0,
        endIndex: 0,
      ));
    });
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    _p2pNetwork.musicPlayerListener = null;
    _p2pNetwork.dispose();
    super.dispose();
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        _fileName = file.path.split(Platform.pathSeparator).last;
      });
      final song = MusicSong(file: file);
      var packages = await MusicReader.create(song: song);
      await _p2pNetwork
          .sendMessage(P2pMessage.addSongToQueue(await song.getAttributes()));
      while (true) {
        var package = packages.next();
        if (package == null) {
          break;
        }
        await _p2pNetwork.sendBytes(Uint8List.fromList(package.data));
      }
    } else {
      // User canceled the picker
      setState(() {
        _fileName = "";
      });
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
            // const Text("Devices:"),
            // StreamBuilder(
            //   stream: _connection.connectedDevices,
            //   builder: (BuildContext context,
            //       AsyncSnapshot<Iterable<String>> snapshot) {
            //     final connections = snapshot.data ?? [];
            //     return Column(
            //         children: connections.map((e) => Text(e)).toList());
            //   },
            // ),
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
