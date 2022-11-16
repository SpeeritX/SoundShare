import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sound_share/ui/style/app_colors.dart';
import 'package:sound_share/ui/widgets/shrink_tap.dart';

import '../../widgets/music/player_details_controls.dart';

class PlayerPageScreen extends StatefulWidget {
  const PlayerPageScreen({Key? key}) : super(key: key);

  @override
  State<PlayerPageScreen> createState() => _PlayerPageScreenState();
}

class _PlayerPageScreenState extends State<PlayerPageScreen> {
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
                      onPressed: () {},
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
                  "assets/Music1.png",
                  width: 340,
                  height: 340,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, bottom: 15),
                    child: Text(
                      "Somebody To Love",
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black),
                    ),
                  ),
                  Text(
                    "",
                    style: TextStyle(fontSize: 3),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      "OneRepublic",
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: TextStyle(
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
                          percent: 0,
                          progressColor: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: const Alignment(-1.0, 0.0),
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
                  children: const [
                    Text('0:00'),
                    Spacer(),
                    Text('3:20'),
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
}
