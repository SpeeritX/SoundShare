import 'package:flutter/material.dart';
import 'package:sound_share/network/link/direct_connection.dart';

class PlayerScreen extends StatefulWidget {
  final DirectConnection connection;

  const PlayerScreen({
    required this.connection,
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late final DirectConnection _connection;

  @override
  void initState() {
    _connection = widget.connection;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Player"),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _connection.connectedDevices,
          builder:
              (BuildContext context, AsyncSnapshot<Iterable<String>> snapshot) {
            final connections = snapshot.data ?? [];
            return Column(children: connections.map((e) => Text(e)).toList());
          },
        ),
      ),
    );
  }
}
