import 'package:flutter/material.dart';
import 'package:sound_share/domain/music/player/music_player.dart';
import 'package:sound_share/ui/widgets/buttons/primary_full_button.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final player = MusicPlayer();

  @override
  void initState() {
    player.loadFile();
    super.initState();
  }

  Future<void> init() async {}

  @override
  void dispose() {
    player.stop();
    super.dispose();
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
            PrimaryFullButton(
              onPressed: () {
                player.play();
              },
              child: const Text("Play"),
            ),
            PrimaryFullButton(
              onPressed: () {
                player.pause();
              },
              child: const Text("Pause"),
            ),
          ],
        ),
      ),
    );
  }
}
