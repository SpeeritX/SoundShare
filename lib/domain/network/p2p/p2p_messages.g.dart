// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyncMsg _$$SyncMsgFromJson(Map<String, dynamic> json) => _$SyncMsg(
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$SyncMsgToJson(_$SyncMsg instance) => <String, dynamic>{
      'type': instance.$type,
    };

_$SearchResourceMsg _$$SearchResourceMsgFromJson(Map<String, dynamic> json) =>
    _$SearchResourceMsg(
      songId: json['songId'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$SearchResourceMsgToJson(_$SearchResourceMsg instance) =>
    <String, dynamic>{
      'songId': instance.songId,
      'type': instance.$type,
    };

_$RequestResourceMsg _$$RequestResourceMsgFromJson(Map<String, dynamic> json) =>
    _$RequestResourceMsg(
      requestId: json['requestId'] as String,
      songId: json['songId'] as String,
      startIndex: json['startIndex'] as int,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$RequestResourceMsgToJson(
        _$RequestResourceMsg instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'songId': instance.songId,
      'startIndex': instance.startIndex,
      'type': instance.$type,
    };

_$ResourceAvailabilityMsg _$$ResourceAvailabilityMsgFromJson(
        Map<String, dynamic> json) =>
    _$ResourceAvailabilityMsg(
      songId: json['songId'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ResourceAvailabilityMsgToJson(
        _$ResourceAvailabilityMsg instance) =>
    <String, dynamic>{
      'songId': instance.songId,
      'type': instance.$type,
    };

_$MusicPackageMsg _$$MusicPackageMsgFromJson(Map<String, dynamic> json) =>
    _$MusicPackageMsg(
      requestId: json['requestId'] as String,
      songId: json['songId'] as String,
      startIndex: json['startIndex'] as int,
      serializedBytes: json['serializedBytes'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$MusicPackageMsgToJson(_$MusicPackageMsg instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'songId': instance.songId,
      'startIndex': instance.startIndex,
      'serializedBytes': instance.serializedBytes,
      'type': instance.$type,
    };

_$RequestStateUpdateMsg _$$RequestStateUpdateMsgFromJson(
        Map<String, dynamic> json) =>
    _$RequestStateUpdateMsg(
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$RequestStateUpdateMsgToJson(
        _$RequestStateUpdateMsg instance) =>
    <String, dynamic>{
      'type': instance.$type,
    };

_$StateUpdateMsg _$$StateUpdateMsgFromJson(Map<String, dynamic> json) =>
    _$StateUpdateMsg(
      devices:
          (json['devices'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$StateUpdateMsgToJson(_$StateUpdateMsg instance) =>
    <String, dynamic>{
      'devices': instance.devices,
      'type': instance.$type,
    };

_$PlayMsg _$$PlayMsgFromJson(Map<String, dynamic> json) => _$PlayMsg(
      json['index'] as int,
      DateTime.parse(json['time'] as String),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$PlayMsgToJson(_$PlayMsg instance) => <String, dynamic>{
      'index': instance.index,
      'time': instance.time.toIso8601String(),
      'type': instance.$type,
    };

_$PauseMsg _$$PauseMsgFromJson(Map<String, dynamic> json) => _$PauseMsg(
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$PauseMsgToJson(_$PauseMsg instance) =>
    <String, dynamic>{
      'type': instance.$type,
    };

_$SkipSongMsg _$$SkipSongMsgFromJson(Map<String, dynamic> json) =>
    _$SkipSongMsg(
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$SkipSongMsgToJson(_$SkipSongMsg instance) =>
    <String, dynamic>{
      'type': instance.$type,
    };

_$PreviousSongMsg _$$PreviousSongMsgFromJson(Map<String, dynamic> json) =>
    _$PreviousSongMsg(
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$PreviousSongMsgToJson(_$PreviousSongMsg instance) =>
    <String, dynamic>{
      'type': instance.$type,
    };

_$AddSongToQueueMsg _$$AddSongToQueueMsgFromJson(Map<String, dynamic> json) =>
    _$AddSongToQueueMsg(
      DetailsPackage.fromJson(json['songData'] as Map<String, dynamic>),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$AddSongToQueueMsgToJson(_$AddSongToQueueMsg instance) =>
    <String, dynamic>{
      'songData': instance.songData,
      'type': instance.$type,
    };

_$RemoveSongFromQueueMsg _$$RemoveSongFromQueueMsgFromJson(
        Map<String, dynamic> json) =>
    _$RemoveSongFromQueueMsg(
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$RemoveSongFromQueueMsgToJson(
        _$RemoveSongFromQueueMsg instance) =>
    <String, dynamic>{
      'type': instance.$type,
    };
