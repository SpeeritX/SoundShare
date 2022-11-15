import 'package:flutter/material.dart';
import 'package:sound_share/ui/widgets/music/player_widget.dart';
import '../settings/settings_screen.dart';

class PlayerTestScreen extends StatefulWidget {
  const PlayerTestScreen({Key? key}) : super(key: key);

  @override
  State<PlayerTestScreen> createState() => _PlayerTestScreenState();
}

class _PlayerTestScreenState extends State<PlayerTestScreen> {
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
      body: Column(
        children: [
          Expanded(child: Container()),
          const PlayerWidget(),
        ],
      ),
    );
  }
}
