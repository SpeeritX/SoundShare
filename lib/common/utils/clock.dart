import 'package:sound_share/common/logger.dart';

/// Based on [Stopwatch]
/// Works on iOS in background
class Clock {
  final String tag;
  final bool debug;
  int _start = DateTime.now().millisecondsSinceEpoch;
  int? _stop;

  Clock({this.tag = "", this.debug = true});

  Duration get elapsed {
    return Duration(milliseconds: elapsedMillis);
  }

  int get elapsedMillis {
    return (_stop ?? _now()) - _start;
  }

  void stop() {
    _stop = _now();
  }

  void start() {
    var stop = _stop;
    if (stop != null) {
      _start += _now() - stop;
    }
  }

  void reset({int initialOffset = 0}) {
    _start = _stop ?? _now() + initialOffset;
  }

  void printElapsed() {
    if (debug) {
      logger.d("$tag Elapsed: ${elapsedMillis}ms");
    } else {
      logger.i("$tag Elapsed: ${elapsedMillis}ms");
    }
  }

  int _now() => DateTime.now().millisecondsSinceEpoch;
}
