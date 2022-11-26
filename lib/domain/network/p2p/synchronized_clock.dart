import 'dart:async';

class SynchronizedClock {
  static final instance = SynchronizedClock._();

  SynchronizedClock._();

  Duration _clockOffset = Duration.zero;
  final _clockUpdatedStream = StreamController<Duration>.broadcast();

  Stream<Duration> get clockUpdated => _clockUpdatedStream.stream;

  Duration get clockOffset => _clockOffset;

  set clockOffset(Duration offset) {
    _clockOffset = offset;
    _clockUpdatedStream.add(_clockOffset);
  }

  static DateTime now() =>
      DateTime.now().subtract(SynchronizedClock.instance.clockOffset);
}
