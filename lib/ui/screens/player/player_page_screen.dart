import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sound_share/domain/controllers/player/player_controller.dart';
import 'package:sound_share/ui/style/app_colors.dart';
import 'package:sound_share/ui/widgets/shrink_tap.dart';

import '../../widgets/music/player_details_controls.dart';

class PlayerPageScreen extends StatefulWidget {
  final PlayerController playerController;

  const PlayerPageScreen({required this.playerController, Key? key})
      : super(key: key);

  @override
  State<PlayerPageScreen> createState() => _PlayerPageScreenState();
}

class _PlayerPageScreenState extends State<PlayerPageScreen> {
  late final Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Ink(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.background,
              AppColors.white,
            ],
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 30.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.angleDown,
                        color: AppColors.black,
                        size: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 30),
                child: Image.asset(
                  "assets/Music.png",
                  width: 340,
                  height: 340,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 15),
                    child: Text(
                      widget.playerController.currentSong?.title ?? "",
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black),
                    ),
                  ),
                  const Text(
                    "",
                    style: TextStyle(fontSize: 3),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      widget.playerController.currentSong?.artist ?? "",
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                          height: 1.0),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 20,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Center(
                        child: LinearPercentIndicator(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          lineHeight: 2,
                          percent: widget.playerController
                              .getCurrentSongPositionPercentage(),
                          progressColor: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment(_getMarkerPosition(), 0.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: ShrinkTap(
                            onTap: () {},
                            child: const FaIcon(
                              FontAwesomeIcons.solidCircle,
                              color: AppColors.primaryColor,
                              size: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, top: 8, right: 30, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_getCurrentSongPosition()),
                    const Spacer(),
                    Text(_getCurrentSongDuration()),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 60),
                child: PlayerDetailsControls(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _getMarkerPosition() {
    return widget.playerController.getCurrentSongPositionPercentage() * 2 - 1;
  }

  String _getCurrentSongPosition() {
    var duration =
        widget.playerController.getCurrentSongPosition() ?? const Duration();
    return _durationToString(duration);
  }

  String _getCurrentSongDuration() {
    var duration = widget.playerController.getCurrentSongDuration() ??
        widget.playerController.currentSong?.duration ??
        const Duration();
    return _durationToString(duration);
  }

  String _durationToString(Duration duration) {
    var seconds = duration.inSeconds % 60;
    var milliseconds = duration.inMilliseconds % 1000;
    var minutes = duration.inMinutes;
    return "$minutes:${seconds < 10 ? "0" : ""}${seconds % 60}:$milliseconds";
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
