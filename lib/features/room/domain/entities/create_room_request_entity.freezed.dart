// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_room_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateRoomRequestEntity {
  String get name => throw _privateConstructorUsedError;
  int get ownerId => throw _privateConstructorUsedError;
  List<ProductEntity>? get products => throw _privateConstructorUsedError;

  /// Create a copy of CreateRoomRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateRoomRequestEntityCopyWith<CreateRoomRequestEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRoomRequestEntityCopyWith<$Res> {
  factory $CreateRoomRequestEntityCopyWith(CreateRoomRequestEntity value,
          $Res Function(CreateRoomRequestEntity) then) =
      _$CreateRoomRequestEntityCopyWithImpl<$Res, CreateRoomRequestEntity>;
  @useResult
  $Res call({String name, int ownerId, List<ProductEntity>? products});
}

/// @nodoc
class _$CreateRoomRequestEntityCopyWithImpl<$Res,
        $Val extends CreateRoomRequestEntity>
    implements $CreateRoomRequestEntityCopyWith<$Res> {
  _$CreateRoomRequestEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateRoomRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ownerId = null,
    Object? products = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as int,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateRoomRequestEntityImplCopyWith<$Res>
    implements $CreateRoomRequestEntityCopyWith<$Res> {
  factory _$$CreateRoomRequestEntityImplCopyWith(
          _$CreateRoomRequestEntityImpl value,
          $Res Function(_$CreateRoomRequestEntityImpl) then) =
      __$$CreateRoomRequestEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int ownerId, List<ProductEntity>? products});
}

/// @nodoc
class __$$CreateRoomRequestEntityImplCopyWithImpl<$Res>
    extends _$CreateRoomRequestEntityCopyWithImpl<$Res,
        _$CreateRoomRequestEntityImpl>
    implements _$$CreateRoomRequestEntityImplCopyWith<$Res> {
  __$$CreateRoomRequestEntityImplCopyWithImpl(
      _$CreateRoomRequestEntityImpl _value,
      $Res Function(_$CreateRoomRequestEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateRoomRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ownerId = null,
    Object? products = freezed,
  }) {
    return _then(_$CreateRoomRequestEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as int,
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>?,
    ));
  }
}

/// @nodoc

class _$CreateRoomRequestEntityImpl extends _CreateRoomRequestEntity {
  const _$CreateRoomRequestEntityImpl(
      {required this.name,
      required this.ownerId,
      final List<ProductEntity>? products})
      : _products = products,
        super._();

  @override
  final String name;
  @override
  final int ownerId;
  final List<ProductEntity>? _products;
  @override
  List<ProductEntity>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CreateRoomRequestEntity(name: $name, ownerId: $ownerId, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRoomRequestEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, ownerId,
      const DeepCollectionEquality().hash(_products));

  /// Create a copy of CreateRoomRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRoomRequestEntityImplCopyWith<_$CreateRoomRequestEntityImpl>
      get copyWith => __$$CreateRoomRequestEntityImplCopyWithImpl<
          _$CreateRoomRequestEntityImpl>(this, _$identity);
}

abstract class _CreateRoomRequestEntity extends CreateRoomRequestEntity {
  const factory _CreateRoomRequestEntity(
      {required final String name,
      required final int ownerId,
      final List<ProductEntity>? products}) = _$CreateRoomRequestEntityImpl;
  const _CreateRoomRequestEntity._() : super._();

  @override
  String get name;
  @override
  int get ownerId;
  @override
  List<ProductEntity>? get products;

  /// Create a copy of CreateRoomRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateRoomRequestEntityImplCopyWith<_$CreateRoomRequestEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
