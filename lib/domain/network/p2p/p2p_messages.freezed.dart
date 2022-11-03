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
    case 'requestResource':
      return RequestResourceMsg.fromJson(json);
    case 'resource':
      return ResourceMsg.fromJson(json);
    case 'requestStateUpdate':
      return RequestStateUpdateMsg.fromJson(json);
    case 'stateUpdateMsg':
      return StateUpdateMsg.fromJson(json);
    case 'musicPackage':
      return MusicPackageMsg.fromJson(json);
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

    default:
      throw CheckedFromJsonException(
          json, 'type', 'P2pMessage', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$P2pMessage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) requestResource,
    required TResult Function(String id) resource,
    required TResult Function() requestStateUpdate,
    required TResult Function(List<String> devices) stateUpdateMsg,
    required TResult Function(String songId, String serializedBytes)
        musicPackage,
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function() addSongToQueue,
    required TResult Function() removeSongFromQueue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? requestResource,
    TResult? Function(String id)? resource,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices)? stateUpdateMsg,
    TResult? Function(String songId, String serializedBytes)? musicPackage,
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function()? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? requestResource,
    TResult Function(String id)? resource,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices)? stateUpdateMsg,
    TResult Function(String songId, String serializedBytes)? musicPackage,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function()? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceMsg value) resource,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceMsg value)? resource,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceMsg value)? resource,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
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
abstract class _$$RequestResourceMsgCopyWith<$Res> {
  factory _$$RequestResourceMsgCopyWith(_$RequestResourceMsg value,
          $Res Function(_$RequestResourceMsg) then) =
      __$$RequestResourceMsgCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
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
    Object? id = null,
  }) {
    return _then(_$RequestResourceMsg(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestResourceMsg implements RequestResourceMsg {
  const _$RequestResourceMsg({required this.id, final String? $type})
      : $type = $type ?? 'requestResource';

  factory _$RequestResourceMsg.fromJson(Map<String, dynamic> json) =>
      _$$RequestResourceMsgFromJson(json);

  @override
  final String id;

  @JsonKey(name: 'type')
  final String $type;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestResourceMsg &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestResourceMsgCopyWith<_$RequestResourceMsg> get copyWith =>
      __$$RequestResourceMsgCopyWithImpl<_$RequestResourceMsg>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) requestResource,
    required TResult Function(String id) resource,
    required TResult Function() requestStateUpdate,
    required TResult Function(List<String> devices) stateUpdateMsg,
    required TResult Function(String songId, String serializedBytes)
        musicPackage,
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function() addSongToQueue,
    required TResult Function() removeSongFromQueue,
  }) {
    return requestResource(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? requestResource,
    TResult? Function(String id)? resource,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices)? stateUpdateMsg,
    TResult? Function(String songId, String serializedBytes)? musicPackage,
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function()? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
  }) {
    return requestResource?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? requestResource,
    TResult Function(String id)? resource,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices)? stateUpdateMsg,
    TResult Function(String songId, String serializedBytes)? musicPackage,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function()? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    required TResult orElse(),
  }) {
    if (requestResource != null) {
      return requestResource(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceMsg value) resource,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
  }) {
    return requestResource(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceMsg value)? resource,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
  }) {
    return requestResource?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceMsg value)? resource,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
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
  const factory RequestResourceMsg({required final String id}) =
      _$RequestResourceMsg;

  factory RequestResourceMsg.fromJson(Map<String, dynamic> json) =
      _$RequestResourceMsg.fromJson;

  String get id;
  @JsonKey(ignore: true)
  _$$RequestResourceMsgCopyWith<_$RequestResourceMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResourceMsgCopyWith<$Res> {
  factory _$$ResourceMsgCopyWith(
          _$ResourceMsg value, $Res Function(_$ResourceMsg) then) =
      __$$ResourceMsgCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$ResourceMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$ResourceMsg>
    implements _$$ResourceMsgCopyWith<$Res> {
  __$$ResourceMsgCopyWithImpl(
      _$ResourceMsg _value, $Res Function(_$ResourceMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ResourceMsg(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResourceMsg implements ResourceMsg {
  const _$ResourceMsg({required this.id, final String? $type})
      : $type = $type ?? 'resource';

  factory _$ResourceMsg.fromJson(Map<String, dynamic> json) =>
      _$$ResourceMsgFromJson(json);

  @override
  final String id;

  @JsonKey(name: 'type')
  final String $type;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceMsg &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceMsgCopyWith<_$ResourceMsg> get copyWith =>
      __$$ResourceMsgCopyWithImpl<_$ResourceMsg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) requestResource,
    required TResult Function(String id) resource,
    required TResult Function() requestStateUpdate,
    required TResult Function(List<String> devices) stateUpdateMsg,
    required TResult Function(String songId, String serializedBytes)
        musicPackage,
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function() addSongToQueue,
    required TResult Function() removeSongFromQueue,
  }) {
    return resource(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? requestResource,
    TResult? Function(String id)? resource,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices)? stateUpdateMsg,
    TResult? Function(String songId, String serializedBytes)? musicPackage,
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function()? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
  }) {
    return resource?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? requestResource,
    TResult Function(String id)? resource,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices)? stateUpdateMsg,
    TResult Function(String songId, String serializedBytes)? musicPackage,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function()? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    required TResult orElse(),
  }) {
    if (resource != null) {
      return resource(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceMsg value) resource,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
  }) {
    return resource(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceMsg value)? resource,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
  }) {
    return resource?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceMsg value)? resource,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    required TResult orElse(),
  }) {
    if (resource != null) {
      return resource(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ResourceMsgToJson(
      this,
    );
  }
}

abstract class ResourceMsg implements P2pMessage {
  const factory ResourceMsg({required final String id}) = _$ResourceMsg;

  factory ResourceMsg.fromJson(Map<String, dynamic> json) =
      _$ResourceMsg.fromJson;

  String get id;
  @JsonKey(ignore: true)
  _$$ResourceMsgCopyWith<_$ResourceMsg> get copyWith =>
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
class _$RequestStateUpdateMsg implements RequestStateUpdateMsg {
  const _$RequestStateUpdateMsg({final String? $type})
      : $type = $type ?? 'requestStateUpdate';

  factory _$RequestStateUpdateMsg.fromJson(Map<String, dynamic> json) =>
      _$$RequestStateUpdateMsgFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

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
    required TResult Function(String id) requestResource,
    required TResult Function(String id) resource,
    required TResult Function() requestStateUpdate,
    required TResult Function(List<String> devices) stateUpdateMsg,
    required TResult Function(String songId, String serializedBytes)
        musicPackage,
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function() addSongToQueue,
    required TResult Function() removeSongFromQueue,
  }) {
    return requestStateUpdate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? requestResource,
    TResult? Function(String id)? resource,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices)? stateUpdateMsg,
    TResult? Function(String songId, String serializedBytes)? musicPackage,
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function()? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
  }) {
    return requestStateUpdate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? requestResource,
    TResult Function(String id)? resource,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices)? stateUpdateMsg,
    TResult Function(String songId, String serializedBytes)? musicPackage,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function()? addSongToQueue,
    TResult Function()? removeSongFromQueue,
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
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceMsg value) resource,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
  }) {
    return requestStateUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceMsg value)? resource,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
  }) {
    return requestStateUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceMsg value)? resource,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
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
  $Res call({List<String> devices});
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
  }) {
    return _then(_$StateUpdateMsg(
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StateUpdateMsg implements StateUpdateMsg {
  const _$StateUpdateMsg(
      {required final List<String> devices, final String? $type})
      : _devices = devices,
        $type = $type ?? 'stateUpdateMsg';

  factory _$StateUpdateMsg.fromJson(Map<String, dynamic> json) =>
      _$$StateUpdateMsgFromJson(json);

  final List<String> _devices;
  @override
  List<String> get devices {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateUpdateMsg &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateUpdateMsgCopyWith<_$StateUpdateMsg> get copyWith =>
      __$$StateUpdateMsgCopyWithImpl<_$StateUpdateMsg>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) requestResource,
    required TResult Function(String id) resource,
    required TResult Function() requestStateUpdate,
    required TResult Function(List<String> devices) stateUpdateMsg,
    required TResult Function(String songId, String serializedBytes)
        musicPackage,
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function() addSongToQueue,
    required TResult Function() removeSongFromQueue,
  }) {
    return stateUpdateMsg(devices);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? requestResource,
    TResult? Function(String id)? resource,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices)? stateUpdateMsg,
    TResult? Function(String songId, String serializedBytes)? musicPackage,
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function()? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
  }) {
    return stateUpdateMsg?.call(devices);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? requestResource,
    TResult Function(String id)? resource,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices)? stateUpdateMsg,
    TResult Function(String songId, String serializedBytes)? musicPackage,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function()? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    required TResult orElse(),
  }) {
    if (stateUpdateMsg != null) {
      return stateUpdateMsg(devices);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceMsg value) resource,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
  }) {
    return stateUpdateMsg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceMsg value)? resource,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
  }) {
    return stateUpdateMsg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceMsg value)? resource,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
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
  const factory StateUpdateMsg({required final List<String> devices}) =
      _$StateUpdateMsg;

  factory StateUpdateMsg.fromJson(Map<String, dynamic> json) =
      _$StateUpdateMsg.fromJson;

  List<String> get devices;
  @JsonKey(ignore: true)
  _$$StateUpdateMsgCopyWith<_$StateUpdateMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MusicPackageCopyWith<$Res> {
  factory _$$MusicPackageCopyWith(
          _$MusicPackage value, $Res Function(_$MusicPackage) then) =
      __$$MusicPackageCopyWithImpl<$Res>;
  @useResult
  $Res call({String songId, String serializedBytes});
}

/// @nodoc
class __$$MusicPackageCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$MusicPackage>
    implements _$$MusicPackageCopyWith<$Res> {
  __$$MusicPackageCopyWithImpl(
      _$MusicPackage _value, $Res Function(_$MusicPackage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songId = null,
    Object? serializedBytes = null,
  }) {
    return _then(_$MusicPackage(
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as String,
      serializedBytes: null == serializedBytes
          ? _value.serializedBytes
          : serializedBytes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicPackage implements MusicPackageMsg {
  const _$MusicPackage(
      {required this.songId,
      required this.serializedBytes,
      final String? $type})
      : $type = $type ?? 'musicPackage';

  factory _$MusicPackage.fromJson(Map<String, dynamic> json) =>
      _$$MusicPackageFromJson(json);

  @override
  final String songId;
  @override
  final String serializedBytes;

  @JsonKey(name: 'type')
  final String $type;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicPackage &&
            (identical(other.songId, songId) || other.songId == songId) &&
            (identical(other.serializedBytes, serializedBytes) ||
                other.serializedBytes == serializedBytes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, songId, serializedBytes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicPackageCopyWith<_$MusicPackage> get copyWith =>
      __$$MusicPackageCopyWithImpl<_$MusicPackage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) requestResource,
    required TResult Function(String id) resource,
    required TResult Function() requestStateUpdate,
    required TResult Function(List<String> devices) stateUpdateMsg,
    required TResult Function(String songId, String serializedBytes)
        musicPackage,
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function() addSongToQueue,
    required TResult Function() removeSongFromQueue,
  }) {
    return musicPackage(songId, serializedBytes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? requestResource,
    TResult? Function(String id)? resource,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices)? stateUpdateMsg,
    TResult? Function(String songId, String serializedBytes)? musicPackage,
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function()? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
  }) {
    return musicPackage?.call(songId, serializedBytes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? requestResource,
    TResult Function(String id)? resource,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices)? stateUpdateMsg,
    TResult Function(String songId, String serializedBytes)? musicPackage,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function()? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    required TResult orElse(),
  }) {
    if (musicPackage != null) {
      return musicPackage(songId, serializedBytes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceMsg value) resource,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
  }) {
    return musicPackage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceMsg value)? resource,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
  }) {
    return musicPackage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceMsg value)? resource,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
    required TResult orElse(),
  }) {
    if (musicPackage != null) {
      return musicPackage(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicPackageToJson(
      this,
    );
  }
}

abstract class MusicPackageMsg implements P2pMessage {
  const factory MusicPackageMsg(
      {required final String songId,
      required final String serializedBytes}) = _$MusicPackage;

  factory MusicPackageMsg.fromJson(Map<String, dynamic> json) =
      _$MusicPackage.fromJson;

  String get songId;
  String get serializedBytes;
  @JsonKey(ignore: true)
  _$$MusicPackageCopyWith<_$MusicPackage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayMsgCopyWith<$Res> {
  factory _$$PlayMsgCopyWith(_$PlayMsg value, $Res Function(_$PlayMsg) then) =
      __$$PlayMsgCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlayMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$PlayMsg>
    implements _$$PlayMsgCopyWith<$Res> {
  __$$PlayMsgCopyWithImpl(_$PlayMsg _value, $Res Function(_$PlayMsg) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$PlayMsg implements PlayMsg {
  const _$PlayMsg({final String? $type}) : $type = $type ?? 'play';

  factory _$PlayMsg.fromJson(Map<String, dynamic> json) =>
      _$$PlayMsgFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlayMsg);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) requestResource,
    required TResult Function(String id) resource,
    required TResult Function() requestStateUpdate,
    required TResult Function(List<String> devices) stateUpdateMsg,
    required TResult Function(String songId, String serializedBytes)
        musicPackage,
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function() addSongToQueue,
    required TResult Function() removeSongFromQueue,
  }) {
    return play();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? requestResource,
    TResult? Function(String id)? resource,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices)? stateUpdateMsg,
    TResult? Function(String songId, String serializedBytes)? musicPackage,
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function()? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
  }) {
    return play?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? requestResource,
    TResult Function(String id)? resource,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices)? stateUpdateMsg,
    TResult Function(String songId, String serializedBytes)? musicPackage,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function()? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    required TResult orElse(),
  }) {
    if (play != null) {
      return play();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceMsg value) resource,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
  }) {
    return play(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceMsg value)? resource,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
  }) {
    return play?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceMsg value)? resource,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
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
  const factory PlayMsg() = _$PlayMsg;

  factory PlayMsg.fromJson(Map<String, dynamic> json) = _$PlayMsg.fromJson;
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
class _$PauseMsg implements PauseMsg {
  const _$PauseMsg({final String? $type}) : $type = $type ?? 'pause';

  factory _$PauseMsg.fromJson(Map<String, dynamic> json) =>
      _$$PauseMsgFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

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
    required TResult Function(String id) requestResource,
    required TResult Function(String id) resource,
    required TResult Function() requestStateUpdate,
    required TResult Function(List<String> devices) stateUpdateMsg,
    required TResult Function(String songId, String serializedBytes)
        musicPackage,
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function() addSongToQueue,
    required TResult Function() removeSongFromQueue,
  }) {
    return pause();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? requestResource,
    TResult? Function(String id)? resource,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices)? stateUpdateMsg,
    TResult? Function(String songId, String serializedBytes)? musicPackage,
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function()? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
  }) {
    return pause?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? requestResource,
    TResult Function(String id)? resource,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices)? stateUpdateMsg,
    TResult Function(String songId, String serializedBytes)? musicPackage,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function()? addSongToQueue,
    TResult Function()? removeSongFromQueue,
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
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceMsg value) resource,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
  }) {
    return pause(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceMsg value)? resource,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
  }) {
    return pause?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceMsg value)? resource,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
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
class _$SkipSongMsg implements SkipSongMsg {
  const _$SkipSongMsg({final String? $type}) : $type = $type ?? 'skipSong';

  factory _$SkipSongMsg.fromJson(Map<String, dynamic> json) =>
      _$$SkipSongMsgFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

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
    required TResult Function(String id) requestResource,
    required TResult Function(String id) resource,
    required TResult Function() requestStateUpdate,
    required TResult Function(List<String> devices) stateUpdateMsg,
    required TResult Function(String songId, String serializedBytes)
        musicPackage,
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function() addSongToQueue,
    required TResult Function() removeSongFromQueue,
  }) {
    return skipSong();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? requestResource,
    TResult? Function(String id)? resource,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices)? stateUpdateMsg,
    TResult? Function(String songId, String serializedBytes)? musicPackage,
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function()? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
  }) {
    return skipSong?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? requestResource,
    TResult Function(String id)? resource,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices)? stateUpdateMsg,
    TResult Function(String songId, String serializedBytes)? musicPackage,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function()? addSongToQueue,
    TResult Function()? removeSongFromQueue,
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
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceMsg value) resource,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
  }) {
    return skipSong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceMsg value)? resource,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
  }) {
    return skipSong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceMsg value)? resource,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
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
class _$PreviousSongMsg implements PreviousSongMsg {
  const _$PreviousSongMsg({final String? $type})
      : $type = $type ?? 'previousSong';

  factory _$PreviousSongMsg.fromJson(Map<String, dynamic> json) =>
      _$$PreviousSongMsgFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

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
    required TResult Function(String id) requestResource,
    required TResult Function(String id) resource,
    required TResult Function() requestStateUpdate,
    required TResult Function(List<String> devices) stateUpdateMsg,
    required TResult Function(String songId, String serializedBytes)
        musicPackage,
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function() addSongToQueue,
    required TResult Function() removeSongFromQueue,
  }) {
    return previousSong();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? requestResource,
    TResult? Function(String id)? resource,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices)? stateUpdateMsg,
    TResult? Function(String songId, String serializedBytes)? musicPackage,
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function()? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
  }) {
    return previousSong?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? requestResource,
    TResult Function(String id)? resource,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices)? stateUpdateMsg,
    TResult Function(String songId, String serializedBytes)? musicPackage,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function()? addSongToQueue,
    TResult Function()? removeSongFromQueue,
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
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceMsg value) resource,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
  }) {
    return previousSong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceMsg value)? resource,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
  }) {
    return previousSong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceMsg value)? resource,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
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
}

/// @nodoc
class __$$AddSongToQueueMsgCopyWithImpl<$Res>
    extends _$P2pMessageCopyWithImpl<$Res, _$AddSongToQueueMsg>
    implements _$$AddSongToQueueMsgCopyWith<$Res> {
  __$$AddSongToQueueMsgCopyWithImpl(
      _$AddSongToQueueMsg _value, $Res Function(_$AddSongToQueueMsg) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$AddSongToQueueMsg implements AddSongToQueueMsg {
  const _$AddSongToQueueMsg({final String? $type})
      : $type = $type ?? 'addSongToQueue';

  factory _$AddSongToQueueMsg.fromJson(Map<String, dynamic> json) =>
      _$$AddSongToQueueMsgFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddSongToQueueMsg);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) requestResource,
    required TResult Function(String id) resource,
    required TResult Function() requestStateUpdate,
    required TResult Function(List<String> devices) stateUpdateMsg,
    required TResult Function(String songId, String serializedBytes)
        musicPackage,
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function() addSongToQueue,
    required TResult Function() removeSongFromQueue,
  }) {
    return addSongToQueue();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? requestResource,
    TResult? Function(String id)? resource,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices)? stateUpdateMsg,
    TResult? Function(String songId, String serializedBytes)? musicPackage,
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function()? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
  }) {
    return addSongToQueue?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? requestResource,
    TResult Function(String id)? resource,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices)? stateUpdateMsg,
    TResult Function(String songId, String serializedBytes)? musicPackage,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function()? addSongToQueue,
    TResult Function()? removeSongFromQueue,
    required TResult orElse(),
  }) {
    if (addSongToQueue != null) {
      return addSongToQueue();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceMsg value) resource,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
  }) {
    return addSongToQueue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceMsg value)? resource,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
  }) {
    return addSongToQueue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceMsg value)? resource,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
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
  const factory AddSongToQueueMsg() = _$AddSongToQueueMsg;

  factory AddSongToQueueMsg.fromJson(Map<String, dynamic> json) =
      _$AddSongToQueueMsg.fromJson;
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
class _$RemoveSongFromQueueMsg implements RemoveSongFromQueueMsg {
  const _$RemoveSongFromQueueMsg({final String? $type})
      : $type = $type ?? 'removeSongFromQueue';

  factory _$RemoveSongFromQueueMsg.fromJson(Map<String, dynamic> json) =>
      _$$RemoveSongFromQueueMsgFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

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
    required TResult Function(String id) requestResource,
    required TResult Function(String id) resource,
    required TResult Function() requestStateUpdate,
    required TResult Function(List<String> devices) stateUpdateMsg,
    required TResult Function(String songId, String serializedBytes)
        musicPackage,
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function() skipSong,
    required TResult Function() previousSong,
    required TResult Function() addSongToQueue,
    required TResult Function() removeSongFromQueue,
  }) {
    return removeSongFromQueue();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? requestResource,
    TResult? Function(String id)? resource,
    TResult? Function()? requestStateUpdate,
    TResult? Function(List<String> devices)? stateUpdateMsg,
    TResult? Function(String songId, String serializedBytes)? musicPackage,
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function()? skipSong,
    TResult? Function()? previousSong,
    TResult? Function()? addSongToQueue,
    TResult? Function()? removeSongFromQueue,
  }) {
    return removeSongFromQueue?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? requestResource,
    TResult Function(String id)? resource,
    TResult Function()? requestStateUpdate,
    TResult Function(List<String> devices)? stateUpdateMsg,
    TResult Function(String songId, String serializedBytes)? musicPackage,
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function()? skipSong,
    TResult Function()? previousSong,
    TResult Function()? addSongToQueue,
    TResult Function()? removeSongFromQueue,
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
    required TResult Function(RequestResourceMsg value) requestResource,
    required TResult Function(ResourceMsg value) resource,
    required TResult Function(RequestStateUpdateMsg value) requestStateUpdate,
    required TResult Function(StateUpdateMsg value) stateUpdateMsg,
    required TResult Function(MusicPackageMsg value) musicPackage,
    required TResult Function(PlayMsg value) play,
    required TResult Function(PauseMsg value) pause,
    required TResult Function(SkipSongMsg value) skipSong,
    required TResult Function(PreviousSongMsg value) previousSong,
    required TResult Function(AddSongToQueueMsg value) addSongToQueue,
    required TResult Function(RemoveSongFromQueueMsg value) removeSongFromQueue,
  }) {
    return removeSongFromQueue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestResourceMsg value)? requestResource,
    TResult? Function(ResourceMsg value)? resource,
    TResult? Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult? Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult? Function(MusicPackageMsg value)? musicPackage,
    TResult? Function(PlayMsg value)? play,
    TResult? Function(PauseMsg value)? pause,
    TResult? Function(SkipSongMsg value)? skipSong,
    TResult? Function(PreviousSongMsg value)? previousSong,
    TResult? Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult? Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
  }) {
    return removeSongFromQueue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestResourceMsg value)? requestResource,
    TResult Function(ResourceMsg value)? resource,
    TResult Function(RequestStateUpdateMsg value)? requestStateUpdate,
    TResult Function(StateUpdateMsg value)? stateUpdateMsg,
    TResult Function(MusicPackageMsg value)? musicPackage,
    TResult Function(PlayMsg value)? play,
    TResult Function(PauseMsg value)? pause,
    TResult Function(SkipSongMsg value)? skipSong,
    TResult Function(PreviousSongMsg value)? previousSong,
    TResult Function(AddSongToQueueMsg value)? addSongToQueue,
    TResult Function(RemoveSongFromQueueMsg value)? removeSongFromQueue,
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