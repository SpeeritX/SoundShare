import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sound_share/domain/controllers/player/player_controller.dart';
import 'package:sound_share/ui/screens/player/player_page_screen.dart';
import 'package:sound_share/ui/style/app_colors.dart';
import 'package:sound_share/ui/widgets/buttons/small_button.dart';

import '../../style/paddings.dart';

class PlayerWidget extends StatefulWidget {
  final PlayerController playerController;

  static const FaIcon playIcon = FaIcon(
    FontAwesomeIcons.play,
    color: Colors.white,
    size: 25.0,
  );

  static const FaIcon pauseIcon = FaIcon(
    FontAwesomeIcons.pause,
    color: Colors.white,
    size: 25.0,
  );

  const PlayerWidget({
    required this.playerController,
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  bool toggle = false;
  late final Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () => {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PlayerPageScreen(
                    playerController: widget.playerController,
                  )))
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(child: _buildButtons()),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment(0, 0.745),
                child: LinearPercentIndicator(
                  padding: const EdgeInsets.only(left: 66, right: 28),
                  lineHeight: 2,
                  percent: widget.playerController
                      .getCurrentSongPositionPercentage(),
                  progressColor: AppColors.secondary,
                  backgroundColor: AppColors.primaryColor,
                ),
              ),
            ),
            ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(40), // Image radius
                child: Image.asset('assets/Music.png', fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Stack(children: [
      Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: LinearPercentIndicator(
            padding: const EdgeInsets.only(left: 80, right: 28),
            lineHeight: 2,
            percent: widget.playerController.getCurrentSongPositionPercentage(),
            progressColor: AppColors.secondary,
            backgroundColor: AppColors.primaryColor,
          ),
        ),
      ),
      Container(
        height: 60,
        padding: const EdgeInsets.only(
          left: 90,
          top: 10,
          right: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.primaryColor,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.only(right: Paddings.static.m1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.playerController.currentSong?.title ?? "",
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: AppColors.white)),
                    Text(
                      widget.playerController.currentSong?.artist ?? "",
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: AppColors.secondary),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: SmallButton(
                    onPressed: () {},
                    child: const FaIcon(
                      FontAwesomeIcons.backward,
                      color: Colors.white,
                      size: 25.0,
                    ))),
            Expanded(
              flex: 2,
              child: SmallButton(
                onPressed: () {
                  if (!widget.playerController.isPlaying) {
                    widget.playerController.play();
                  } else {
                    widget.playerController.pause();
                  }
                },
                child: !widget.playerController.isPlaying ? PlayerWidget.playIcon : PlayerWidget.pauseIcon,
              ),
            ),
            Expanded(
                flex: 2,
                child: SmallButton(
                    onPressed: () {},
                    child: const FaIcon(
                      FontAwesomeIcons.forward,
                      color: Colors.white,
                      size: 25.0,
                    ))),
          ],
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
