import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class PlaySynchronizer {
  static const playOffsetKey = "playOffset";
  static final instance = PlaySynchronizer._();

  late final SharedPreferences _preferences;
  var _playOffset = Duration.zero;
  final _playOffsetStream = StreamController<Duration>.broadcast();

  PlaySynchronizer._();

  Duration get playOffset => _playOffset;

  Stream<Duration> get playOffsetStream => _playOffsetStream.stream;

  set playOffset(Duration offset) {
    _playOffset = offset;
    _playOffsetStream.add(offset);
    _preferences.setInt(playOffsetKey, offset.inMilliseconds);
  }

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    _playOffset =
        Duration(milliseconds: _preferences.getInt(playOffsetKey) ?? 0);
  }
}
