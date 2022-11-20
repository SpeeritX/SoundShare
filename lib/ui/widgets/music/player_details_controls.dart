import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../domain/controllers/player/player_controller.dart';
import '../../style/app_colors.dart';

const playIcon =
    FaIcon(FontAwesomeIcons.play, color: AppColors.white, size: 35.0);
const pauseIcon =
    FaIcon(FontAwesomeIcons.pause, color: AppColors.white, size: 35.0);

class PlayerDetailsControls extends StatefulWidget {
  final PlayerController playerController;

  const PlayerDetailsControls({
    required this.playerController,
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerDetailsControls> createState() => _PlayerDetailsControlsState();
}

class _PlayerDetailsControlsState extends State<PlayerDetailsControls> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: IconButton(
          iconSize: 30,
          onPressed: () {},
          icon: const FaIcon(
            FontAwesomeIcons.shuffle,
            color: AppColors.black,
            size: 20.0,
          ),
        ),
      ),
      Expanded(
        child: Ink(
          decoration: const ShapeDecoration(
            color: AppColors.yellow,
            shape: CircleBorder(),
          ),
          child: IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.backward,
              color: AppColors.white,
              size: 20.0,
            ),
          ),
        ),
      ),
      Expanded(
        child: Ink(
          decoration: const ShapeDecoration(
            color: AppColors.yellow,
            shape: CircleBorder(),
          ),
          child: IconButton(
            iconSize: 45,
            onPressed: () {
              if (!widget.playerController.isPlaying) {
                widget.playerController.play();
              } else {
                widget.playerController.pause();
              }
            },
            icon: !widget.playerController.isPlaying ? playIcon : pauseIcon,
          ),
        ),
      ),
      Expanded(
        child: Ink(
          decoration: const ShapeDecoration(
            color: AppColors.yellow,
            shape: CircleBorder(),
          ),
          child: IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.forward,
              color: AppColors.white,
              size: 20.0,
            ),
          ),
        ),
      ),
      Expanded(
        child: IconButton(
          iconSize: 30,
          onPressed: () {},
          icon: const FaIcon(
            FontAwesomeIcons.repeat,
            color: AppColors.black,
            size: 20.0,
          ),
        ),
      ),
    ]);
  }
}
