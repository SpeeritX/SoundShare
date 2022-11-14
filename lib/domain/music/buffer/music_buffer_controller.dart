import 'package:sound_share/common/utils/disposable.dart';
import 'package:sound_share/domain/music/buffer/music_buffer_collection.dart';
import 'package:sound_share/domain/music/package/details_package.dart';
import 'package:sound_share/domain/music/player/bytes_audio_source.dart';
import 'package:sound_share/domain/music/player/music_queue.dart';
import 'package:sound_share/domain/network/p2p/p2p_messages.dart';
import 'package:sound_share/domain/network/p2p/p2p_network.dart';

class MusicBufferController with Disposable implements MusicBufferListener {
  final MusicQueue _queue;
  final P2pNetwork _p2pNetwork;
  final _buffer = MusicBufferCollection();

  MusicBufferController(this._queue, this._p2pNetwork) {
    _p2pNetwork.musicBufferListener = this;

    _queue.updateEvents.listen((_) {
      _updateBuffer();
    }).canceledBy(this);

    _buffer.onDownloadFinished.listen((_) {
      _updateBuffer();
    }).canceledBy(this);
  }

  @override
  void onMusicPackage(MusicPackageMsg package) {
    _buffer.onMusicPackage(package.songId, package.deserializeBytes());
  }

  BytesAudioSource getSong(DetailsPackage song) {
    if (!_buffer.contains(song.songId)) {
      _downloadSong(song);
    }

    return _buffer.getSong(song.songId);
  }

  void _updateBuffer() {
    final currentSong = _queue.currentSong;
    if (currentSong != null && !_buffer.contains(currentSong.songId)) {
      _downloadSong(currentSong);
      return;
    }

    if (_buffer.isDownloadInProgress()) {
      return;
    }

    final songs = _queue.getQueuedSongs();
    for (final song in songs.take(MusicBufferCollection.maxSongs)) {
      if (!_buffer.contains(song.songId)) {
        _downloadSong(song);
        return;
      }
    }
  }

  void _downloadSong(DetailsPackage song) {
    _buffer.addSong(song);
    _p2pNetwork.sendMessage(P2pMessage.requestResource(id: song.songId));
  }

  @override
  void dispose() {
    _p2pNetwork.musicBufferListener = this;
    super.dispose();
  }
}
