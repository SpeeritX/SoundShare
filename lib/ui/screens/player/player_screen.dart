import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';
import 'package:provider/provider.dart';
import 'package:sound_share/domain/controllers/player/player_controller.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';
import 'package:sound_share/ui/style/app_colors.dart';
import 'package:sound_share/ui/widgets/buttons/primary_full_button.dart';

import '../../../domain/music/song/song.dart';
import '../../style/paddings.dart';
import '../../widgets/buttons/small_button.dart';
import '../../widgets/music/player_widget.dart';
import '../../widgets/music/song_widget.dart';
import '../../widgets/scaffold/app_bar.dart';

class PlayerScreen extends StatefulWidget {
  final P2pNetwork p2pNetwork;
  final List<MusicSong> localSongs;

  const PlayerScreen({
    required this.p2pNetwork,
    required this.localSongs,
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  PageController controller = PageController();
  late final P2pNetwork _p2pNetwork;
  late final Duration _playOffset;
  var _pageNumber = 0;

  @override
  void initState() {
    _p2pNetwork = widget.p2pNetwork;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => PlayerController(_p2pNetwork)),
      child: Scaffold(
        appBar: DefaultAppBar(title: "Player"),
        body: Stack(
          children: <Widget>[
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: Paddings.dynamic.m2, right: Paddings.dynamic.m2),
                  child: Row(children: [
                    Expanded(
                      child: PrimaryFullButton(
                          text: "My Songs",
                          onPressed: () {
                            setState(() {
                              controller.jumpToPage(0);
                            });
                          },
                          style: getSwitchViewButtonStyle(_pageNumber == 0),
                          backgroundColor: Colors.transparent,
                          shadow: false,
                          animation: false),
                    ),
                    Expanded(
                      child: PrimaryFullButton(
                        text: "Queued Songs",
                        onPressed: () {
                          setState(() {
                            controller.jumpToPage(1);
                          });
                        },
                        style: getSwitchViewButtonStyle(_pageNumber == 1),
                        backgroundColor: Colors.transparent,
                        shadow: false,
                        animation: false,
                      ),
                    ),
                  ]),
                ),
                Expanded(
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    controller: controller,
                    onPageChanged: (num) {
                      setState(() {
                        _pageNumber = num;
                      });
                    },
                    children: [
                      SingleChildScrollView(
                        child: Consumer<PlayerController>(
                          builder: (context, playerController, child) => Column(
                            children: [
                              ..._createLocalSongsWidgets(playerController),
                              SizedBox(height: 4 * Paddings.dynamic.m4),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Consumer<PlayerController>(
                          builder: (context, playerController, child) => Column(
                            children: [
                              SizedBox(height: Paddings.dynamic.m3),
                              const TimerWidget(),
                              ..._createQueuedSongsWidgets(playerController),
                              SizedBox(height: 4 * Paddings.dynamic.m4),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Consumer<PlayerController>(
                    builder: (context, playerController, child) =>
                        (playerController.songList.isNotEmpty)
                            ? PlayerWidget(playerController: playerController)
                            : const SizedBox.shrink()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Iterable<SongWidget> _createLocalSongsWidgets(
      PlayerController playerController) {
    return widget.localSongs.map((musicSong) => SongWidget(
          inQueue: false,
          song: musicSong.details,
          player: playerController,
          action: SmallButton(
            onPressed: () {
              playerController.playSong(musicSong);
            },
            child: const FaIcon(
              FontAwesomeIcons.circlePlus,
              color: AppColors.primaryColor,
              size: 25.0,
            ),
          ),
        ));
  }

  Iterable<SongWidget> _createQueuedSongsWidgets(
      PlayerController playerController) {
    return playerController.songList.map((song) => SongWidget(
          inQueue: true,
          song: song,
          player: playerController,
          action: SmallButton(
            onPressed: () {
              playerController.removeSong(song.songId);
            },
            child: const FaIcon(
              FontAwesomeIcons.circleMinus,
              color: AppColors.primaryColor,
              size: 25.0,
            ),
          ),
        ));
  }

  TextStyle getSwitchViewButtonStyle(bool selected) {
    return selected
        ? Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(color: AppColors.primaryColor)
        : Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: AppColors.middleGray);
  }
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  final timeFormat = DateFormat('HH:mm:ss:SSS');
  late final Timer timer;
  Duration offset = const Duration();

  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {});
    });
    NTP.getNtpOffset().then((value) => offset = Duration(milliseconds: value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(timeFormat.format(DateTime.now().add(offset)));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
