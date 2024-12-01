// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterRequestEntity {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  /// Create a copy of RegisterRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterRequestEntityCopyWith<RegisterRequestEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterRequestEntityCopyWith<$Res> {
  factory $RegisterRequestEntityCopyWith(RegisterRequestEntity value,
          $Res Function(RegisterRequestEntity) then) =
      _$RegisterRequestEntityCopyWithImpl<$Res, RegisterRequestEntity>;
  @useResult
  $Res call(
      {String username, String password, String fullName, String? photoUrl});
}

/// @nodoc
class _$RegisterRequestEntityCopyWithImpl<$Res,
        $Val extends RegisterRequestEntity>
    implements $RegisterRequestEntityCopyWith<$Res> {
  _$RegisterRequestEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? fullName = null,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterRequestEntityImplCopyWith<$Res>
    implements $RegisterRequestEntityCopyWith<$Res> {
  factory _$$RegisterRequestEntityImplCopyWith(
          _$RegisterRequestEntityImpl value,
          $Res Function(_$RegisterRequestEntityImpl) then) =
      __$$RegisterRequestEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username, String password, String fullName, String? photoUrl});
}

/// @nodoc
class __$$RegisterRequestEntityImplCopyWithImpl<$Res>
    extends _$RegisterRequestEntityCopyWithImpl<$Res,
        _$RegisterRequestEntityImpl>
    implements _$$RegisterRequestEntityImplCopyWith<$Res> {
  __$$RegisterRequestEntityImplCopyWithImpl(_$RegisterRequestEntityImpl _value,
      $Res Function(_$RegisterRequestEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? fullName = null,
    Object? photoUrl = freezed,
  }) {
    return _then(_$RegisterRequestEntityImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RegisterRequestEntityImpl implements _RegisterRequestEntity {
  const _$RegisterRequestEntityImpl(
      {required this.username,
      required this.password,
      required this.fullName,
      this.photoUrl});

  @override
  final String username;
  @override
  final String password;
  @override
  final String fullName;
  @override
  final String? photoUrl;

  @override
  String toString() {
    return 'RegisterRequestEntity(username: $username, password: $password, fullName: $fullName, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterRequestEntityImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, username, password, fullName, photoUrl);

  /// Create a copy of RegisterRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterRequestEntityImplCopyWith<_$RegisterRequestEntityImpl>
      get copyWith => __$$RegisterRequestEntityImplCopyWithImpl<
          _$RegisterRequestEntityImpl>(this, _$identity);
}

abstract class _RegisterRequestEntity implements RegisterRequestEntity {
  const factory _RegisterRequestEntity(
      {required final String username,
      required final String password,
      required final String fullName,
      final String? photoUrl}) = _$RegisterRequestEntityImpl;

  @override
  String get username;
  @override
  String get password;
  @override
  String get fullName;
  @override
  String? get photoUrl;

  /// Create a copy of RegisterRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterRequestEntityImplCopyWith<_$RegisterRequestEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
