import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sound_share/common/logger.dart';
import 'package:sound_share/domain/music/directory/directory.dart';
import 'package:sound_share/domain/music/song/song.dart';
import 'package:sound_share/ui/style/app_colors.dart';
import 'package:sound_share/ui/style/paddings.dart';
import 'package:sound_share/ui/style/style_values.dart';
import 'package:sound_share/ui/widgets/buttons/primary_full_button.dart';
import 'package:sound_share/ui/widgets/dialog/default_alert_dialog.dart';
import 'package:sound_share/ui/widgets/dialog/dialog_action.dart';

class PickDirectoryDialog extends StatefulWidget {
  const PickDirectoryDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<PickDirectoryDialog> createState() => _PickDirectoryDialogState();
}

class _PickDirectoryDialogState extends State<PickDirectoryDialog> {
  MusicDirectory? _directory;
  final List<MusicSong> _songs = [];

  @override
  Widget build(BuildContext context) {
    return DefaultAlertDialog(
      title: const Text("Pick a music directory"),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _build(),
      ),
      actions: [
        DialogAction(
          text: "Cancel",
          type: DialogActionType.neutral,
          onSelected: () {
            Navigator.of(context).pop();
          },
        ),
        DialogAction(
          text: "Ok",
          type: DialogActionType.primary,
          onSelected: () {
            logger.w("Cancel button clicked");
          },
        ),
      ],
    );
  }

  Widget _build() {
    return SizedBox(
      key: const Key("content"),
      child: Center(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Paddings.static.m2),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: StyleValues.defaultRadius,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1,
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(Paddings.static.m2),
                    child: Text(
                        _directory?.path != null ? _directory!.path : "...",
                        style: Theme.of(context).textTheme.headline4),
                  ),
                ),
                SizedBox(height: Paddings.dynamic.m2),
                PrimaryFullButton(
                  onPressed: () {
                    _loadFile();
                  },
                  text: "Pick a directory",
                ),
              ],
            )),
      ),
    );
  }

  void _loadFile() async {
    await _directory?.relinquish();
    String? result = await FilePicker.platform.getDirectoryPath();
    if (result != null) {
      _directory = MusicDirectory(result);
      await _directory?.getAccess();
      await _directory?.load();
      setState(() {
        _songs.clear();
        _songs.addAll(_directory?.songs ?? List.empty());
      });
    }
  }
}
