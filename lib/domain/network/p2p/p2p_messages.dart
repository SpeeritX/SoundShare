import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sound_share/domain/music/package/details_package.dart';

part 'p2p_messages.freezed.dart';
part 'p2p_messages.g.dart';

@Freezed(unionKey: "type")
class P2pMessage with _$P2pMessage {
  const factory P2pMessage.requestResource({
    required String id,
  }) = RequestResourceMsg;

  const factory P2pMessage.resource({
    required String id,
  }) = ResourceMsg;

  const factory P2pMessage.requestStateUpdate() = RequestStateUpdateMsg;

  const factory P2pMessage.stateUpdateMsg({
    required List<String> devices,
  }) = StateUpdateMsg;

  const factory P2pMessage.musicPackage({
    required String songId,
    required String serializedBytes,
  }) = MusicPackageMsg;

  const factory P2pMessage.play(
    int index,
  ) = PlayMsg;

  const factory P2pMessage.pause() = PauseMsg;

  const factory P2pMessage.skipSong() = SkipSongMsg;

  const factory P2pMessage.previousSong() = PreviousSongMsg;

  const factory P2pMessage.addSongToQueue(
    DetailsPackage songData,
  ) = AddSongToQueueMsg;

  const factory P2pMessage.removeSongFromQueue() = RemoveSongFromQueueMsg;

  factory P2pMessage.fromJson(Map<String, dynamic> json) =>
      _$P2pMessageFromJson(json);
}

extension MusicPackageExt on MusicPackageMsg {
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
