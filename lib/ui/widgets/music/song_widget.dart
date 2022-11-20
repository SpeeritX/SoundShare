import 'package:flutter/material.dart';
import 'package:sound_share/domain/controllers/player/player_controller.dart';
import 'package:sound_share/domain/music/package/details_package.dart';
import 'package:sound_share/ui/style/app_colors.dart';

import '../../style/paddings.dart';

class SongWidget extends StatelessWidget {
  final DetailsPackage song;
  final PlayerController player;
  final Widget action;
  final bool inQueue;

  const SongWidget({
    Key? key,
    required this.song,
    required this.player,
    required this.action,
    required this.inQueue,
  }) : super(key: key);

  onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Paddings.dynamic.m2,
          top: Paddings.dynamic.m1,
          right: Paddings.dynamic.m2,
          bottom: Paddings.dynamic.m1),
      child: Row(children: [
        SizedBox(
            height: 70,
            width: 70,
            child: Image.asset('assets/Music.png', fit: BoxFit.cover)),
        SizedBox(width: Paddings.dynamic.m1),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                song.title ?? "",
                overflow: TextOverflow.fade,
                softWrap: false,
                style: _getTitleStyle(context),
              ),
              SizedBox(height: Paddings.dynamic.m1 / 2),
              Text(
                song.artist ?? "",
                overflow: TextOverflow.fade,
                softWrap: false,
                style: _getArtistStyle(context),
              ),
            ],
          ),
        ),
        action,
      ]),
    );
  }

  TextStyle _getTitleStyle(BuildContext context) {
    var color = (!inQueue || player.currentSong?.songId == song.songId)
        ? AppColors.darkGray
        : AppColors.middleGray;
    return Theme.of(context).textTheme.bodyText2!.copyWith(color: color);
  }

  TextStyle _getArtistStyle(BuildContext context) {
    var color = (!inQueue || player.currentSong?.songId == song.songId)
        ? AppColors.primaryColor
        : AppColors.middleGray;
    return Theme.of(context).textTheme.bodyText2!.copyWith(color: color);
  }
}
