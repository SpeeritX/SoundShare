// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestResourceMsg _$$RequestResourceMsgFromJson(Map<String, dynamic> json) =>
    _$RequestResourceMsg(
      id: json['id'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$RequestResourceMsgToJson(
        _$RequestResourceMsg instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.$type,
    };

_$ResourceMsg _$$ResourceMsgFromJson(Map<String, dynamic> json) =>
    _$ResourceMsg(
      id: json['id'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ResourceMsgToJson(_$ResourceMsg instance) =>
    <String, dynamic>{
      'id': instance.id,
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

_$MusicPackageMsg _$$MusicPackageMsgFromJson(Map<String, dynamic> json) =>
    _$MusicPackageMsg(
      songId: json['songId'] as String,
      serializedBytes: json['serializedBytes'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$MusicPackageMsgToJson(_$MusicPackageMsg instance) =>
    <String, dynamic>{
      'songId': instance.songId,
      'serializedBytes': instance.serializedBytes,
      'type': instance.$type,
    };

_$PlayMsg _$$PlayMsgFromJson(Map<String, dynamic> json) => _$PlayMsg(
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$PlayMsgToJson(_$PlayMsg instance) => <String, dynamic>{
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
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$AddSongToQueueMsgToJson(_$AddSongToQueueMsg instance) =>
    <String, dynamic>{
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
