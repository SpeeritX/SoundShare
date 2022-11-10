// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsPackage _$DetailsPackageFromJson(Map<String, dynamic> json) =>
    DetailsPackage(
      songId: json['songId'] as String,
      bytesLength: json['bytesLength'] as int,
      duration: Duration(microseconds: json['duration'] as int),
      artist: json['artist'] as String?,
      title: json['title'] as String?,
      album: json['album'] as String?,
      apic: json['apic'] ?? null,
    );

Map<String, dynamic> _$DetailsPackageToJson(DetailsPackage instance) =>
    <String, dynamic>{
      'songId': instance.songId,
      'bytesLength': instance.bytesLength,
      'duration': instance.duration.inMicroseconds,
      'artist': instance.artist,
      'title': instance.title,
      'album': instance.album,
      'apic': instance.apic,
    };
