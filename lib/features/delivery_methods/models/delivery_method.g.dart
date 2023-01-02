// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'delivery_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryMethod _$$_DeliveryMethodFromJson(Map<String, dynamic> json) =>
    _$_DeliveryMethod(
      id: json['id'] as int,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$_DeliveryMethodToJson(_$_DeliveryMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
