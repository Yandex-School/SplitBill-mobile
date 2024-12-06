// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_products_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserProductsEntity {
  int get id => throw _privateConstructorUsedError;
  PaidStatus get status => throw _privateConstructorUsedError;
  int get productId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;

  /// Create a copy of UserProductsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProductsEntityCopyWith<UserProductsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProductsEntityCopyWith<$Res> {
  factory $UserProductsEntityCopyWith(
          UserProductsEntity value, $Res Function(UserProductsEntity) then) =
      _$UserProductsEntityCopyWithImpl<$Res, UserProductsEntity>;
  @useResult
  $Res call({int id, PaidStatus status, int productId, int userId});
}

/// @nodoc
class _$UserProductsEntityCopyWithImpl<$Res, $Val extends UserProductsEntity>
    implements $UserProductsEntityCopyWith<$Res> {
  _$UserProductsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProductsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? productId = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaidStatus,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProductsEntityImplCopyWith<$Res>
    implements $UserProductsEntityCopyWith<$Res> {
  factory _$$UserProductsEntityImplCopyWith(_$UserProductsEntityImpl value,
          $Res Function(_$UserProductsEntityImpl) then) =
      __$$UserProductsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, PaidStatus status, int productId, int userId});
}

/// @nodoc
class __$$UserProductsEntityImplCopyWithImpl<$Res>
    extends _$UserProductsEntityCopyWithImpl<$Res, _$UserProductsEntityImpl>
    implements _$$UserProductsEntityImplCopyWith<$Res> {
  __$$UserProductsEntityImplCopyWithImpl(_$UserProductsEntityImpl _value,
      $Res Function(_$UserProductsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProductsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? productId = null,
    Object? userId = null,
  }) {
    return _then(_$UserProductsEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaidStatus,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UserProductsEntityImpl extends _UserProductsEntity {
  const _$UserProductsEntityImpl(
      {required this.id,
      required this.status,
      required this.productId,
      required this.userId})
      : super._();

  @override
  final int id;
  @override
  final PaidStatus status;
  @override
  final int productId;
  @override
  final int userId;

  @override
  String toString() {
    return 'UserProductsEntity(id: $id, status: $status, productId: $productId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProductsEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, status, productId, userId);

  /// Create a copy of UserProductsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProductsEntityImplCopyWith<_$UserProductsEntityImpl> get copyWith =>
      __$$UserProductsEntityImplCopyWithImpl<_$UserProductsEntityImpl>(
          this, _$identity);
}

abstract class _UserProductsEntity extends UserProductsEntity {
  const factory _UserProductsEntity(
      {required final int id,
      required final PaidStatus status,
      required final int productId,
      required final int userId}) = _$UserProductsEntityImpl;
  const _UserProductsEntity._() : super._();

  @override
  int get id;
  @override
  PaidStatus get status;
  @override
  int get productId;
  @override
  int get userId;

  /// Create a copy of UserProductsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProductsEntityImplCopyWith<_$UserProductsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
