// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'furniture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Furniture _$$_FurnitureFromJson(Map<String, dynamic> json) => _$_Furniture(
      id: json['id'] as int,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      imageURL: json['imageURL'] as String,
      isBookmarked: json['isBookmarked'] as bool? ?? false,
      isAddedToCart: json['isAddedToCart'] as bool? ?? false,
      quantity: json['quantity'] as int? ?? 0,
    );

Map<String, dynamic> _$$_FurnitureToJson(_$_Furniture instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'imageURL': instance.imageURL,
      'isBookmarked': instance.isBookmarked,
      'isAddedToCart': instance.isAddedToCart,
      'quantity': instance.quantity,
    };
