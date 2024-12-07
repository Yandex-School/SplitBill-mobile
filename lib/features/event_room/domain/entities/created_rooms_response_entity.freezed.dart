// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'created_rooms_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreatedRoomsResponseEntity {
  List<CreatedRoomsResponseItemsEntity> get items =>
      throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get totalPage => throw _privateConstructorUsedError;

  /// Create a copy of CreatedRoomsResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatedRoomsResponseEntityCopyWith<CreatedRoomsResponseEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedRoomsResponseEntityCopyWith<$Res> {
  factory $CreatedRoomsResponseEntityCopyWith(CreatedRoomsResponseEntity value,
          $Res Function(CreatedRoomsResponseEntity) then) =
      _$CreatedRoomsResponseEntityCopyWithImpl<$Res,
          CreatedRoomsResponseEntity>;
  @useResult
  $Res call(
      {List<CreatedRoomsResponseItemsEntity> items,
      int page,
      int limit,
      int totalCount,
      int totalPage});
}

/// @nodoc
class _$CreatedRoomsResponseEntityCopyWithImpl<$Res,
        $Val extends CreatedRoomsResponseEntity>
    implements $CreatedRoomsResponseEntityCopyWith<$Res> {
  _$CreatedRoomsResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatedRoomsResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? limit = null,
    Object? totalCount = null,
    Object? totalPage = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CreatedRoomsResponseItemsEntity>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatedRoomsResponseEntityImplCopyWith<$Res>
    implements $CreatedRoomsResponseEntityCopyWith<$Res> {
  factory _$$CreatedRoomsResponseEntityImplCopyWith(
          _$CreatedRoomsResponseEntityImpl value,
          $Res Function(_$CreatedRoomsResponseEntityImpl) then) =
      __$$CreatedRoomsResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CreatedRoomsResponseItemsEntity> items,
      int page,
      int limit,
      int totalCount,
      int totalPage});
}

/// @nodoc
class __$$CreatedRoomsResponseEntityImplCopyWithImpl<$Res>
    extends _$CreatedRoomsResponseEntityCopyWithImpl<$Res,
        _$CreatedRoomsResponseEntityImpl>
    implements _$$CreatedRoomsResponseEntityImplCopyWith<$Res> {
  __$$CreatedRoomsResponseEntityImplCopyWithImpl(
      _$CreatedRoomsResponseEntityImpl _value,
      $Res Function(_$CreatedRoomsResponseEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatedRoomsResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? limit = null,
    Object? totalCount = null,
    Object? totalPage = null,
  }) {
    return _then(_$CreatedRoomsResponseEntityImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CreatedRoomsResponseItemsEntity>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CreatedRoomsResponseEntityImpl extends _CreatedRoomsResponseEntity {
  _$CreatedRoomsResponseEntityImpl(
      {required final List<CreatedRoomsResponseItemsEntity> items,
      required this.page,
      required this.limit,
      required this.totalCount,
      required this.totalPage})
      : _items = items,
        super._();

  final List<CreatedRoomsResponseItemsEntity> _items;
  @override
  List<CreatedRoomsResponseItemsEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int page;
  @override
  final int limit;
  @override
  final int totalCount;
  @override
  final int totalPage;

  @override
  String toString() {
    return 'CreatedRoomsResponseEntity(items: $items, page: $page, limit: $limit, totalCount: $totalCount, totalPage: $totalPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedRoomsResponseEntityImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      page,
      limit,
      totalCount,
      totalPage);

  /// Create a copy of CreatedRoomsResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatedRoomsResponseEntityImplCopyWith<_$CreatedRoomsResponseEntityImpl>
      get copyWith => __$$CreatedRoomsResponseEntityImplCopyWithImpl<
          _$CreatedRoomsResponseEntityImpl>(this, _$identity);
}

abstract class _CreatedRoomsResponseEntity extends CreatedRoomsResponseEntity {
  factory _CreatedRoomsResponseEntity(
      {required final List<CreatedRoomsResponseItemsEntity> items,
      required final int page,
      required final int limit,
      required final int totalCount,
      required final int totalPage}) = _$CreatedRoomsResponseEntityImpl;
  _CreatedRoomsResponseEntity._() : super._();

  @override
  List<CreatedRoomsResponseItemsEntity> get items;
  @override
  int get page;
  @override
  int get limit;
  @override
  int get totalCount;
  @override
  int get totalPage;

  /// Create a copy of CreatedRoomsResponseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatedRoomsResponseEntityImplCopyWith<_$CreatedRoomsResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreatedRoomsResponseItemsEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;

  /// Create a copy of CreatedRoomsResponseItemsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatedRoomsResponseItemsEntityCopyWith<CreatedRoomsResponseItemsEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedRoomsResponseItemsEntityCopyWith<$Res> {
  factory $CreatedRoomsResponseItemsEntityCopyWith(
          CreatedRoomsResponseItemsEntity value,
          $Res Function(CreatedRoomsResponseItemsEntity) then) =
      _$CreatedRoomsResponseItemsEntityCopyWithImpl<$Res,
          CreatedRoomsResponseItemsEntity>;
  @useResult
  $Res call({int id, String name, int userId});
}

/// @nodoc
class _$CreatedRoomsResponseItemsEntityCopyWithImpl<$Res,
        $Val extends CreatedRoomsResponseItemsEntity>
    implements $CreatedRoomsResponseItemsEntityCopyWith<$Res> {
  _$CreatedRoomsResponseItemsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatedRoomsResponseItemsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatedRoomsResponseItemsEntityImplCopyWith<$Res>
    implements $CreatedRoomsResponseItemsEntityCopyWith<$Res> {
  factory _$$CreatedRoomsResponseItemsEntityImplCopyWith(
          _$CreatedRoomsResponseItemsEntityImpl value,
          $Res Function(_$CreatedRoomsResponseItemsEntityImpl) then) =
      __$$CreatedRoomsResponseItemsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int userId});
}

/// @nodoc
class __$$CreatedRoomsResponseItemsEntityImplCopyWithImpl<$Res>
    extends _$CreatedRoomsResponseItemsEntityCopyWithImpl<$Res,
        _$CreatedRoomsResponseItemsEntityImpl>
    implements _$$CreatedRoomsResponseItemsEntityImplCopyWith<$Res> {
  __$$CreatedRoomsResponseItemsEntityImplCopyWithImpl(
      _$CreatedRoomsResponseItemsEntityImpl _value,
      $Res Function(_$CreatedRoomsResponseItemsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatedRoomsResponseItemsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userId = null,
  }) {
    return _then(_$CreatedRoomsResponseItemsEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CreatedRoomsResponseItemsEntityImpl
    extends _CreatedRoomsResponseItemsEntity {
  _$CreatedRoomsResponseItemsEntityImpl(
      {required this.id, required this.name, required this.userId})
      : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final int userId;

  @override
  String toString() {
    return 'CreatedRoomsResponseItemsEntity(id: $id, name: $name, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedRoomsResponseItemsEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, userId);

  /// Create a copy of CreatedRoomsResponseItemsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatedRoomsResponseItemsEntityImplCopyWith<
          _$CreatedRoomsResponseItemsEntityImpl>
      get copyWith => __$$CreatedRoomsResponseItemsEntityImplCopyWithImpl<
          _$CreatedRoomsResponseItemsEntityImpl>(this, _$identity);
}

abstract class _CreatedRoomsResponseItemsEntity
    extends CreatedRoomsResponseItemsEntity {
  factory _CreatedRoomsResponseItemsEntity(
      {required final int id,
      required final String name,
      required final int userId}) = _$CreatedRoomsResponseItemsEntityImpl;
  _CreatedRoomsResponseItemsEntity._() : super._();

  @override
  int get id;
  @override
  String get name;
  @override
  int get userId;

  /// Create a copy of CreatedRoomsResponseItemsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatedRoomsResponseItemsEntityImplCopyWith<
          _$CreatedRoomsResponseItemsEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
