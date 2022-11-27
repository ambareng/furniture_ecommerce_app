// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'furniture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Furniture _$FurnitureFromJson(Map<String, dynamic> json) {
  return _Furniture.fromJson(json);
}

/// @nodoc
mixin _$Furniture {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;
  bool get isBookmarked => throw _privateConstructorUsedError;
  bool get isAddedToCart => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FurnitureCopyWith<Furniture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FurnitureCopyWith<$Res> {
  factory $FurnitureCopyWith(Furniture value, $Res Function(Furniture) then) =
      _$FurnitureCopyWithImpl<$Res, Furniture>;
  @useResult
  $Res call(
      {int id,
      String name,
      double price,
      String imageURL,
      bool isBookmarked,
      bool isAddedToCart,
      int quantity});
}

/// @nodoc
class _$FurnitureCopyWithImpl<$Res, $Val extends Furniture>
    implements $FurnitureCopyWith<$Res> {
  _$FurnitureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? imageURL = null,
    Object? isBookmarked = null,
    Object? isAddedToCart = null,
    Object? quantity = null,
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
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddedToCart: null == isAddedToCart
          ? _value.isAddedToCart
          : isAddedToCart // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FurnitureCopyWith<$Res> implements $FurnitureCopyWith<$Res> {
  factory _$$_FurnitureCopyWith(
          _$_Furniture value, $Res Function(_$_Furniture) then) =
      __$$_FurnitureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      double price,
      String imageURL,
      bool isBookmarked,
      bool isAddedToCart,
      int quantity});
}

/// @nodoc
class __$$_FurnitureCopyWithImpl<$Res>
    extends _$FurnitureCopyWithImpl<$Res, _$_Furniture>
    implements _$$_FurnitureCopyWith<$Res> {
  __$$_FurnitureCopyWithImpl(
      _$_Furniture _value, $Res Function(_$_Furniture) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? imageURL = null,
    Object? isBookmarked = null,
    Object? isAddedToCart = null,
    Object? quantity = null,
  }) {
    return _then(_$_Furniture(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      isBookmarked: null == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddedToCart: null == isAddedToCart
          ? _value.isAddedToCart
          : isAddedToCart // ignore: cast_nullable_to_non_nullable
              as bool,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Furniture implements _Furniture {
  _$_Furniture(
      {required this.id,
      required this.name,
      required this.price,
      required this.imageURL,
      this.isBookmarked = false,
      this.isAddedToCart = false,
      this.quantity = 0});

  factory _$_Furniture.fromJson(Map<String, dynamic> json) =>
      _$$_FurnitureFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double price;
  @override
  final String imageURL;
  @override
  @JsonKey()
  final bool isBookmarked;
  @override
  @JsonKey()
  final bool isAddedToCart;
  @override
  @JsonKey()
  final int quantity;

  @override
  String toString() {
    return 'Furniture(id: $id, name: $name, price: $price, imageURL: $imageURL, isBookmarked: $isBookmarked, isAddedToCart: $isAddedToCart, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Furniture &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
            (identical(other.isAddedToCart, isAddedToCart) ||
                other.isAddedToCart == isAddedToCart) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, imageURL,
      isBookmarked, isAddedToCart, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FurnitureCopyWith<_$_Furniture> get copyWith =>
      __$$_FurnitureCopyWithImpl<_$_Furniture>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FurnitureToJson(
      this,
    );
  }
}

abstract class _Furniture implements Furniture {
  factory _Furniture(
      {required final int id,
      required final String name,
      required final double price,
      required final String imageURL,
      final bool isBookmarked,
      final bool isAddedToCart,
      final int quantity}) = _$_Furniture;

  factory _Furniture.fromJson(Map<String, dynamic> json) =
      _$_Furniture.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double get price;
  @override
  String get imageURL;
  @override
  bool get isBookmarked;
  @override
  bool get isAddedToCart;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_FurnitureCopyWith<_$_Furniture> get copyWith =>
      throw _privateConstructorUsedError;
}
