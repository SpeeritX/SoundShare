import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sound_share/common/logger.dart';

class BytesAudioSource extends StreamAudioSource {
  final int? _dataLength;
  final List<int> _bytes = List.empty(growable: true);

  StreamController<List<int>>? _stream;
  int _currentStart = 0;
  int _currentEnd = 0;

  BytesAudioSource(this._dataLength) {
    logger.d("BytesAudioSource($_dataLength)");
  }

  bool get isDownloaded => _bytes.length >= (_dataLength ?? 0);

  void addData(List<int> data) {
    logger.d("BytesAudioSource addData at ${_bytes.length}, ${data.length}");
    _bytes.addAll(data);
    _updateCurrentStream();
  }

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    logger.d("BytesAudioSource request: [${DateTime.now()}] $start $end");

    start ??= 0;
    end ??= _dataLength ?? _bytes.length;

    _currentStart = start;
    _currentEnd = end;

    _stream?.close();
    final stream = ReplaySubject<List<int>>();
    _stream = stream;
    _updateCurrentStream();

    return StreamAudioResponse(
      rangeRequestsSupported: true,
      sourceLength: _dataLength,
      contentLength: end - start,
      offset: start,
      stream: stream.stream,
      contentType: 'audio/mpeg',
    );
  }

  void _updateCurrentStream() {
    final stream = _stream;
    if (stream != null) {
      if (_currentEnd > _bytes.length) {
        stream.add(_bytes.sublist(_currentStart));
        _currentStart = _bytes.length;
      } else {
        stream.add(_bytes.sublist(_currentStart, _currentEnd));
        stream.close();
        _stream = null;
      }
    }
  }
}
