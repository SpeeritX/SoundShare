import 'package:flutter/material.dart';
import 'package:sound_share/ui/screens/home/record_screen.dart';
import 'package:sound_share/ui/screens/player/music_test_screen.dart';
import 'package:sound_share/ui/style/app_colors.dart';

import '../../style/paddings.dart';
import '../../widgets/scaffold/app_bar.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "Sound Share"),
      body: Stack(
        // alignment: Alignment.topCenter,
        children: <Widget>[
          const Positioned.fill(child: Text("Main content")),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // TODO: replace with player widget
                padding: EdgeInsets.all(Paddings.dynamic.m3),
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [Text("Player widget")]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openTestMusic() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MusicTestScreen()));
  }

  void _openRecording() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const RecordScreen()));
  }
}
