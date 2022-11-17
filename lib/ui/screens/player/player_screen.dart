import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sound_share/domain/controllers/player/player_controller.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';
import 'package:sound_share/ui/style/app_colors.dart';
import 'package:sound_share/ui/style/paddings.dart';
import 'package:sound_share/ui/widgets/buttons/primary_full_button.dart';
import 'package:sound_share/ui/widgets/buttons/small_button.dart';
import 'package:sound_share/ui/widgets/music/song_widget.dart';

import '../../../domain/music/song/song.dart';
import '../../widgets/music/player_widget.dart';
import '../../widgets/scaffold/app_bar.dart';

enum ViewType { queuedSongs, localSongs }

class PlayerScreen extends StatefulWidget {
  final P2pNetwork p2pNetwork;
  final Duration playOffset;
  final List<MusicSong> localSongs;

  const PlayerScreen({
    required this.p2pNetwork,
    required this.playOffset,
    required this.localSongs,
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late final P2pNetwork _p2pNetwork;
  late final Duration _playOffset;
  var viewType = ViewType.queuedSongs;

  @override
  void initState() {
    _p2pNetwork = widget.p2pNetwork;
    _playOffset = widget.playOffset;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => PlayerController(_p2pNetwork, _playOffset)),
      child: Scaffold(
        appBar: DefaultAppBar(title: "Player"),
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: SingleChildScrollView(
                child: Consumer<PlayerController>(
                  builder: (context, playerController, child) => Column(
                    children: [
                      const TimerWidget(),
                      Container(
                        padding: EdgeInsets.only(
                            left: Paddings.dynamic.m2,
                            right: Paddings.dynamic.m2),
                        child: Row(children: [
                          Expanded(
                            child: PrimaryFullButton(
                              text: "Queued Songs",
                              onPressed: () {
                                setState(() {
                                  viewType = ViewType.queuedSongs;
                                });
                              },
                              style: getSwitchViewButtonStyle(
                                  viewType == ViewType.queuedSongs),
                              backgroundColor: Colors.transparent,
                              shadow: false,
                              animation: false,
                            ),
                          ),
                          Expanded(
                            child: PrimaryFullButton(
                                text: "Local Songs",
                                onPressed: () {
                                  setState(() {
                                    viewType = ViewType.localSongs;
                                  });
                                },
                                style: getSwitchViewButtonStyle(
                                    viewType == ViewType.localSongs),
                                backgroundColor: Colors.transparent,
                                shadow: false,
                                animation: false),
                          ),
                        ]),
                      ),
                      Text(
                        playerController.currentSong?.title ?? "No selected",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(height: 100),
                      PrimaryFullButton(
                        onPressed: () {
                          playerController.play();
                        },
                        text: "Play",
                      ),
                      ..._createSongsWidgets(playerController),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Consumer<PlayerController>(
                    builder: (context, playerController, child) =>
                        PlayerWidget(playerController: playerController)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Iterable<SongWidget> _createSongsWidgets(PlayerController playerController) {
    if (viewType == ViewType.queuedSongs) {
      return playerController.songList.map((song) => SongWidget(
            song: song,
            player: playerController,
            action: SmallButton(
              onPressed: () {
                playerController.removeSong(song.songId);
              },
              child: const FaIcon(
                FontAwesomeIcons.circleMinus,
                color: AppColors.red,
                size: 25.0,
              ),
            ),
          ));
    } else {
      return widget.localSongs.map((musicSong) => SongWidget(
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
  }

  TextStyle getSwitchViewButtonStyle(bool selected) {
    return selected
        ? Theme.of(context).textTheme.headline3!
        : Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: AppColors.primaryColor);
  }
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  final timeFormat = DateFormat('HH:mm:ss:S');
  late final Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(timeFormat.format(DateTime.now()));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
