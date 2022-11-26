// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'p2p_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

P2pMessage _$P2pMessageFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'sync':
      return SyncMsg.fromJson(json);
    case 'searchResource':
      return SearchResourceMsg.fromJson(json);
    case 'requestResource':
      return RequestResourceMsg.fromJson(json);
    case 'resourceAvailability':
      return ResourceAvailabilityMsg.fromJson(json);
    case 'musicPackage':
      return MusicPackageMsg.fromJson(json);
    case 'requestStateUpdate':
      return RequestStateUpdateMsg.fromJson(json);
    case 'stateUpdateMsg':
      return StateUpdateMsg.fromJson(json);
    case 'play':
      return PlayMsg.fromJson(json);
    case 'pause':
      return PauseMsg.fromJson(json);
    case 'skipSong':
      return SkipSongMsg.fromJson(json);
    case 'previousSong':
      return PreviousSongMsg.fromJson(json);
    case 'addSongToQueue':
      return AddSongToQueueMsg.fromJson(json);
    case 'removeSongFromQueue':
      return RemoveSongFromQueueMsg.fromJson(json);
    case 'setMusicChunkSize':
      return SetMusicChunkSizeMsg.fromJson(json);
    case 'ping':
      return PingMsg.fromJson(json);
    case 'pong':
      return PongMsg.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'P2pMessage', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$P2pMessage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration clockOffset) sync,
    required TResult Function(String songId) searchResource,
    required TResult Function(String requestId, String songId, int startIndex)
        requestResource,
    required TResult Function(String songId) resourceAvailability,
    required TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)
        musicPackage,
    required TResult Function() requestStateUpdate,
    required TResult Function(
            List<String> devices, List<DetailsPackage> queue, int queuePosition)
        stateUpdateMsg,
    required TResult Function(int index, DateTime time, Duration? songPosition)
        play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function(DetailsPackage songData) addSongToQueue,
    required TResult Function() removeSongFromQueue,
    required TResult Function(int size) setMusicChunkSize,
    required TResult Function(String id) ping,
    required TResult Function(String pingId, DateTime time) pong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration clockOffset)? sync,
    TResult? Function(String songId)? searchResource,
    TResult? Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult? Function(String songId)? resourceAvailability,
    TResult? Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult? Function(int index, DateTime time, Duration? songPosition)? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function(DetailsPackage songData)? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
    TResult? Function(int size)? setMusicChunkSize,
    TResult? Function(String id)? ping,
    TResult? Function(String pingId, DateTime time)? pong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration clockOffset)? sync,
    TResult Function(String songId)? searchResource,
    TResult Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult Function(String songId)? resourceAvailability,
    TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult Function(int index, DateTime time, Duration? songPosition)? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function(DetailsPackage songData)? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    TResult Function(int size)? setMusicChunkSize,
    TResult Function(String id)? ping,
    TResult Function(String pingId, DateTime time)? pong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncMsg value) sync,
    required TResult Function(SearchResourceMsg value) searchResource,
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceAvailabilityMsg value)
        resourceAvailability,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
    required TResult Function(SetMusicChunkSizeMsg value) setMusicChunkSize,
    required TResult Function(PingMsg value) ping,
    required TResult Function(PongMsg value) pong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncMsg value)? sync,
    TResult? Function(SearchResourceMsg value)? searchResource,
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult? Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult? Function(PingMsg value)? ping,
    TResult? Function(PongMsg value)? pong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncMsg value)? sync,
    TResult Function(SearchResourceMsg value)? searchResource,
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult Function(PingMsg value)? ping,
    TResult Function(PongMsg value)? pong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $P2pMessageCopyWith<$Res> {
  factory $P2pMessageCopyWith(
          P2pMessage value, $Res Function(P2pMessage) then) =
      _$P2pMessageCopyWithImpl<$Res, P2pMessage>;
}

/// @nodoc
class _$P2pMessageCopyWithImpl<$Res, $Val extends P2pMessage>
    implements $P2pMessageCopyWith<$Res> {
  _$P2pMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SyncMsgCopyWith<$Res> {
  factory _$$SyncMsgCopyWith(_$SyncMsg value, $Res Function(_$SyncMsg) then) =
      __$$SyncMsgCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration clockOffset});
}

/// @nodoc
class __$$SyncMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$SyncMsg>
    implements _$$SyncMsgCopyWith<$Res> {
  __$$SyncMsgCopyWithImpl(_$SyncMsg _value, $Res Function(_$SyncMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clockOffset = null,
  }) {
    return _then(_$SyncMsg(
      clockOffset: null == clockOffset
          ? _value.clockOffset
          : clockOffset // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncMsg with DiagnosticableTreeMixin implements SyncMsg {
  const _$SyncMsg({required this.clockOffset, final String? $type})
      : $type = $type ?? 'sync';

  factory _$SyncMsg.fromJson(Map<String, dynamic> json) =>
      _$$SyncMsgFromJson(json);

  @override
  final Duration clockOffset;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'P2pMessage.sync(clockOffset: $clockOffset)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'P2pMessage.sync'))
      ..add(DiagnosticsProperty('clockOffset', clockOffset));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncMsg &&
            (identical(other.clockOffset, clockOffset) ||
                other.clockOffset == clockOffset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, clockOffset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncMsgCopyWith<_$SyncMsg> get copyWith =>
      __$$SyncMsgCopyWithImpl<_$SyncMsg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration clockOffset) sync,
    required TResult Function(String songId) searchResource,
    required TResult Function(String requestId, String songId, int startIndex)
        requestResource,
    required TResult Function(String songId) resourceAvailability,
    required TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)
        musicPackage,
    required TResult Function() requestStateUpdate,
    required TResult Function(
            List<String> devices, List<DetailsPackage> queue, int queuePosition)
        stateUpdateMsg,
    required TResult Function(int index, DateTime time, Duration? songPosition)
        play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function(DetailsPackage songData) addSongToQueue,
    required TResult Function() removeSongFromQueue,
    required TResult Function(int size) setMusicChunkSize,
    required TResult Function(String id) ping,
    required TResult Function(String pingId, DateTime time) pong,
  }) {
    return sync(clockOffset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration clockOffset)? sync,
    TResult? Function(String songId)? searchResource,
    TResult? Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult? Function(String songId)? resourceAvailability,
    TResult? Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult? Function(int index, DateTime time, Duration? songPosition)? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function(DetailsPackage songData)? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
    TResult? Function(int size)? setMusicChunkSize,
    TResult? Function(String id)? ping,
    TResult? Function(String pingId, DateTime time)? pong,
  }) {
    return sync?.call(clockOffset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration clockOffset)? sync,
    TResult Function(String songId)? searchResource,
    TResult Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult Function(String songId)? resourceAvailability,
    TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult Function(int index, DateTime time, Duration? songPosition)? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function(DetailsPackage songData)? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    TResult Function(int size)? setMusicChunkSize,
    TResult Function(String id)? ping,
    TResult Function(String pingId, DateTime time)? pong,
    required TResult orElse(),
  }) {
    if (sync != null) {
      return sync(clockOffset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncMsg value) sync,
    required TResult Function(SearchResourceMsg value) searchResource,
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceAvailabilityMsg value)
        resourceAvailability,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
    required TResult Function(SetMusicChunkSizeMsg value) setMusicChunkSize,
    required TResult Function(PingMsg value) ping,
    required TResult Function(PongMsg value) pong,
  }) {
    return sync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncMsg value)? sync,
    TResult? Function(SearchResourceMsg value)? searchResource,
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult? Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult? Function(PingMsg value)? ping,
    TResult? Function(PongMsg value)? pong,
  }) {
    return sync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncMsg value)? sync,
    TResult Function(SearchResourceMsg value)? searchResource,
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult Function(PingMsg value)? ping,
    TResult Function(PongMsg value)? pong,
    required TResult orElse(),
  }) {
    if (sync != null) {
      return sync(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncMsgToJson(
      this,
    );
  }
}

abstract class SyncMsg implements P2pMessage {
  const factory SyncMsg({required final Duration clockOffset}) = _$SyncMsg;

  factory SyncMsg.fromJson(Map<String, dynamic> json) = _$SyncMsg.fromJson;

  Duration get clockOffset;
  @JsonKey(ignore: true)
  _$$SyncMsgCopyWith<_$SyncMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchResourceMsgCopyWith<$Res> {
  factory _$$SearchResourceMsgCopyWith(
          _$SearchResourceMsg value, $Res Function(_$SearchResourceMsg) then) =
      __$$SearchResourceMsgCopyWithImpl<$Res>;
  @useResult
  $Res call({String songId});
}

/// @nodoc
class __$$SearchResourceMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$SearchResourceMsg>
    implements _$$SearchResourceMsgCopyWith<$Res> {
  __$$SearchResourceMsgCopyWithImpl(
      _$SearchResourceMsg _value, $Res Function(_$SearchResourceMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songId = null,
  }) {
    return _then(_$SearchResourceMsg(
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchResourceMsg
    with DiagnosticableTreeMixin
    implements SearchResourceMsg {
  const _$SearchResourceMsg({required this.songId, final String? $type})
      : $type = $type ?? 'searchResource';

  factory _$SearchResourceMsg.fromJson(Map<String, dynamic> json) =>
      _$$SearchResourceMsgFromJson(json);

  @override
  final String songId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'P2pMessage.searchResource(songId: $songId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'P2pMessage.searchResource'))
      ..add(DiagnosticsProperty('songId', songId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResourceMsg &&
            (identical(other.songId, songId) || other.songId == songId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, songId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResourceMsgCopyWith<_$SearchResourceMsg> get copyWith =>
      __$$SearchResourceMsgCopyWithImpl<_$SearchResourceMsg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration clockOffset) sync,
    required TResult Function(String songId) searchResource,
    required TResult Function(String requestId, String songId, int startIndex)
        requestResource,
    required TResult Function(String songId) resourceAvailability,
    required TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)
        musicPackage,
    required TResult Function() requestStateUpdate,
    required TResult Function(
            List<String> devices, List<DetailsPackage> queue, int queuePosition)
        stateUpdateMsg,
    required TResult Function(int index, DateTime time, Duration? songPosition)
        play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function(DetailsPackage songData) addSongToQueue,
    required TResult Function() removeSongFromQueue,
    required TResult Function(int size) setMusicChunkSize,
    required TResult Function(String id) ping,
    required TResult Function(String pingId, DateTime time) pong,
  }) {
    return searchResource(songId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration clockOffset)? sync,
    TResult? Function(String songId)? searchResource,
    TResult? Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult? Function(String songId)? resourceAvailability,
    TResult? Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult? Function(int index, DateTime time, Duration? songPosition)? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function(DetailsPackage songData)? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
    TResult? Function(int size)? setMusicChunkSize,
    TResult? Function(String id)? ping,
    TResult? Function(String pingId, DateTime time)? pong,
  }) {
    return searchResource?.call(songId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration clockOffset)? sync,
    TResult Function(String songId)? searchResource,
    TResult Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult Function(String songId)? resourceAvailability,
    TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult Function(int index, DateTime time, Duration? songPosition)? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function(DetailsPackage songData)? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    TResult Function(int size)? setMusicChunkSize,
    TResult Function(String id)? ping,
    TResult Function(String pingId, DateTime time)? pong,
    required TResult orElse(),
  }) {
    if (searchResource != null) {
      return searchResource(songId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncMsg value) sync,
    required TResult Function(SearchResourceMsg value) searchResource,
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceAvailabilityMsg value)
        resourceAvailability,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
    required TResult Function(SetMusicChunkSizeMsg value) setMusicChunkSize,
    required TResult Function(PingMsg value) ping,
    required TResult Function(PongMsg value) pong,
  }) {
    return searchResource(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncMsg value)? sync,
    TResult? Function(SearchResourceMsg value)? searchResource,
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult? Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult? Function(PingMsg value)? ping,
    TResult? Function(PongMsg value)? pong,
  }) {
    return searchResource?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncMsg value)? sync,
    TResult Function(SearchResourceMsg value)? searchResource,
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult Function(PingMsg value)? ping,
    TResult Function(PongMsg value)? pong,
    required TResult orElse(),
  }) {
    if (searchResource != null) {
      return searchResource(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchResourceMsgToJson(
      this,
    );
  }
}

abstract class SearchResourceMsg implements P2pMessage {
  const factory SearchResourceMsg({required final String songId}) =
      _$SearchResourceMsg;

  factory SearchResourceMsg.fromJson(Map<String, dynamic> json) =
      _$SearchResourceMsg.fromJson;

  String get songId;
  @JsonKey(ignore: true)
  _$$SearchResourceMsgCopyWith<_$SearchResourceMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestResourceMsgCopyWith<$Res> {
  factory _$$RequestResourceMsgCopyWith(_$RequestResourceMsg value,
          $Res Function(_$RequestResourceMsg) then) =
      __$$RequestResourceMsgCopyWithImpl<$Res>;
  @useResult
  $Res call({String requestId, String songId, int startIndex});
}

/// @nodoc
class __$$RequestResourceMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$RequestResourceMsg>
    implements _$$RequestResourceMsgCopyWith<$Res> {
  __$$RequestResourceMsgCopyWithImpl(
      _$RequestResourceMsg _value, $Res Function(_$RequestResourceMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? songId = null,
    Object? startIndex = null,
  }) {
    return _then(_$RequestResourceMsg(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as String,
      startIndex: null == startIndex
          ? _value.startIndex
          : startIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestResourceMsg
    with DiagnosticableTreeMixin
    implements RequestResourceMsg {
  const _$RequestResourceMsg(
      {required this.requestId,
      required this.songId,
      required this.startIndex,
      final String? $type})
      : $type = $type ?? 'requestResource';

  factory _$RequestResourceMsg.fromJson(Map<String, dynamic> json) =>
      _$$RequestResourceMsgFromJson(json);

  @override
  final String requestId;
  @override
  final String songId;
  @override
  final int startIndex;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'P2pMessage.requestResource(requestId: $requestId, songId: $songId, startIndex: $startIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'P2pMessage.requestResource'))
      ..add(DiagnosticsProperty('requestId', requestId))
      ..add(DiagnosticsProperty('songId', songId))
      ..add(DiagnosticsProperty('startIndex', startIndex));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestResourceMsg &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.songId, songId) || other.songId == songId) &&
            (identical(other.startIndex, startIndex) ||
                other.startIndex == startIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestId, songId, startIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestResourceMsgCopyWith<_$RequestResourceMsg> get copyWith =>
      __$$RequestResourceMsgCopyWithImpl<_$RequestResourceMsg>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration clockOffset) sync,
    required TResult Function(String songId) searchResource,
    required TResult Function(String requestId, String songId, int startIndex)
        requestResource,
    required TResult Function(String songId) resourceAvailability,
    required TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)
        musicPackage,
    required TResult Function() requestStateUpdate,
    required TResult Function(
            List<String> devices, List<DetailsPackage> queue, int queuePosition)
        stateUpdateMsg,
    required TResult Function(int index, DateTime time, Duration? songPosition)
        play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function(DetailsPackage songData) addSongToQueue,
    required TResult Function() removeSongFromQueue,
    required TResult Function(int size) setMusicChunkSize,
    required TResult Function(String id) ping,
    required TResult Function(String pingId, DateTime time) pong,
  }) {
    return requestResource(requestId, songId, startIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration clockOffset)? sync,
    TResult? Function(String songId)? searchResource,
    TResult? Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult? Function(String songId)? resourceAvailability,
    TResult? Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult? Function(int index, DateTime time, Duration? songPosition)? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function(DetailsPackage songData)? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
    TResult? Function(int size)? setMusicChunkSize,
    TResult? Function(String id)? ping,
    TResult? Function(String pingId, DateTime time)? pong,
  }) {
    return requestResource?.call(requestId, songId, startIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration clockOffset)? sync,
    TResult Function(String songId)? searchResource,
    TResult Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult Function(String songId)? resourceAvailability,
    TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult Function(int index, DateTime time, Duration? songPosition)? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function(DetailsPackage songData)? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    TResult Function(int size)? setMusicChunkSize,
    TResult Function(String id)? ping,
    TResult Function(String pingId, DateTime time)? pong,
    required TResult orElse(),
  }) {
    if (requestResource != null) {
      return requestResource(requestId, songId, startIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncMsg value) sync,
    required TResult Function(SearchResourceMsg value) searchResource,
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceAvailabilityMsg value)
        resourceAvailability,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
    required TResult Function(SetMusicChunkSizeMsg value) setMusicChunkSize,
    required TResult Function(PingMsg value) ping,
    required TResult Function(PongMsg value) pong,
  }) {
    return requestResource(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncMsg value)? sync,
    TResult? Function(SearchResourceMsg value)? searchResource,
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult? Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult? Function(PingMsg value)? ping,
    TResult? Function(PongMsg value)? pong,
  }) {
    return requestResource?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncMsg value)? sync,
    TResult Function(SearchResourceMsg value)? searchResource,
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult Function(PingMsg value)? ping,
    TResult Function(PongMsg value)? pong,
    required TResult orElse(),
  }) {
    if (requestResource != null) {
      return requestResource(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestResourceMsgToJson(
      this,
    );
  }
}

abstract class RequestResourceMsg implements P2pMessage {
  const factory RequestResourceMsg(
      {required final String requestId,
      required final String songId,
      required final int startIndex}) = _$RequestResourceMsg;

  factory RequestResourceMsg.fromJson(Map<String, dynamic> json) =
      _$RequestResourceMsg.fromJson;

  String get requestId;
  String get songId;
  int get startIndex;
  @JsonKey(ignore: true)
  _$$RequestResourceMsgCopyWith<_$RequestResourceMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResourceAvailabilityMsgCopyWith<$Res> {
  factory _$$ResourceAvailabilityMsgCopyWith(_$ResourceAvailabilityMsg value,
          $Res Function(_$ResourceAvailabilityMsg) then) =
      __$$ResourceAvailabilityMsgCopyWithImpl<$Res>;
  @useResult
  $Res call({String songId});
}

/// @nodoc
class __$$ResourceAvailabilityMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$ResourceAvailabilityMsg>
    implements _$$ResourceAvailabilityMsgCopyWith<$Res> {
  __$$ResourceAvailabilityMsgCopyWithImpl(_$ResourceAvailabilityMsg _value,
      $Res Function(_$ResourceAvailabilityMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songId = null,
  }) {
    return _then(_$ResourceAvailabilityMsg(
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResourceAvailabilityMsg
    with DiagnosticableTreeMixin
    implements ResourceAvailabilityMsg {
  const _$ResourceAvailabilityMsg({required this.songId, final String? $type})
      : $type = $type ?? 'resourceAvailability';

  factory _$ResourceAvailabilityMsg.fromJson(Map<String, dynamic> json) =>
      _$$ResourceAvailabilityMsgFromJson(json);

  @override
  final String songId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'P2pMessage.resourceAvailability(songId: $songId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'P2pMessage.resourceAvailability'))
      ..add(DiagnosticsProperty('songId', songId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceAvailabilityMsg &&
            (identical(other.songId, songId) || other.songId == songId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, songId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceAvailabilityMsgCopyWith<_$ResourceAvailabilityMsg> get copyWith =>
      __$$ResourceAvailabilityMsgCopyWithImpl<_$ResourceAvailabilityMsg>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration clockOffset) sync,
    required TResult Function(String songId) searchResource,
    required TResult Function(String requestId, String songId, int startIndex)
        requestResource,
    required TResult Function(String songId) resourceAvailability,
    required TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)
        musicPackage,
    required TResult Function() requestStateUpdate,
    required TResult Function(
            List<String> devices, List<DetailsPackage> queue, int queuePosition)
        stateUpdateMsg,
    required TResult Function(int index, DateTime time, Duration? songPosition)
        play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function(DetailsPackage songData) addSongToQueue,
    required TResult Function() removeSongFromQueue,
    required TResult Function(int size) setMusicChunkSize,
    required TResult Function(String id) ping,
    required TResult Function(String pingId, DateTime time) pong,
  }) {
    return resourceAvailability(songId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration clockOffset)? sync,
    TResult? Function(String songId)? searchResource,
    TResult? Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult? Function(String songId)? resourceAvailability,
    TResult? Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult? Function(int index, DateTime time, Duration? songPosition)? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function(DetailsPackage songData)? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
    TResult? Function(int size)? setMusicChunkSize,
    TResult? Function(String id)? ping,
    TResult? Function(String pingId, DateTime time)? pong,
  }) {
    return resourceAvailability?.call(songId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration clockOffset)? sync,
    TResult Function(String songId)? searchResource,
    TResult Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult Function(String songId)? resourceAvailability,
    TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult Function(int index, DateTime time, Duration? songPosition)? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function(DetailsPackage songData)? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    TResult Function(int size)? setMusicChunkSize,
    TResult Function(String id)? ping,
    TResult Function(String pingId, DateTime time)? pong,
    required TResult orElse(),
  }) {
    if (resourceAvailability != null) {
      return resourceAvailability(songId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncMsg value) sync,
    required TResult Function(SearchResourceMsg value) searchResource,
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceAvailabilityMsg value)
        resourceAvailability,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
    required TResult Function(SetMusicChunkSizeMsg value) setMusicChunkSize,
    required TResult Function(PingMsg value) ping,
    required TResult Function(PongMsg value) pong,
  }) {
    return resourceAvailability(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncMsg value)? sync,
    TResult? Function(SearchResourceMsg value)? searchResource,
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult? Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult? Function(PingMsg value)? ping,
    TResult? Function(PongMsg value)? pong,
  }) {
    return resourceAvailability?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncMsg value)? sync,
    TResult Function(SearchResourceMsg value)? searchResource,
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult Function(PingMsg value)? ping,
    TResult Function(PongMsg value)? pong,
    required TResult orElse(),
  }) {
    if (resourceAvailability != null) {
      return resourceAvailability(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ResourceAvailabilityMsgToJson(
      this,
    );
  }
}

abstract class ResourceAvailabilityMsg implements P2pMessage {
  const factory ResourceAvailabilityMsg({required final String songId}) =
      _$ResourceAvailabilityMsg;

  factory ResourceAvailabilityMsg.fromJson(Map<String, dynamic> json) =
      _$ResourceAvailabilityMsg.fromJson;

  String get songId;
  @JsonKey(ignore: true)
  _$$ResourceAvailabilityMsgCopyWith<_$ResourceAvailabilityMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MusicPackageMsgCopyWith<$Res> {
  factory _$$MusicPackageMsgCopyWith(
          _$MusicPackageMsg value, $Res Function(_$MusicPackageMsg) then) =
      __$$MusicPackageMsgCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String requestId,
      String songId,
      int startIndex,
      String serializedBytes});
}

/// @nodoc
class __$$MusicPackageMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$MusicPackageMsg>
    implements _$$MusicPackageMsgCopyWith<$Res> {
  __$$MusicPackageMsgCopyWithImpl(
      _$MusicPackageMsg _value, $Res Function(_$MusicPackageMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? songId = null,
    Object? startIndex = null,
    Object? serializedBytes = null,
  }) {
    return _then(_$MusicPackageMsg(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as String,
      startIndex: null == startIndex
          ? _value.startIndex
          : startIndex // ignore: cast_nullable_to_non_nullable
              as int,
      serializedBytes: null == serializedBytes
          ? _value.serializedBytes
          : serializedBytes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicPackageMsg
    with DiagnosticableTreeMixin
    implements MusicPackageMsg {
  const _$MusicPackageMsg(
      {required this.requestId,
      required this.songId,
      required this.startIndex,
      required this.serializedBytes,
      final String? $type})
      : $type = $type ?? 'musicPackage';

  factory _$MusicPackageMsg.fromJson(Map<String, dynamic> json) =>
      _$$MusicPackageMsgFromJson(json);

  @override
  final String requestId;
  @override
  final String songId;
  @override
  final int startIndex;
  @override
  final String serializedBytes;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'P2pMessage.musicPackage(requestId: $requestId, songId: $songId, startIndex: $startIndex, serializedBytes: $serializedBytes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'P2pMessage.musicPackage'))
      ..add(DiagnosticsProperty('requestId', requestId))
      ..add(DiagnosticsProperty('songId', songId))
      ..add(DiagnosticsProperty('startIndex', startIndex))
      ..add(DiagnosticsProperty('serializedBytes', serializedBytes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicPackageMsg &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.songId, songId) || other.songId == songId) &&
            (identical(other.startIndex, startIndex) ||
                other.startIndex == startIndex) &&
            (identical(other.serializedBytes, serializedBytes) ||
                other.serializedBytes == serializedBytes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, requestId, songId, startIndex, serializedBytes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicPackageMsgCopyWith<_$MusicPackageMsg> get copyWith =>
      __$$MusicPackageMsgCopyWithImpl<_$MusicPackageMsg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration clockOffset) sync,
    required TResult Function(String songId) searchResource,
    required TResult Function(String requestId, String songId, int startIndex)
        requestResource,
    required TResult Function(String songId) resourceAvailability,
    required TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)
        musicPackage,
    required TResult Function() requestStateUpdate,
    required TResult Function(
            List<String> devices, List<DetailsPackage> queue, int queuePosition)
        stateUpdateMsg,
    required TResult Function(int index, DateTime time, Duration? songPosition)
        play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function(DetailsPackage songData) addSongToQueue,
    required TResult Function() removeSongFromQueue,
    required TResult Function(int size) setMusicChunkSize,
    required TResult Function(String id) ping,
    required TResult Function(String pingId, DateTime time) pong,
  }) {
    return musicPackage(requestId, songId, startIndex, serializedBytes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration clockOffset)? sync,
    TResult? Function(String songId)? searchResource,
    TResult? Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult? Function(String songId)? resourceAvailability,
    TResult? Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult? Function(int index, DateTime time, Duration? songPosition)? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function(DetailsPackage songData)? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
    TResult? Function(int size)? setMusicChunkSize,
    TResult? Function(String id)? ping,
    TResult? Function(String pingId, DateTime time)? pong,
  }) {
    return musicPackage?.call(requestId, songId, startIndex, serializedBytes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration clockOffset)? sync,
    TResult Function(String songId)? searchResource,
    TResult Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult Function(String songId)? resourceAvailability,
    TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult Function(int index, DateTime time, Duration? songPosition)? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function(DetailsPackage songData)? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    TResult Function(int size)? setMusicChunkSize,
    TResult Function(String id)? ping,
    TResult Function(String pingId, DateTime time)? pong,
    required TResult orElse(),
  }) {
    if (musicPackage != null) {
      return musicPackage(requestId, songId, startIndex, serializedBytes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncMsg value) sync,
    required TResult Function(SearchResourceMsg value) searchResource,
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceAvailabilityMsg value)
        resourceAvailability,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
    required TResult Function(SetMusicChunkSizeMsg value) setMusicChunkSize,
    required TResult Function(PingMsg value) ping,
    required TResult Function(PongMsg value) pong,
  }) {
    return musicPackage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncMsg value)? sync,
    TResult? Function(SearchResourceMsg value)? searchResource,
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult? Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult? Function(PingMsg value)? ping,
    TResult? Function(PongMsg value)? pong,
  }) {
    return musicPackage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncMsg value)? sync,
    TResult Function(SearchResourceMsg value)? searchResource,
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult Function(PingMsg value)? ping,
    TResult Function(PongMsg value)? pong,
    required TResult orElse(),
  }) {
    if (musicPackage != null) {
      return musicPackage(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicPackageMsgToJson(
      this,
    );
  }
}

abstract class MusicPackageMsg implements P2pMessage {
  const factory MusicPackageMsg(
      {required final String requestId,
      required final String songId,
      required final int startIndex,
      required final String serializedBytes}) = _$MusicPackageMsg;

  factory MusicPackageMsg.fromJson(Map<String, dynamic> json) =
      _$MusicPackageMsg.fromJson;

  String get requestId;
  String get songId;
  int get startIndex;
  String get serializedBytes;
  @JsonKey(ignore: true)
  _$$MusicPackageMsgCopyWith<_$MusicPackageMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestStateUpdateMsgCopyWith<$Res> {
  factory _$$RequestStateUpdateMsgCopyWith(_$RequestStateUpdateMsg value,
          $Res Function(_$RequestStateUpdateMsg) then) =
      __$$RequestStateUpdateMsgCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestStateUpdateMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$RequestStateUpdateMsg>
    implements _$$RequestStateUpdateMsgCopyWith<$Res> {
  __$$RequestStateUpdateMsgCopyWithImpl(_$RequestStateUpdateMsg _value,
      $Res Function(_$RequestStateUpdateMsg) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$RequestStateUpdateMsg
    with DiagnosticableTreeMixin
    implements RequestStateUpdateMsg {
  const _$RequestStateUpdateMsg({final String? $type})
      : $type = $type ?? 'requestStateUpdate';

  factory _$RequestStateUpdateMsg.fromJson(Map<String, dynamic> json) =>
      _$$RequestStateUpdateMsgFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'P2pMessage.requestStateUpdate()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'P2pMessage.requestStateUpdate'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestStateUpdateMsg);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration clockOffset) sync,
    required TResult Function(String songId) searchResource,
    required TResult Function(String requestId, String songId, int startIndex)
        requestResource,
    required TResult Function(String songId) resourceAvailability,
    required TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)
        musicPackage,
    required TResult Function() requestStateUpdate,
    required TResult Function(
            List<String> devices, List<DetailsPackage> queue, int queuePosition)
        stateUpdateMsg,
    required TResult Function(int index, DateTime time, Duration? songPosition)
        play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function(DetailsPackage songData) addSongToQueue,
    required TResult Function() removeSongFromQueue,
    required TResult Function(int size) setMusicChunkSize,
    required TResult Function(String id) ping,
    required TResult Function(String pingId, DateTime time) pong,
  }) {
    return requestStateUpdate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration clockOffset)? sync,
    TResult? Function(String songId)? searchResource,
    TResult? Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult? Function(String songId)? resourceAvailability,
    TResult? Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult? Function(int index, DateTime time, Duration? songPosition)? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function(DetailsPackage songData)? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
    TResult? Function(int size)? setMusicChunkSize,
    TResult? Function(String id)? ping,
    TResult? Function(String pingId, DateTime time)? pong,
  }) {
    return requestStateUpdate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration clockOffset)? sync,
    TResult Function(String songId)? searchResource,
    TResult Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult Function(String songId)? resourceAvailability,
    TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult Function(int index, DateTime time, Duration? songPosition)? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function(DetailsPackage songData)? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    TResult Function(int size)? setMusicChunkSize,
    TResult Function(String id)? ping,
    TResult Function(String pingId, DateTime time)? pong,
    required TResult orElse(),
  }) {
    if (requestStateUpdate != null) {
      return requestStateUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncMsg value) sync,
    required TResult Function(SearchResourceMsg value) searchResource,
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceAvailabilityMsg value)
        resourceAvailability,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
    required TResult Function(SetMusicChunkSizeMsg value) setMusicChunkSize,
    required TResult Function(PingMsg value) ping,
    required TResult Function(PongMsg value) pong,
  }) {
    return requestStateUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncMsg value)? sync,
    TResult? Function(SearchResourceMsg value)? searchResource,
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult? Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult? Function(PingMsg value)? ping,
    TResult? Function(PongMsg value)? pong,
  }) {
    return requestStateUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncMsg value)? sync,
    TResult Function(SearchResourceMsg value)? searchResource,
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult Function(PingMsg value)? ping,
    TResult Function(PongMsg value)? pong,
    required TResult orElse(),
  }) {
    if (requestStateUpdate != null) {
      return requestStateUpdate(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestStateUpdateMsgToJson(
      this,
    );
  }
}

abstract class RequestStateUpdateMsg implements P2pMessage {
  const factory RequestStateUpdateMsg() = _$RequestStateUpdateMsg;

  factory RequestStateUpdateMsg.fromJson(Map<String, dynamic> json) =
      _$RequestStateUpdateMsg.fromJson;
}

/// @nodoc
abstract class _$$StateUpdateMsgCopyWith<$Res> {
  factory _$$StateUpdateMsgCopyWith(
          _$StateUpdateMsg value, $Res Function(_$StateUpdateMsg) then) =
      __$$StateUpdateMsgCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<String> devices, List<DetailsPackage> queue, int queuePosition});
}

/// @nodoc
class __$$StateUpdateMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$StateUpdateMsg>
    implements _$$StateUpdateMsgCopyWith<$Res> {
  __$$StateUpdateMsgCopyWithImpl(
      _$StateUpdateMsg _value, $Res Function(_$StateUpdateMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = null,
    Object? queue = null,
    Object? queuePosition = null,
  }) {
    return _then(_$StateUpdateMsg(
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      queue: null == queue
          ? _value._queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<DetailsPackage>,
      queuePosition: null == queuePosition
          ? _value.queuePosition
          : queuePosition // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StateUpdateMsg with DiagnosticableTreeMixin implements StateUpdateMsg {
  const _$StateUpdateMsg(
      {required final List<String> devices,
      required final List<DetailsPackage> queue,
      required this.queuePosition,
      final String? $type})
      : _devices = devices,
        _queue = queue,
        $type = $type ?? 'stateUpdateMsg';

  factory _$StateUpdateMsg.fromJson(Map<String, dynamic> json) =>
      _$$StateUpdateMsgFromJson(json);

  final List<String> _devices;
  @override
  List<String> get devices {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  final List<DetailsPackage> _queue;
  @override
  List<DetailsPackage> get queue {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queue);
  }

  @override
  final int queuePosition;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'P2pMessage.stateUpdateMsg(devices: $devices, queue: $queue, queuePosition: $queuePosition)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'P2pMessage.stateUpdateMsg'))
      ..add(DiagnosticsProperty('devices', devices))
      ..add(DiagnosticsProperty('queue', queue))
      ..add(DiagnosticsProperty('queuePosition', queuePosition));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateUpdateMsg &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            const DeepCollectionEquality().equals(other._queue, _queue) &&
            (identical(other.queuePosition, queuePosition) ||
                other.queuePosition == queuePosition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_devices),
      const DeepCollectionEquality().hash(_queue),
      queuePosition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateUpdateMsgCopyWith<_$StateUpdateMsg> get copyWith =>
      __$$StateUpdateMsgCopyWithImpl<_$StateUpdateMsg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration clockOffset) sync,
    required TResult Function(String songId) searchResource,
    required TResult Function(String requestId, String songId, int startIndex)
        requestResource,
    required TResult Function(String songId) resourceAvailability,
    required TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)
        musicPackage,
    required TResult Function() requestStateUpdate,
    required TResult Function(
            List<String> devices, List<DetailsPackage> queue, int queuePosition)
        stateUpdateMsg,
    required TResult Function(int index, DateTime time, Duration? songPosition)
        play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function(DetailsPackage songData) addSongToQueue,
    required TResult Function() removeSongFromQueue,
    required TResult Function(int size) setMusicChunkSize,
    required TResult Function(String id) ping,
    required TResult Function(String pingId, DateTime time) pong,
  }) {
    return stateUpdateMsg(devices, queue, queuePosition);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration clockOffset)? sync,
    TResult? Function(String songId)? searchResource,
    TResult? Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult? Function(String songId)? resourceAvailability,
    TResult? Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult? Function(int index, DateTime time, Duration? songPosition)? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function(DetailsPackage songData)? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
    TResult? Function(int size)? setMusicChunkSize,
    TResult? Function(String id)? ping,
    TResult? Function(String pingId, DateTime time)? pong,
  }) {
    return stateUpdateMsg?.call(devices, queue, queuePosition);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration clockOffset)? sync,
    TResult Function(String songId)? searchResource,
    TResult Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult Function(String songId)? resourceAvailability,
    TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult Function(int index, DateTime time, Duration? songPosition)? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function(DetailsPackage songData)? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    TResult Function(int size)? setMusicChunkSize,
    TResult Function(String id)? ping,
    TResult Function(String pingId, DateTime time)? pong,
    required TResult orElse(),
  }) {
    if (stateUpdateMsg != null) {
      return stateUpdateMsg(devices, queue, queuePosition);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncMsg value) sync,
    required TResult Function(SearchResourceMsg value) searchResource,
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceAvailabilityMsg value)
        resourceAvailability,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
    required TResult Function(SetMusicChunkSizeMsg value) setMusicChunkSize,
    required TResult Function(PingMsg value) ping,
    required TResult Function(PongMsg value) pong,
  }) {
    return stateUpdateMsg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncMsg value)? sync,
    TResult? Function(SearchResourceMsg value)? searchResource,
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult? Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult? Function(PingMsg value)? ping,
    TResult? Function(PongMsg value)? pong,
  }) {
    return stateUpdateMsg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncMsg value)? sync,
    TResult Function(SearchResourceMsg value)? searchResource,
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult Function(PingMsg value)? ping,
    TResult Function(PongMsg value)? pong,
    required TResult orElse(),
  }) {
    if (stateUpdateMsg != null) {
      return stateUpdateMsg(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$StateUpdateMsgToJson(
      this,
    );
  }
}

abstract class StateUpdateMsg implements P2pMessage {
  const factory StateUpdateMsg(
      {required final List<String> devices,
      required final List<DetailsPackage> queue,
      required final int queuePosition}) = _$StateUpdateMsg;

  factory StateUpdateMsg.fromJson(Map<String, dynamic> json) =
      _$StateUpdateMsg.fromJson;

  List<String> get devices;
  List<DetailsPackage> get queue;
  int get queuePosition;
  @JsonKey(ignore: true)
  _$$StateUpdateMsgCopyWith<_$StateUpdateMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayMsgCopyWith<$Res> {
  factory _$$PlayMsgCopyWith(_$PlayMsg value, $Res Function(_$PlayMsg) then) =
      __$$PlayMsgCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, DateTime time, Duration? songPosition});
}

/// @nodoc
class __$$PlayMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$PlayMsg>
    implements _$$PlayMsgCopyWith<$Res> {
  __$$PlayMsgCopyWithImpl(_$PlayMsg _value, $Res Function(_$PlayMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? time = null,
    Object? songPosition = freezed,
  }) {
    return _then(_$PlayMsg(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      freezed == songPosition
          ? _value.songPosition
          : songPosition // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayMsg with DiagnosticableTreeMixin implements PlayMsg {
  const _$PlayMsg(this.index, this.time, this.songPosition,
      {final String? $type})
      : $type = $type ?? 'play';

  factory _$PlayMsg.fromJson(Map<String, dynamic> json) =>
      _$$PlayMsgFromJson(json);

  @override
  final int index;
  @override
  final DateTime time;
  @override
  final Duration? songPosition;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'P2pMessage.play(index: $index, time: $time, songPosition: $songPosition)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'P2pMessage.play'))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('songPosition', songPosition));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayMsg &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.songPosition, songPosition) ||
                other.songPosition == songPosition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index, time, songPosition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayMsgCopyWith<_$PlayMsg> get copyWith =>
      __$$PlayMsgCopyWithImpl<_$PlayMsg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration clockOffset) sync,
    required TResult Function(String songId) searchResource,
    required TResult Function(String requestId, String songId, int startIndex)
        requestResource,
    required TResult Function(String songId) resourceAvailability,
    required TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)
        musicPackage,
    required TResult Function() requestStateUpdate,
    required TResult Function(
            List<String> devices, List<DetailsPackage> queue, int queuePosition)
        stateUpdateMsg,
    required TResult Function(int index, DateTime time, Duration? songPosition)
        play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function(DetailsPackage songData) addSongToQueue,
    required TResult Function() removeSongFromQueue,
    required TResult Function(int size) setMusicChunkSize,
    required TResult Function(String id) ping,
    required TResult Function(String pingId, DateTime time) pong,
  }) {
    return play(index, time, songPosition);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration clockOffset)? sync,
    TResult? Function(String songId)? searchResource,
    TResult? Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult? Function(String songId)? resourceAvailability,
    TResult? Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult? Function(int index, DateTime time, Duration? songPosition)? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function(DetailsPackage songData)? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
    TResult? Function(int size)? setMusicChunkSize,
    TResult? Function(String id)? ping,
    TResult? Function(String pingId, DateTime time)? pong,
  }) {
    return play?.call(index, time, songPosition);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration clockOffset)? sync,
    TResult Function(String songId)? searchResource,
    TResult Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult Function(String songId)? resourceAvailability,
    TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult Function(int index, DateTime time, Duration? songPosition)? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function(DetailsPackage songData)? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    TResult Function(int size)? setMusicChunkSize,
    TResult Function(String id)? ping,
    TResult Function(String pingId, DateTime time)? pong,
    required TResult orElse(),
  }) {
    if (play != null) {
      return play(index, time, songPosition);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncMsg value) sync,
    required TResult Function(SearchResourceMsg value) searchResource,
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceAvailabilityMsg value)
        resourceAvailability,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
    required TResult Function(SetMusicChunkSizeMsg value) setMusicChunkSize,
    required TResult Function(PingMsg value) ping,
    required TResult Function(PongMsg value) pong,
  }) {
    return play(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncMsg value)? sync,
    TResult? Function(SearchResourceMsg value)? searchResource,
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult? Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult? Function(PingMsg value)? ping,
    TResult? Function(PongMsg value)? pong,
  }) {
    return play?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncMsg value)? sync,
    TResult Function(SearchResourceMsg value)? searchResource,
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult Function(PingMsg value)? ping,
    TResult Function(PongMsg value)? pong,
    required TResult orElse(),
  }) {
    if (play != null) {
      return play(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayMsgToJson(
      this,
    );
  }
}

abstract class PlayMsg implements P2pMessage {
  const factory PlayMsg(
          final int index, final DateTime time, final Duration? songPosition) =
      _$PlayMsg;

  factory PlayMsg.fromJson(Map<String, dynamic> json) = _$PlayMsg.fromJson;

  int get index;
  DateTime get time;
  Duration? get songPosition;
  @JsonKey(ignore: true)
  _$$PlayMsgCopyWith<_$PlayMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PauseMsgCopyWith<$Res> {
  factory _$$PauseMsgCopyWith(
          _$PauseMsg value, $Res Function(_$PauseMsg) then) =
      __$$PauseMsgCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PauseMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$PauseMsg>
    implements _$$PauseMsgCopyWith<$Res> {
  __$$PauseMsgCopyWithImpl(_$PauseMsg _value, $Res Function(_$PauseMsg) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$PauseMsg with DiagnosticableTreeMixin implements PauseMsg {
  const _$PauseMsg({final String? $type}) : $type = $type ?? 'pause';

  factory _$PauseMsg.fromJson(Map<String, dynamic> json) =>
      _$$PauseMsgFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'P2pMessage.pause()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'P2pMessage.pause'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PauseMsg);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration clockOffset) sync,
    required TResult Function(String songId) searchResource,
    required TResult Function(String requestId, String songId, int startIndex)
        requestResource,
    required TResult Function(String songId) resourceAvailability,
    required TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)
        musicPackage,
    required TResult Function() requestStateUpdate,
    required TResult Function(
            List<String> devices, List<DetailsPackage> queue, int queuePosition)
        stateUpdateMsg,
    required TResult Function(int index, DateTime time, Duration? songPosition)
        play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function(DetailsPackage songData) addSongToQueue,
    required TResult Function() removeSongFromQueue,
    required TResult Function(int size) setMusicChunkSize,
    required TResult Function(String id) ping,
    required TResult Function(String pingId, DateTime time) pong,
  }) {
    return pause();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration clockOffset)? sync,
    TResult? Function(String songId)? searchResource,
    TResult? Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult? Function(String songId)? resourceAvailability,
    TResult? Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult? Function(int index, DateTime time, Duration? songPosition)? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function(DetailsPackage songData)? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
    TResult? Function(int size)? setMusicChunkSize,
    TResult? Function(String id)? ping,
    TResult? Function(String pingId, DateTime time)? pong,
  }) {
    return pause?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration clockOffset)? sync,
    TResult Function(String songId)? searchResource,
    TResult Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult Function(String songId)? resourceAvailability,
    TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult Function(int index, DateTime time, Duration? songPosition)? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function(DetailsPackage songData)? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    TResult Function(int size)? setMusicChunkSize,
    TResult Function(String id)? ping,
    TResult Function(String pingId, DateTime time)? pong,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncMsg value) sync,
    required TResult Function(SearchResourceMsg value) searchResource,
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceAvailabilityMsg value)
        resourceAvailability,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
    required TResult Function(SetMusicChunkSizeMsg value) setMusicChunkSize,
    required TResult Function(PingMsg value) ping,
    required TResult Function(PongMsg value) pong,
  }) {
    return pause(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncMsg value)? sync,
    TResult? Function(SearchResourceMsg value)? searchResource,
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult? Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult? Function(PingMsg value)? ping,
    TResult? Function(PongMsg value)? pong,
  }) {
    return pause?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncMsg value)? sync,
    TResult Function(SearchResourceMsg value)? searchResource,
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult Function(PingMsg value)? ping,
    TResult Function(PongMsg value)? pong,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PauseMsgToJson(
      this,
    );
  }
}

abstract class PauseMsg implements P2pMessage {
  const factory PauseMsg() = _$PauseMsg;

  factory PauseMsg.fromJson(Map<String, dynamic> json) = _$PauseMsg.fromJson;
}

/// @nodoc
abstract class _$$SkipSongMsgCopyWith<$Res> {
  factory _$$SkipSongMsgCopyWith(
          _$SkipSongMsg value, $Res Function(_$SkipSongMsg) then) =
      __$$SkipSongMsgCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SkipSongMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$SkipSongMsg>
    implements _$$SkipSongMsgCopyWith<$Res> {
  __$$SkipSongMsgCopyWithImpl(
      _$SkipSongMsg _value, $Res Function(_$SkipSongMsg) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$SkipSongMsg with DiagnosticableTreeMixin implements SkipSongMsg {
  const _$SkipSongMsg({final String? $type}) : $type = $type ?? 'skipSong';

  factory _$SkipSongMsg.fromJson(Map<String, dynamic> json) =>
      _$$SkipSongMsgFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'P2pMessage.skipSong()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'P2pMessage.skipSong'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SkipSongMsg);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration clockOffset) sync,
    required TResult Function(String songId) searchResource,
    required TResult Function(String requestId, String songId, int startIndex)
        requestResource,
    required TResult Function(String songId) resourceAvailability,
    required TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)
        musicPackage,
    required TResult Function() requestStateUpdate,
    required TResult Function(
            List<String> devices, List<DetailsPackage> queue, int queuePosition)
        stateUpdateMsg,
    required TResult Function(int index, DateTime time, Duration? songPosition)
        play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function(DetailsPackage songData) addSongToQueue,
    required TResult Function() removeSongFromQueue,
    required TResult Function(int size) setMusicChunkSize,
    required TResult Function(String id) ping,
    required TResult Function(String pingId, DateTime time) pong,
  }) {
    return skipSong();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration clockOffset)? sync,
    TResult? Function(String songId)? searchResource,
    TResult? Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult? Function(String songId)? resourceAvailability,
    TResult? Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult? Function(int index, DateTime time, Duration? songPosition)? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function(DetailsPackage songData)? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
    TResult? Function(int size)? setMusicChunkSize,
    TResult? Function(String id)? ping,
    TResult? Function(String pingId, DateTime time)? pong,
  }) {
    return skipSong?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration clockOffset)? sync,
    TResult Function(String songId)? searchResource,
    TResult Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult Function(String songId)? resourceAvailability,
    TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult Function(int index, DateTime time, Duration? songPosition)? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function(DetailsPackage songData)? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    TResult Function(int size)? setMusicChunkSize,
    TResult Function(String id)? ping,
    TResult Function(String pingId, DateTime time)? pong,
    required TResult orElse(),
  }) {
    if (skipSong != null) {
      return skipSong();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncMsg value) sync,
    required TResult Function(SearchResourceMsg value) searchResource,
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceAvailabilityMsg value)
        resourceAvailability,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
    required TResult Function(SetMusicChunkSizeMsg value) setMusicChunkSize,
    required TResult Function(PingMsg value) ping,
    required TResult Function(PongMsg value) pong,
  }) {
    return skipSong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncMsg value)? sync,
    TResult? Function(SearchResourceMsg value)? searchResource,
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult? Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult? Function(PingMsg value)? ping,
    TResult? Function(PongMsg value)? pong,
  }) {
    return skipSong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncMsg value)? sync,
    TResult Function(SearchResourceMsg value)? searchResource,
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult Function(PingMsg value)? ping,
    TResult Function(PongMsg value)? pong,
    required TResult orElse(),
  }) {
    if (skipSong != null) {
      return skipSong(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SkipSongMsgToJson(
      this,
    );
  }
}

abstract class SkipSongMsg implements P2pMessage {
  const factory SkipSongMsg() = _$SkipSongMsg;

  factory SkipSongMsg.fromJson(Map<String, dynamic> json) =
      _$SkipSongMsg.fromJson;
}

/// @nodoc
abstract class _$$PreviousSongMsgCopyWith<$Res> {
  factory _$$PreviousSongMsgCopyWith(
          _$PreviousSongMsg value, $Res Function(_$PreviousSongMsg) then) =
      __$$PreviousSongMsgCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PreviousSongMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$PreviousSongMsg>
    implements _$$PreviousSongMsgCopyWith<$Res> {
  __$$PreviousSongMsgCopyWithImpl(
      _$PreviousSongMsg _value, $Res Function(_$PreviousSongMsg) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$PreviousSongMsg
    with DiagnosticableTreeMixin
    implements PreviousSongMsg {
  const _$PreviousSongMsg({final String? $type})
      : $type = $type ?? 'previousSong';

  factory _$PreviousSongMsg.fromJson(Map<String, dynamic> json) =>
      _$$PreviousSongMsgFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'P2pMessage.previousSong()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'P2pMessage.previousSong'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PreviousSongMsg);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration clockOffset) sync,
    required TResult Function(String songId) searchResource,
    required TResult Function(String requestId, String songId, int startIndex)
        requestResource,
    required TResult Function(String songId) resourceAvailability,
    required TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)
        musicPackage,
    required TResult Function() requestStateUpdate,
    required TResult Function(
            List<String> devices, List<DetailsPackage> queue, int queuePosition)
        stateUpdateMsg,
    required TResult Function(int index, DateTime time, Duration? songPosition)
        play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function(DetailsPackage songData) addSongToQueue,
    required TResult Function() removeSongFromQueue,
    required TResult Function(int size) setMusicChunkSize,
    required TResult Function(String id) ping,
    required TResult Function(String pingId, DateTime time) pong,
  }) {
    return previousSong();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration clockOffset)? sync,
    TResult? Function(String songId)? searchResource,
    TResult? Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult? Function(String songId)? resourceAvailability,
    TResult? Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult? Function(int index, DateTime time, Duration? songPosition)? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function(DetailsPackage songData)? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
    TResult? Function(int size)? setMusicChunkSize,
    TResult? Function(String id)? ping,
    TResult? Function(String pingId, DateTime time)? pong,
  }) {
    return previousSong?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration clockOffset)? sync,
    TResult Function(String songId)? searchResource,
    TResult Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult Function(String songId)? resourceAvailability,
    TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult Function(int index, DateTime time, Duration? songPosition)? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function(DetailsPackage songData)? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    TResult Function(int size)? setMusicChunkSize,
    TResult Function(String id)? ping,
    TResult Function(String pingId, DateTime time)? pong,
    required TResult orElse(),
  }) {
    if (previousSong != null) {
      return previousSong();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncMsg value) sync,
    required TResult Function(SearchResourceMsg value) searchResource,
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceAvailabilityMsg value)
        resourceAvailability,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
    required TResult Function(SetMusicChunkSizeMsg value) setMusicChunkSize,
    required TResult Function(PingMsg value) ping,
    required TResult Function(PongMsg value) pong,
  }) {
    return previousSong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncMsg value)? sync,
    TResult? Function(SearchResourceMsg value)? searchResource,
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult? Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult? Function(PingMsg value)? ping,
    TResult? Function(PongMsg value)? pong,
  }) {
    return previousSong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncMsg value)? sync,
    TResult Function(SearchResourceMsg value)? searchResource,
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult Function(PingMsg value)? ping,
    TResult Function(PongMsg value)? pong,
    required TResult orElse(),
  }) {
    if (previousSong != null) {
      return previousSong(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PreviousSongMsgToJson(
      this,
    );
  }
}

abstract class PreviousSongMsg implements P2pMessage {
  const factory PreviousSongMsg() = _$PreviousSongMsg;

  factory PreviousSongMsg.fromJson(Map<String, dynamic> json) =
      _$PreviousSongMsg.fromJson;
}

/// @nodoc
abstract class _$$AddSongToQueueMsgCopyWith<$Res> {
  factory _$$AddSongToQueueMsgCopyWith(
          _$AddSongToQueueMsg value, $Res Function(_$AddSongToQueueMsg) then) =
      __$$AddSongToQueueMsgCopyWithImpl<$Res>;
  @useResult
  $Res call({DetailsPackage songData});
}

/// @nodoc
class __$$AddSongToQueueMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$AddSongToQueueMsg>
    implements _$$AddSongToQueueMsgCopyWith<$Res> {
  __$$AddSongToQueueMsgCopyWithImpl(
      _$AddSongToQueueMsg _value, $Res Function(_$AddSongToQueueMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songData = null,
  }) {
    return _then(_$AddSongToQueueMsg(
      null == songData
          ? _value.songData
          : songData // ignore: cast_nullable_to_non_nullable
              as DetailsPackage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddSongToQueueMsg
    with DiagnosticableTreeMixin
    implements AddSongToQueueMsg {
  const _$AddSongToQueueMsg(this.songData, {final String? $type})
      : $type = $type ?? 'addSongToQueue';

  factory _$AddSongToQueueMsg.fromJson(Map<String, dynamic> json) =>
      _$$AddSongToQueueMsgFromJson(json);

  @override
  final DetailsPackage songData;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'P2pMessage.addSongToQueue(songData: $songData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'P2pMessage.addSongToQueue'))
      ..add(DiagnosticsProperty('songData', songData));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSongToQueueMsg &&
            (identical(other.songData, songData) ||
                other.songData == songData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, songData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddSongToQueueMsgCopyWith<_$AddSongToQueueMsg> get copyWith =>
      __$$AddSongToQueueMsgCopyWithImpl<_$AddSongToQueueMsg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration clockOffset) sync,
    required TResult Function(String songId) searchResource,
    required TResult Function(String requestId, String songId, int startIndex)
        requestResource,
    required TResult Function(String songId) resourceAvailability,
    required TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)
        musicPackage,
    required TResult Function() requestStateUpdate,
    required TResult Function(
            List<String> devices, List<DetailsPackage> queue, int queuePosition)
        stateUpdateMsg,
    required TResult Function(int index, DateTime time, Duration? songPosition)
        play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function(DetailsPackage songData) addSongToQueue,
    required TResult Function() removeSongFromQueue,
    required TResult Function(int size) setMusicChunkSize,
    required TResult Function(String id) ping,
    required TResult Function(String pingId, DateTime time) pong,
  }) {
    return addSongToQueue(songData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration clockOffset)? sync,
    TResult? Function(String songId)? searchResource,
    TResult? Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult? Function(String songId)? resourceAvailability,
    TResult? Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult? Function(int index, DateTime time, Duration? songPosition)? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function(DetailsPackage songData)? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
    TResult? Function(int size)? setMusicChunkSize,
    TResult? Function(String id)? ping,
    TResult? Function(String pingId, DateTime time)? pong,
  }) {
    return addSongToQueue?.call(songData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration clockOffset)? sync,
    TResult Function(String songId)? searchResource,
    TResult Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult Function(String songId)? resourceAvailability,
    TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult Function(int index, DateTime time, Duration? songPosition)? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function(DetailsPackage songData)? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    TResult Function(int size)? setMusicChunkSize,
    TResult Function(String id)? ping,
    TResult Function(String pingId, DateTime time)? pong,
    required TResult orElse(),
  }) {
    if (addSongToQueue != null) {
      return addSongToQueue(songData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncMsg value) sync,
    required TResult Function(SearchResourceMsg value) searchResource,
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceAvailabilityMsg value)
        resourceAvailability,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
    required TResult Function(SetMusicChunkSizeMsg value) setMusicChunkSize,
    required TResult Function(PingMsg value) ping,
    required TResult Function(PongMsg value) pong,
  }) {
    return addSongToQueue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncMsg value)? sync,
    TResult? Function(SearchResourceMsg value)? searchResource,
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult? Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult? Function(PingMsg value)? ping,
    TResult? Function(PongMsg value)? pong,
  }) {
    return addSongToQueue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncMsg value)? sync,
    TResult Function(SearchResourceMsg value)? searchResource,
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult Function(PingMsg value)? ping,
    TResult Function(PongMsg value)? pong,
    required TResult orElse(),
  }) {
    if (addSongToQueue != null) {
      return addSongToQueue(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AddSongToQueueMsgToJson(
      this,
    );
  }
}

abstract class AddSongToQueueMsg implements P2pMessage {
  const factory AddSongToQueueMsg(final DetailsPackage songData) =
      _$AddSongToQueueMsg;

  factory AddSongToQueueMsg.fromJson(Map<String, dynamic> json) =
      _$AddSongToQueueMsg.fromJson;

  DetailsPackage get songData;
  @JsonKey(ignore: true)
  _$$AddSongToQueueMsgCopyWith<_$AddSongToQueueMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveSongFromQueueMsgCopyWith<$Res> {
  factory _$$RemoveSongFromQueueMsgCopyWith(_$RemoveSongFromQueueMsg value,
          $Res Function(_$RemoveSongFromQueueMsg) then) =
      __$$RemoveSongFromQueueMsgCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemoveSongFromQueueMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$RemoveSongFromQueueMsg>
    implements _$$RemoveSongFromQueueMsgCopyWith<$Res> {
  __$$RemoveSongFromQueueMsgCopyWithImpl(_$RemoveSongFromQueueMsg _value,
      $Res Function(_$RemoveSongFromQueueMsg) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$RemoveSongFromQueueMsg
    with DiagnosticableTreeMixin
    implements RemoveSongFromQueueMsg {
  const _$RemoveSongFromQueueMsg({final String? $type})
      : $type = $type ?? 'removeSongFromQueue';

  factory _$RemoveSongFromQueueMsg.fromJson(Map<String, dynamic> json) =>
      _$$RemoveSongFromQueueMsgFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'P2pMessage.removeSongFromQueue()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'P2pMessage.removeSongFromQueue'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RemoveSongFromQueueMsg);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration clockOffset) sync,
    required TResult Function(String songId) searchResource,
    required TResult Function(String requestId, String songId, int startIndex)
        requestResource,
    required TResult Function(String songId) resourceAvailability,
    required TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)
        musicPackage,
    required TResult Function() requestStateUpdate,
    required TResult Function(
            List<String> devices, List<DetailsPackage> queue, int queuePosition)
        stateUpdateMsg,
    required TResult Function(int index, DateTime time, Duration? songPosition)
        play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function(DetailsPackage songData) addSongToQueue,
    required TResult Function() removeSongFromQueue,
    required TResult Function(int size) setMusicChunkSize,
    required TResult Function(String id) ping,
    required TResult Function(String pingId, DateTime time) pong,
  }) {
    return removeSongFromQueue();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration clockOffset)? sync,
    TResult? Function(String songId)? searchResource,
    TResult? Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult? Function(String songId)? resourceAvailability,
    TResult? Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult? Function(int index, DateTime time, Duration? songPosition)? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function(DetailsPackage songData)? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
    TResult? Function(int size)? setMusicChunkSize,
    TResult? Function(String id)? ping,
    TResult? Function(String pingId, DateTime time)? pong,
  }) {
    return removeSongFromQueue?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration clockOffset)? sync,
    TResult Function(String songId)? searchResource,
    TResult Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult Function(String songId)? resourceAvailability,
    TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult Function(int index, DateTime time, Duration? songPosition)? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function(DetailsPackage songData)? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    TResult Function(int size)? setMusicChunkSize,
    TResult Function(String id)? ping,
    TResult Function(String pingId, DateTime time)? pong,
    required TResult orElse(),
  }) {
    if (removeSongFromQueue != null) {
      return removeSongFromQueue();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncMsg value) sync,
    required TResult Function(SearchResourceMsg value) searchResource,
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceAvailabilityMsg value)
        resourceAvailability,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
    required TResult Function(SetMusicChunkSizeMsg value) setMusicChunkSize,
    required TResult Function(PingMsg value) ping,
    required TResult Function(PongMsg value) pong,
  }) {
    return removeSongFromQueue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncMsg value)? sync,
    TResult? Function(SearchResourceMsg value)? searchResource,
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult? Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult? Function(PingMsg value)? ping,
    TResult? Function(PongMsg value)? pong,
  }) {
    return removeSongFromQueue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncMsg value)? sync,
    TResult Function(SearchResourceMsg value)? searchResource,
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult Function(PingMsg value)? ping,
    TResult Function(PongMsg value)? pong,
    required TResult orElse(),
  }) {
    if (removeSongFromQueue != null) {
      return removeSongFromQueue(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoveSongFromQueueMsgToJson(
      this,
    );
  }
}

abstract class RemoveSongFromQueueMsg implements P2pMessage {
  const factory RemoveSongFromQueueMsg() = _$RemoveSongFromQueueMsg;

  factory RemoveSongFromQueueMsg.fromJson(Map<String, dynamic> json) =
      _$RemoveSongFromQueueMsg.fromJson;
}

/// @nodoc
abstract class _$$SetMusicChunkSizeMsgCopyWith<$Res> {
  factory _$$SetMusicChunkSizeMsgCopyWith(_$SetMusicChunkSizeMsg value,
          $Res Function(_$SetMusicChunkSizeMsg) then) =
      __$$SetMusicChunkSizeMsgCopyWithImpl<$Res>;
  @useResult
  $Res call({int size});
}

/// @nodoc
class __$$SetMusicChunkSizeMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$SetMusicChunkSizeMsg>
    implements _$$SetMusicChunkSizeMsgCopyWith<$Res> {
  __$$SetMusicChunkSizeMsgCopyWithImpl(_$SetMusicChunkSizeMsg _value,
      $Res Function(_$SetMusicChunkSizeMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
  }) {
    return _then(_$SetMusicChunkSizeMsg(
      null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetMusicChunkSizeMsg
    with DiagnosticableTreeMixin
    implements SetMusicChunkSizeMsg {
  const _$SetMusicChunkSizeMsg(this.size, {final String? $type})
      : $type = $type ?? 'setMusicChunkSize';

  factory _$SetMusicChunkSizeMsg.fromJson(Map<String, dynamic> json) =>
      _$$SetMusicChunkSizeMsgFromJson(json);

  @override
  final int size;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'P2pMessage.setMusicChunkSize(size: $size)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'P2pMessage.setMusicChunkSize'))
      ..add(DiagnosticsProperty('size', size));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetMusicChunkSizeMsg &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetMusicChunkSizeMsgCopyWith<_$SetMusicChunkSizeMsg> get copyWith =>
      __$$SetMusicChunkSizeMsgCopyWithImpl<_$SetMusicChunkSizeMsg>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration clockOffset) sync,
    required TResult Function(String songId) searchResource,
    required TResult Function(String requestId, String songId, int startIndex)
        requestResource,
    required TResult Function(String songId) resourceAvailability,
    required TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)
        musicPackage,
    required TResult Function() requestStateUpdate,
    required TResult Function(
            List<String> devices, List<DetailsPackage> queue, int queuePosition)
        stateUpdateMsg,
    required TResult Function(int index, DateTime time, Duration? songPosition)
        play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function(DetailsPackage songData) addSongToQueue,
    required TResult Function() removeSongFromQueue,
    required TResult Function(int size) setMusicChunkSize,
    required TResult Function(String id) ping,
    required TResult Function(String pingId, DateTime time) pong,
  }) {
    return setMusicChunkSize(size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration clockOffset)? sync,
    TResult? Function(String songId)? searchResource,
    TResult? Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult? Function(String songId)? resourceAvailability,
    TResult? Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult? Function(int index, DateTime time, Duration? songPosition)? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function(DetailsPackage songData)? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
    TResult? Function(int size)? setMusicChunkSize,
    TResult? Function(String id)? ping,
    TResult? Function(String pingId, DateTime time)? pong,
  }) {
    return setMusicChunkSize?.call(size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration clockOffset)? sync,
    TResult Function(String songId)? searchResource,
    TResult Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult Function(String songId)? resourceAvailability,
    TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult Function(int index, DateTime time, Duration? songPosition)? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function(DetailsPackage songData)? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    TResult Function(int size)? setMusicChunkSize,
    TResult Function(String id)? ping,
    TResult Function(String pingId, DateTime time)? pong,
    required TResult orElse(),
  }) {
    if (setMusicChunkSize != null) {
      return setMusicChunkSize(size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncMsg value) sync,
    required TResult Function(SearchResourceMsg value) searchResource,
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceAvailabilityMsg value)
        resourceAvailability,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
    required TResult Function(SetMusicChunkSizeMsg value) setMusicChunkSize,
    required TResult Function(PingMsg value) ping,
    required TResult Function(PongMsg value) pong,
  }) {
    return setMusicChunkSize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncMsg value)? sync,
    TResult? Function(SearchResourceMsg value)? searchResource,
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult? Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult? Function(PingMsg value)? ping,
    TResult? Function(PongMsg value)? pong,
  }) {
    return setMusicChunkSize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncMsg value)? sync,
    TResult Function(SearchResourceMsg value)? searchResource,
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult Function(PingMsg value)? ping,
    TResult Function(PongMsg value)? pong,
    required TResult orElse(),
  }) {
    if (setMusicChunkSize != null) {
      return setMusicChunkSize(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SetMusicChunkSizeMsgToJson(
      this,
    );
  }
}

abstract class SetMusicChunkSizeMsg implements P2pMessage {
  const factory SetMusicChunkSizeMsg(final int size) = _$SetMusicChunkSizeMsg;

  factory SetMusicChunkSizeMsg.fromJson(Map<String, dynamic> json) =
      _$SetMusicChunkSizeMsg.fromJson;

  int get size;
  @JsonKey(ignore: true)
  _$$SetMusicChunkSizeMsgCopyWith<_$SetMusicChunkSizeMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PingMsgCopyWith<$Res> {
  factory _$$PingMsgCopyWith(_$PingMsg value, $Res Function(_$PingMsg) then) =
      __$$PingMsgCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$PingMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$PingMsg>
    implements _$$PingMsgCopyWith<$Res> {
  __$$PingMsgCopyWithImpl(_$PingMsg _value, $Res Function(_$PingMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$PingMsg(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PingMsg with DiagnosticableTreeMixin implements PingMsg {
  const _$PingMsg(this.id, {final String? $type}) : $type = $type ?? 'ping';

  factory _$PingMsg.fromJson(Map<String, dynamic> json) =>
      _$$PingMsgFromJson(json);

  @override
  final String id;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'P2pMessage.ping(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'P2pMessage.ping'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PingMsg &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PingMsgCopyWith<_$PingMsg> get copyWith =>
      __$$PingMsgCopyWithImpl<_$PingMsg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration clockOffset) sync,
    required TResult Function(String songId) searchResource,
    required TResult Function(String requestId, String songId, int startIndex)
        requestResource,
    required TResult Function(String songId) resourceAvailability,
    required TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)
        musicPackage,
    required TResult Function() requestStateUpdate,
    required TResult Function(
            List<String> devices, List<DetailsPackage> queue, int queuePosition)
        stateUpdateMsg,
    required TResult Function(int index, DateTime time, Duration? songPosition)
        play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function(DetailsPackage songData) addSongToQueue,
    required TResult Function() removeSongFromQueue,
    required TResult Function(int size) setMusicChunkSize,
    required TResult Function(String id) ping,
    required TResult Function(String pingId, DateTime time) pong,
  }) {
    return ping(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration clockOffset)? sync,
    TResult? Function(String songId)? searchResource,
    TResult? Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult? Function(String songId)? resourceAvailability,
    TResult? Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult? Function(int index, DateTime time, Duration? songPosition)? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function(DetailsPackage songData)? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
    TResult? Function(int size)? setMusicChunkSize,
    TResult? Function(String id)? ping,
    TResult? Function(String pingId, DateTime time)? pong,
  }) {
    return ping?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration clockOffset)? sync,
    TResult Function(String songId)? searchResource,
    TResult Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult Function(String songId)? resourceAvailability,
    TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult Function(int index, DateTime time, Duration? songPosition)? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function(DetailsPackage songData)? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    TResult Function(int size)? setMusicChunkSize,
    TResult Function(String id)? ping,
    TResult Function(String pingId, DateTime time)? pong,
    required TResult orElse(),
  }) {
    if (ping != null) {
      return ping(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncMsg value) sync,
    required TResult Function(SearchResourceMsg value) searchResource,
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceAvailabilityMsg value)
        resourceAvailability,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
    required TResult Function(SetMusicChunkSizeMsg value) setMusicChunkSize,
    required TResult Function(PingMsg value) ping,
    required TResult Function(PongMsg value) pong,
  }) {
    return ping(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncMsg value)? sync,
    TResult? Function(SearchResourceMsg value)? searchResource,
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult? Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult? Function(PingMsg value)? ping,
    TResult? Function(PongMsg value)? pong,
  }) {
    return ping?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncMsg value)? sync,
    TResult Function(SearchResourceMsg value)? searchResource,
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult Function(PingMsg value)? ping,
    TResult Function(PongMsg value)? pong,
    required TResult orElse(),
  }) {
    if (ping != null) {
      return ping(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PingMsgToJson(
      this,
    );
  }
}

abstract class PingMsg implements P2pMessage {
  const factory PingMsg(final String id) = _$PingMsg;

  factory PingMsg.fromJson(Map<String, dynamic> json) = _$PingMsg.fromJson;

  String get id;
  @JsonKey(ignore: true)
  _$$PingMsgCopyWith<_$PingMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PongMsgCopyWith<$Res> {
  factory _$$PongMsgCopyWith(_$PongMsg value, $Res Function(_$PongMsg) then) =
      __$$PongMsgCopyWithImpl<$Res>;
  @useResult
  $Res call({String pingId, DateTime time});
}

/// @nodoc
class __$$PongMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$PongMsg>
    implements _$$PongMsgCopyWith<$Res> {
  __$$PongMsgCopyWithImpl(_$PongMsg _value, $Res Function(_$PongMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pingId = null,
    Object? time = null,
  }) {
    return _then(_$PongMsg(
      null == pingId
          ? _value.pingId
          : pingId // ignore: cast_nullable_to_non_nullable
              as String,
      null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PongMsg with DiagnosticableTreeMixin implements PongMsg {
  const _$PongMsg(this.pingId, this.time, {final String? $type})
      : $type = $type ?? 'pong';

  factory _$PongMsg.fromJson(Map<String, dynamic> json) =>
      _$$PongMsgFromJson(json);

  @override
  final String pingId;
  @override
  final DateTime time;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'P2pMessage.pong(pingId: $pingId, time: $time)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'P2pMessage.pong'))
      ..add(DiagnosticsProperty('pingId', pingId))
      ..add(DiagnosticsProperty('time', time));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PongMsg &&
            (identical(other.pingId, pingId) || other.pingId == pingId) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pingId, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PongMsgCopyWith<_$PongMsg> get copyWith =>
      __$$PongMsgCopyWithImpl<_$PongMsg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration clockOffset) sync,
    required TResult Function(String songId) searchResource,
    required TResult Function(String requestId, String songId, int startIndex)
        requestResource,
    required TResult Function(String songId) resourceAvailability,
    required TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)
        musicPackage,
    required TResult Function() requestStateUpdate,
    required TResult Function(
            List<String> devices, List<DetailsPackage> queue, int queuePosition)
        stateUpdateMsg,
    required TResult Function(int index, DateTime time, Duration? songPosition)
        play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function(DetailsPackage songData) addSongToQueue,
    required TResult Function() removeSongFromQueue,
    required TResult Function(int size) setMusicChunkSize,
    required TResult Function(String id) ping,
    required TResult Function(String pingId, DateTime time) pong,
  }) {
    return pong(pingId, time);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Duration clockOffset)? sync,
    TResult? Function(String songId)? searchResource,
    TResult? Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult? Function(String songId)? resourceAvailability,
    TResult? Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult? Function(int index, DateTime time, Duration? songPosition)? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function(DetailsPackage songData)? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
    TResult? Function(int size)? setMusicChunkSize,
    TResult? Function(String id)? ping,
    TResult? Function(String pingId, DateTime time)? pong,
  }) {
    return pong?.call(pingId, time);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration clockOffset)? sync,
    TResult Function(String songId)? searchResource,
    TResult Function(String requestId, String songId, int startIndex)?
        requestResource,
    TResult Function(String songId)? resourceAvailability,
    TResult Function(String requestId, String songId, int startIndex,
            String serializedBytes)?
        musicPackage,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices, List<DetailsPackage> queue,
            int queuePosition)?
        stateUpdateMsg,
    TResult Function(int index, DateTime time, Duration? songPosition)? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function(DetailsPackage songData)? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    TResult Function(int size)? setMusicChunkSize,
    TResult Function(String id)? ping,
    TResult Function(String pingId, DateTime time)? pong,
    required TResult orElse(),
  }) {
    if (pong != null) {
      return pong(pingId, time);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncMsg value) sync,
    required TResult Function(SearchResourceMsg value) searchResource,
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceAvailabilityMsg value)
        resourceAvailability,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
    required TResult Function(SetMusicChunkSizeMsg value) setMusicChunkSize,
    required TResult Function(PingMsg value) ping,
    required TResult Function(PongMsg value) pong,
  }) {
    return pong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncMsg value)? sync,
    TResult? Function(SearchResourceMsg value)? searchResource,
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult? Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult? Function(PingMsg value)? ping,
    TResult? Function(PongMsg value)? pong,
  }) {
    return pong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncMsg value)? sync,
    TResult Function(SearchResourceMsg value)? searchResource,
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceAvailabilityMsg value)? resourceAvailability,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    TResult Function(SetMusicChunkSizeMsg value)? setMusicChunkSize,
    TResult Function(PingMsg value)? ping,
    TResult Function(PongMsg value)? pong,
    required TResult orElse(),
  }) {
    if (pong != null) {
      return pong(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PongMsgToJson(
      this,
    );
  }
}

abstract class PongMsg implements P2pMessage {
  const factory PongMsg(final String pingId, final DateTime time) = _$PongMsg;

  factory PongMsg.fromJson(Map<String, dynamic> json) = _$PongMsg.fromJson;

  String get pingId;
  DateTime get time;
  @JsonKey(ignore: true)
  _$$PongMsgCopyWith<_$PongMsg> get copyWith =>
      throw _privateConstructorUsedError;
}
