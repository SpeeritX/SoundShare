import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sound_share/domain/controllers/player/player_controller.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';
import 'package:sound_share/ui/widgets/buttons/primary_full_button.dart';
import 'package:sound_share/ui/widgets/music/song_widget.dart';

import '../../widgets/music/player_widget.dart';
import '../../widgets/scaffold/app_bar.dart';

class PlayerScreen extends StatefulWidget {
  final P2pNetwork p2pNetwork;
  final Duration playOffset;

  const PlayerScreen({
    required this.p2pNetwork,
    required this.playOffset,
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late final P2pNetwork _p2pNetwork;
  late final Duration _playOffset;

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
                      // const Text("Devices:"),
                      // StreamBuilder(
                      //   stream: _connection.connectedDevices,
                      //   builder: (BuildContext context,
                      //       AsyncSnapshot<Iterable<String>> snapshot) {
                      //     final connections = snapshot.data ?? [];
                      //     return Column(
                      //         children: connections.map((e) => Text(e)).toList());
                      //   },
                      // ),
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
    return playerController.songList
        .map((song) => SongWidget(song: song, player: playerController));
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
