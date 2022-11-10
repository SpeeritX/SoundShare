import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_package.g.dart';

@JsonSerializable()
class DetailsPackage {
  final String songId;
  final int bytesLength;
  final Duration duration;
  final String artist;
  final String title;
  final String album;
  final dynamic? apic;

  DetailsPackage({
    required this.songId,
    required this.bytesLength,
    required this.duration,
    required this.artist,
    required this.title,
    required this.album,
    this.apic = null,
  });

  factory DetailsPackage.fromJson(Map<String, dynamic> json) =>
      _$DetailsPackageFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsPackageToJson(this);
}
