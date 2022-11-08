import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';
import 'package:sound_share/ui/screens/home/record_screen.dart';
import 'package:sound_share/ui/screens/player/music_test_screen.dart';
import 'package:sound_share/ui/screens/player/player_screen.dart';

import '../../widgets/buttons/primary_full_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _ip = "192.168.";
  late final TextEditingController _ipController =
      TextEditingController(text: _ip);

  _connect() async {
    final p2pNetwork = P2pNetwork();
    p2pNetwork.connect(_ip);
    _openPlayer(p2pNetwork);
  }

  _createNetwork() {
    _openPlayer(P2pNetwork());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/MainPage.svg',
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
            ),
          ),
        ],
      ),
    );
  }

  void _openPlayer(P2pNetwork p2pNetwork) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlayerScreen(p2pNetwork: p2pNetwork)));
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
