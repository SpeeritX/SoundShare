import 'dart:async';

import 'package:collection/collection.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sound_share/common/logger.dart';
import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/domain/network/p2p/p2p_messages.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';
import 'package:sound_share/domain/network/p2p/synchronized_clock.dart';
import 'package:uuid/uuid.dart';

class PingMeasurement with Disposable {
  final P2pNetwork _p2pNetwork;

  String _currentPingId = "";
  DateTime _startTime = SynchronizedClock.now();
  final Map<String, List<double>> _offsets = {};
  final List<String> _peers = [];
  var _pongCompleter = Completer<PongMsg>();

  PingMeasurement(this._p2pNetwork) {
    _p2pNetwork.messageReceived.listen((event) {
      final msg = event.message;
      if (msg is PongMsg && msg.pingId == _currentPingId) {
        _onPongReceived(event.peerId, msg);
      }
      if (msg is PingMsg) {
        _p2pNetwork.sendToPeer(
            event.peerId, P2pMessage.pong(msg.id, SynchronizedClock.now()));
      }
      if (msg is SyncMsg) {
        SynchronizedClock.instance.clockOffset += msg.clockOffset;
        Fluttertoast.showToast(
          msg: "Synchronized time",
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    }).canceledBy(this);
  }

  void _onPongReceived(String peerId, PongMsg msg) async {
    _peers.remove(peerId);
    final times = _offsets[peerId] ?? [];

    final end = SynchronizedClock.now();
    final diff = end.difference(_startTime);
    logger.d(
        "Ping with $peerId: $diff, ${msg.time.difference(_startTime)}, ${end.difference(msg.time)}");
    final pongTime = msg.time;
    final absoluteDiff = ((pongTime.millisecondsSinceEpoch -
                _startTime.millisecondsSinceEpoch) +
            (pongTime.millisecondsSinceEpoch - end.millisecondsSinceEpoch)) /
        2;

    times.add(absoluteDiff);
    _offsets[peerId] = times;

    if (_peers.isEmpty) {
      _pongCompleter.complete(msg);
    }
  }

  Future<void> _measurePing() async {
    _peers.clear();
    _peers.addAll(_p2pNetwork.peers);

    _currentPingId = const Uuid().v4();
    _startTime = SynchronizedClock.now();
    _p2pNetwork.sendMessage(P2pMessage.ping(_currentPingId));
    _pongCompleter = Completer();

    await Future.any([
      _pongCompleter.future,
      Future.delayed(const Duration(seconds: 1)),
    ]);
    if (!_pongCompleter.isCompleted) {
      logger.w("Timeout when waiting for pong msg");
    }
  }

  Future<void> measureAverageTimeOffset() async {
    // await _measurePing();
    // Future.delayed(const Duration(seconds: 1));
    _peers.clear();
    _offsets.clear();
    for (var i = 0; i < 15; ++i) {
      await _measurePing();
    }
    logger.w("MEASUREMENTS: $_offsets");

    for (var peer in _offsets.keys) {
      final offsets = _offsets[peer]!;
      final offset = _calculateOffset(offsets);
      logger.d("Peer $peer offset: $offset");
      await _p2pNetwork.sendToPeer(
          peer,
          P2pMessage.sync(
            clockOffset: Duration(milliseconds: offset),
          ));
    }
  }

  int _calculateOffset(List<double> offsets) {
    final skipped = (offsets.length ~/ 2) - 1;
    final times = offsets
        .sorted((a, b) => a.compareTo(b))
        .sublist(skipped, offsets.length - skipped);
    return times.average.toInt();
  }
}
