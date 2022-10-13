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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FurnitureCopyWith<Furniture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FurnitureCopyWith<$Res> {
  factory $FurnitureCopyWith(Furniture value, $Res Function(Furniture) then) =
      _$FurnitureCopyWithImpl<$Res>;
  $Res call({int id, String name, double price, String imageURL});
}

/// @nodoc
class _$FurnitureCopyWithImpl<$Res> implements $FurnitureCopyWith<$Res> {
  _$FurnitureCopyWithImpl(this._value, this._then);

  final Furniture _value;
  // ignore: unused_field
  final $Res Function(Furniture) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? imageURL = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FurnitureCopyWith<$Res> implements $FurnitureCopyWith<$Res> {
  factory _$$_FurnitureCopyWith(
          _$_Furniture value, $Res Function(_$_Furniture) then) =
      __$$_FurnitureCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, double price, String imageURL});
}

/// @nodoc
class __$$_FurnitureCopyWithImpl<$Res> extends _$FurnitureCopyWithImpl<$Res>
    implements _$$_FurnitureCopyWith<$Res> {
  __$$_FurnitureCopyWithImpl(
      _$_Furniture _value, $Res Function(_$_Furniture) _then)
      : super(_value, (v) => _then(v as _$_Furniture));

  @override
  _$_Furniture get _value => super._value as _$_Furniture;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? imageURL = freezed,
  }) {
    return _then(_$_Furniture(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
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
      required this.imageURL});

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
  String toString() {
    return 'Furniture(id: $id, name: $name, price: $price, imageURL: $imageURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Furniture &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.imageURL, imageURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(imageURL));

  @JsonKey(ignore: true)
  @override
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
      required final String imageURL}) = _$_Furniture;

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
  @JsonKey(ignore: true)
  _$$_FurnitureCopyWith<_$_Furniture> get copyWith =>
      throw _privateConstructorUsedError;
}
