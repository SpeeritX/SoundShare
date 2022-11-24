import 'package:flutter/material.dart';
import 'package:sound_share/domain/controllers/player/player_controller.dart';
import 'package:sound_share/ui/style/paddings.dart';
import 'package:sound_share/ui/widgets/buttons/primary_full_button.dart';

import '../../widgets/scaffold/app_bar.dart';

class SettingsScreen extends StatefulWidget {
  final PlayerController playerController;

  const SettingsScreen({required this.playerController, Key? key})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final PlayerController _playerController;

  var musicChunkSize = "0";
  late final TextEditingController _musicChunkSizeController =
      TextEditingController(text: musicChunkSize);

  @override
  void initState() {
    _playerController = widget.playerController;
    musicChunkSize = _playerController.musicChunkSize.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "Settings"),
      body: Container(
        padding: EdgeInsets.all(Paddings.dynamic.m3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Music chunk size"),
            TextField(
              controller: _musicChunkSizeController,
              onChanged: (text) {
                setState(() {
                  musicChunkSize = text;
                });
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: Paddings.dynamic.m3),
            PrimaryFullButton(
              onPressed: () {
                _saveSettings();
              },
              text: 'Save',
            ),
          ],
        ),
      ),
    );
  }

  void _saveSettings() {
    _playerController.setMusicChunkSize(int.parse(musicChunkSize));
  }
}
