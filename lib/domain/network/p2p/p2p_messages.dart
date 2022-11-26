import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sound_share/domain/music/package/details_package.dart';

part 'p2p_messages.freezed.dart';
part 'p2p_messages.g.dart';

class P2pMessageEvent {
  final P2pMessage message;
  final String peerId;

  const P2pMessageEvent(this.message, this.peerId);
}

@Freezed(unionKey: "type")
class P2pMessage with _$P2pMessage {
  const factory P2pMessage.sync({
    required Duration clockOffset,
  }) = SyncMsg;

  const factory P2pMessage.searchResource({
    required String songId,
  }) = SearchResourceMsg;

  const factory P2pMessage.requestResource({
    required String requestId,
    required String songId,
    required int startIndex,
  }) = RequestResourceMsg;

  const factory P2pMessage.resourceAvailability({
    required String songId,
  }) = ResourceAvailabilityMsg;

  const factory P2pMessage.musicPackage({
    required String requestId,
    required String songId,
    required int startIndex,
    required String serializedBytes,
  }) = MusicPackageMsg;

  const factory P2pMessage.requestStateUpdate() = RequestStateUpdateMsg;

  const factory P2pMessage.stateUpdateMsg({
    required List<String> devices,
    required List<DetailsPackage> queue,
    required int queuePosition,
  }) = StateUpdateMsg;

  const factory P2pMessage.play(
      int index, DateTime time, Duration? songPosition) = PlayMsg;

  const factory P2pMessage.pause() = PauseMsg;

  const factory P2pMessage.skipSong() = SkipSongMsg;

  const factory P2pMessage.previousSong() = PreviousSongMsg;

  const factory P2pMessage.addSongToQueue(DetailsPackage songData) =
      AddSongToQueueMsg;

  const factory P2pMessage.removeSongFromQueue(int index) =
      RemoveSongFromQueueMsg;

  const factory P2pMessage.setMusicChunkSize(
    int size,
  ) = SetMusicChunkSizeMsg;

  const factory P2pMessage.ping(String id) = PingMsg;

  const factory P2pMessage.pong(
    String pingId,
    DateTime time,
  ) = PongMsg;

  factory P2pMessage.fromJson(Map<String, dynamic> json) =>
      _$P2pMessageFromJson(json);
}

extension MusicPackageMsgExt on MusicPackageMsg {
  Uint8List deserializeBytes() {
    return base64.decode(serializedBytes);
  }

  static String serializeBytes(Uint8List bytes) {
    return base64.encode(bytes);
  }
}

extension P2pMessageExt on P2pMessage {
  Uint8List toBytes() {
    return Uint8List.fromList(jsonEncode(toJson()).codeUnits);
  }
}
