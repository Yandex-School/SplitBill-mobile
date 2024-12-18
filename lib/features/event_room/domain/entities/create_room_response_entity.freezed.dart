// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_room_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateRoomResponseEntity {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;

  /// Create a copy of CreateRoomResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateRoomResponseEntityCopyWith<CreateRoomResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRoomResponseEntityCopyWith<$Res> {
  factory $CreateRoomResponseEntityCopyWith(CreateRoomResponseEntity value,
          $Res Function(CreateRoomResponseEntity) then) =
      _$CreateRoomResponseEntityCopyWithImpl<$Res, CreateRoomResponseEntity>;
  @useResult
  $Res call({int id, String? name, int? userId});
}

/// @nodoc
class _$CreateRoomResponseEntityCopyWithImpl<$Res,
        $Val extends CreateRoomResponseEntity>
    implements $CreateRoomResponseEntityCopyWith<$Res> {
  _$CreateRoomResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateRoomResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateRoomResponseEntityImplCopyWith<$Res>
    implements $CreateRoomResponseEntityCopyWith<$Res> {
  factory _$$CreateRoomResponseEntityImplCopyWith(
          _$CreateRoomResponseEntityImpl value,
          $Res Function(_$CreateRoomResponseEntityImpl) then) =
      __$$CreateRoomResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? name, int? userId});
}

/// @nodoc
class __$$CreateRoomResponseEntityImplCopyWithImpl<$Res>
    extends _$CreateRoomResponseEntityCopyWithImpl<$Res,
        _$CreateRoomResponseEntityImpl>
    implements _$$CreateRoomResponseEntityImplCopyWith<$Res> {
  __$$CreateRoomResponseEntityImplCopyWithImpl(
      _$CreateRoomResponseEntityImpl _value,
      $Res Function(_$CreateRoomResponseEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateRoomResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$CreateRoomResponseEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CreateRoomResponseEntityImpl extends _CreateRoomResponseEntity {
  _$CreateRoomResponseEntityImpl(
      {required this.id, required this.name, required this.userId})
      : super._();

  @override
  final int id;
  @override
  final String? name;
  @override
  final int? userId;

  @override
  String toString() {
    return 'CreateRoomResponseEntity(id: $id, name: $name, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRoomResponseEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, userId);

  /// Create a copy of CreateRoomResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRoomResponseEntityImplCopyWith<_$CreateRoomResponseEntityImpl>
      get copyWith => __$$CreateRoomResponseEntityImplCopyWithImpl<
          _$CreateRoomResponseEntityImpl>(this, _$identity);
}

abstract class _CreateRoomResponseEntity extends CreateRoomResponseEntity {
  factory _CreateRoomResponseEntity(
      {required final int id,
      required final String? name,
      required final int? userId}) = _$CreateRoomResponseEntityImpl;
  _CreateRoomResponseEntity._() : super._();

  @override
  int get id;
  @override
  String? get name;
  @override
  int? get userId;

  /// Create a copy of CreateRoomResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateRoomResponseEntityImplCopyWith<_$CreateRoomResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
