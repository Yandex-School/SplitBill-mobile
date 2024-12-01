// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterResponseEntity {
  int get id => throw _privateConstructorUsedError;

  /// Create a copy of RegisterResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterResponseEntityCopyWith<RegisterResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterResponseEntityCopyWith<$Res> {
  factory $RegisterResponseEntityCopyWith(RegisterResponseEntity value,
          $Res Function(RegisterResponseEntity) then) =
      _$RegisterResponseEntityCopyWithImpl<$Res, RegisterResponseEntity>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$RegisterResponseEntityCopyWithImpl<$Res,
        $Val extends RegisterResponseEntity>
    implements $RegisterResponseEntityCopyWith<$Res> {
  _$RegisterResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterResponseEntityImplCopyWith<$Res>
    implements $RegisterResponseEntityCopyWith<$Res> {
  factory _$$RegisterResponseEntityImplCopyWith(
          _$RegisterResponseEntityImpl value,
          $Res Function(_$RegisterResponseEntityImpl) then) =
      __$$RegisterResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$RegisterResponseEntityImplCopyWithImpl<$Res>
    extends _$RegisterResponseEntityCopyWithImpl<$Res,
        _$RegisterResponseEntityImpl>
    implements _$$RegisterResponseEntityImplCopyWith<$Res> {
  __$$RegisterResponseEntityImplCopyWithImpl(
      _$RegisterResponseEntityImpl _value,
      $Res Function(_$RegisterResponseEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RegisterResponseEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RegisterResponseEntityImpl implements _RegisterResponseEntity {
  const _$RegisterResponseEntityImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'RegisterResponseEntity(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterResponseEntityImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of RegisterResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterResponseEntityImplCopyWith<_$RegisterResponseEntityImpl>
      get copyWith => __$$RegisterResponseEntityImplCopyWithImpl<
          _$RegisterResponseEntityImpl>(this, _$identity);
}

abstract class _RegisterResponseEntity implements RegisterResponseEntity {
  const factory _RegisterResponseEntity({required final int id}) =
      _$RegisterResponseEntityImpl;

  @override
  int get id;

  /// Create a copy of RegisterResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterResponseEntityImplCopyWith<_$RegisterResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
