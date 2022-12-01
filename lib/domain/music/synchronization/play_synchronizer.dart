import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class PlaySynchronizer {
  static const playOffsetKey = "playOffset";
  static const measuredOffsetKey = "measuredOffset";
  static final instance = PlaySynchronizer._();

  late final SharedPreferences _preferences;
  var _playOffset = Duration.zero;
  var _measuredOffset = Duration.zero;
  final _playOffsetStream = StreamController<Duration>.broadcast();
  final _measuredOffsetStream = StreamController<Duration>.broadcast();

  PlaySynchronizer._();

  Duration get playOffset => _playOffset;

  Stream<Duration> get playOffsetStream => _playOffsetStream.stream;

  set playOffset(Duration offset) {
    _playOffset = offset;
    _playOffsetStream.add(offset);
    _preferences.setInt(playOffsetKey, offset.inMilliseconds);
  }

  Stream<Duration> get measuredOffsetStream => _measuredOffsetStream.stream;

  Duration get measuredOffset => _measuredOffset;

  set measuredOffset(Duration offset) {
    _measuredOffset = offset;
    _measuredOffsetStream.add(offset);
    _preferences.setInt(measuredOffsetKey, offset.inMilliseconds);
  }

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    _playOffset =
        Duration(milliseconds: _preferences.getInt(playOffsetKey) ?? 0);
    _measuredOffset =
        Duration(milliseconds: _preferences.getInt(measuredOffsetKey) ?? 0);
  }
}
