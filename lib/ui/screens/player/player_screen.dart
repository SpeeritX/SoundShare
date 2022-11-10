import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sound_share/domain/controllers/player/player_controller.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';
import 'package:sound_share/ui/widgets/buttons/primary_full_button.dart';

class PlayerScreen extends StatefulWidget {
  final P2pNetwork p2pNetwork;

  const PlayerScreen({
    required this.p2pNetwork,
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late final P2pNetwork _p2pNetwork;

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
        appBar: AppBar(
          title: const Text("Player"),
        ),
        body: SingleChildScrollView(
          child: Consumer<PlayerController>(
            builder: (context, value, child) => Column(
              children: [
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
                  value.currentSong?.details.title ??
                      (value.currentSong?.file.path) ??
                      "No selected",
                  style: Theme.of(context).textTheme.headline5,
                ),
                PrimaryFullButton(
                  onPressed: () {
                    value.pickSong();
                  },
                  child: Text("Pick file"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
