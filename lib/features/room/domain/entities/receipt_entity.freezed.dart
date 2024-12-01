// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReceiptEntity {
  List<ProductModel> get products => throw _privateConstructorUsedError;

  /// Create a copy of ReceiptEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiptEntityCopyWith<ReceiptEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptEntityCopyWith<$Res> {
  factory $ReceiptEntityCopyWith(
          ReceiptEntity value, $Res Function(ReceiptEntity) then) =
      _$ReceiptEntityCopyWithImpl<$Res, ReceiptEntity>;
  @useResult
  $Res call({List<ProductModel> products});
}

/// @nodoc
class _$ReceiptEntityCopyWithImpl<$Res, $Val extends ReceiptEntity>
    implements $ReceiptEntityCopyWith<$Res> {
  _$ReceiptEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceiptEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiptEntityImplCopyWith<$Res>
    implements $ReceiptEntityCopyWith<$Res> {
  factory _$$ReceiptEntityImplCopyWith(
          _$ReceiptEntityImpl value, $Res Function(_$ReceiptEntityImpl) then) =
      __$$ReceiptEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductModel> products});
}

/// @nodoc
class __$$ReceiptEntityImplCopyWithImpl<$Res>
    extends _$ReceiptEntityCopyWithImpl<$Res, _$ReceiptEntityImpl>
    implements _$$ReceiptEntityImplCopyWith<$Res> {
  __$$ReceiptEntityImplCopyWithImpl(
      _$ReceiptEntityImpl _value, $Res Function(_$ReceiptEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$ReceiptEntityImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc

class _$ReceiptEntityImpl extends _ReceiptEntity {
  const _$ReceiptEntityImpl({required final List<ProductModel> products})
      : _products = products,
        super._();

  final List<ProductModel> _products;
  @override
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ReceiptEntity(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptEntityImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  /// Create a copy of ReceiptEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptEntityImplCopyWith<_$ReceiptEntityImpl> get copyWith =>
      __$$ReceiptEntityImplCopyWithImpl<_$ReceiptEntityImpl>(this, _$identity);
}

abstract class _ReceiptEntity extends ReceiptEntity {
  const factory _ReceiptEntity({required final List<ProductModel> products}) =
      _$ReceiptEntityImpl;
  const _ReceiptEntity._() : super._();

  @override
  List<ProductModel> get products;

  /// Create a copy of ReceiptEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptEntityImplCopyWith<_$ReceiptEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
