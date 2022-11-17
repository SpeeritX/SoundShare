import 'package:flutter/material.dart';
import 'package:sound_share/domain/controllers/player/player_controller.dart';
import 'package:sound_share/domain/music/package/details_package.dart';
import 'package:sound_share/ui/style/app_colors.dart';

import '../../style/paddings.dart';

class SongWidget extends StatelessWidget {
  final DetailsPackage song;
  final PlayerController player;

  const SongWidget({
    Key? key,
    required this.song,
    required this.player,
  }) : super(key: key);

  onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Paddings.dynamic.m1),
      child: Row(children: [
        SizedBox(
            height: 80,
            width: 80,
            child: Image.asset('assets/Music1.png', fit: BoxFit.cover)),
        SizedBox(width: Paddings.dynamic.m1),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                song.title ?? "Unknown title",
                overflow: TextOverflow.fade,
                softWrap: false,
                style: Theme.of(context).textTheme.bodyText2!,
              ),
              SizedBox(height: Paddings.dynamic.m1 / 2),
              Text(
                song.artist ?? "Unknown artist",
                overflow: TextOverflow.fade,
                softWrap: false,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
