class DetailsPackage {
  final String songId;
  final Duration duration;
  final String? artist;
  final String? title;
  final String? album;
  final dynamic apic;

  DetailsPackage({
    required this.songId,
    required this.duration,
    required this.artist,
    required this.title,
    required this.album,
    required this.apic,
  });

  DetailsPackage.fromJson(Map<String, dynamic> json)
      : songId = json['songId'],
        duration = json['duration'],
        artist = json['artist'],
        title = json['name'],
        album = json['album'],
        apic = json['apic'];

  Map<String, dynamic> toJson() => {
        'songId': songId,
        'auration': duration,
        'artist': artist,
        'name': title,
        'album': album,
        'apic': apic.toString()
      };
}
