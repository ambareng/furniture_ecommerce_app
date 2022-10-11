// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'furniture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Furniture _$$_FurnitureFromJson(Map<String, dynamic> json) => _$_Furniture(
      id: json['id'] as int,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$_FurnitureToJson(_$_Furniture instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
