import 'package:flutter/material.dart';
import 'package:sound_share/ui/screens/player/music_test_screen.dart';
import 'package:sound_share/ui/screens/player/player_screen.dart';
import 'package:sound_share/ui/screens/settings/settings_screen.dart';
import 'package:sound_share/ui/widgets/buttons/primary_full_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            PrimaryFullButton(
              onPressed: () {},
              child: const Text("Join"),
            ),
            PrimaryFullButton(
              onPressed: () {},
              child: const Text("Create"),
            ),
            PrimaryFullButton(
              onPressed: () {
                _openPlayer();
              },
              child: const Text("Test music"),
            ),
          ],
        ),
      ),
    );
  }

  void _openPlayer() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MusicTestScreen()));
  }
}
