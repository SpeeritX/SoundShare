import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sound_share/domain/controllers/player/player_controller.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';
import 'package:sound_share/ui/widgets/buttons/primary_full_button.dart';
import 'package:sound_share/ui/widgets/music/song_widget.dart';

import '../../../domain/music/song/song.dart';
import '../../widgets/music/player_widget.dart';
import '../../widgets/scaffold/app_bar.dart';

enum ViewType { queuedSongs, localSongs }

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
  late final P2pNetwork _p2pNetwork;
  var viewType = ViewType.queuedSongs;

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
            Positioned.fill(
              child: SingleChildScrollView(
                child: Consumer<PlayerController>(
                  builder: (context, playerController, child) => Column(
                    children: [
                      Row(children: [
                        PrimaryFullButton(
                          text: "Queued Songs",
                          onPressed: () {
                            setState(() {
                              viewType = ViewType.queuedSongs;
                            });
                          },
                          style: viewType == ViewType.queuedSongs
                              ? Theme.of(context).textTheme.bodyText2!
                              : Theme.of(context).textTheme.bodyText1!,
                          width: 150,
                          backgroundColor: Colors.transparent,
                        ),
                        PrimaryFullButton(
                          text: "Local Songs",
                          onPressed: () {
                            setState(() {
                              viewType = ViewType.localSongs;
                            });
                          },
                          style: viewType == ViewType.localSongs
                              ? Theme.of(context).textTheme.bodyText2!
                              : Theme.of(context).textTheme.bodyText1!,
                          width: 150,
                          backgroundColor: Colors.transparent,
                        ),
                      ]),
                      const TimerWidget(),
                      Text(
                        playerController.currentSong?.title ?? "No selected",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      PrimaryFullButton(
                        onPressed: () {
                          playerController.pickSong();
                        },
                        text: "Pick file",
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
      return playerController.songList
          .map((song) => SongWidget(song: song, player: playerController));
    } else {
      return widget.localSongs.map((musicSong) =>
          SongWidget(song: musicSong.details, player: playerController));
    }
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
