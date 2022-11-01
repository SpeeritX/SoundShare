import 'package:flutter/material.dart';
import 'package:sound_share/ui/screens/home/record_screen.dart';
import 'package:sound_share/ui/screens/player/music_test_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sound_share/ui/screens/player/player_screen.dart';
import 'package:sound_share/ui/screens/settings/settings_screen.dart';
import 'package:sound_share/ui/widgets/buttons/primary_full_button.dart';

import '../../../network/link/tcp_connection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _ip = "192.168.";
  late final TextEditingController _ipController =
      TextEditingController(text: _ip);
  TcpConnection tcpConnection = TcpConnection();

  _connect() async {
    if (await tcpConnection.connect(_ip)) {
      Fluttertoast.showToast(
        msg: "Connected.",
      );
      _openPlayer();
    } else {
      Fluttertoast.showToast(
        msg: "Error when connecting.",
      );
    }
  }

  _createNetwork() {
    tcpConnection.createNetwork();
    Fluttertoast.showToast(
      msg: "Created a new network.",
    );
    _openPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SoundShare"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsScreen()));
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _ipController,
              onChanged: (text) {
                setState(() {
                  _ip = text;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'IP',
              ),
            ),
            PrimaryFullButton(
              onPressed: () {
                _connect();
              },
              child: Text("Connect to $_ip"),
            ),
            PrimaryFullButton(
              onPressed: () {
                _createNetwork();
              },
              child: const Text("Create"),
            ),
            PrimaryFullButton(
              onPressed: () {
                _openTestMusic();
              },
              child: const Text("Test music"),
            ),
            PrimaryFullButton(
              onPressed: () {
                _openRecording();
              },
              child: const Text("Record"),
            ),
          ],
        ),
      ),
    );
  }

  void _openPlayer() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlayerScreen(connection: tcpConnection)));
  }

  void _openTestMusic() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MusicTestScreen()));
  }

  void _openRecording() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RecordScreen()));
  }
}
