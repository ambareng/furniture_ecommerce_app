// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'credit_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreditCard _$$_CreditCardFromJson(Map<String, dynamic> json) =>
    _$_CreditCard(
      id: json['id'] as int,
      token: json['token'] as String,
      masked_number: json['masked_number'] as String,
      expiry_date: DateTime.parse(json['expiry_date'] as String),
      cvv: json['cvv'] as String,
      holder_name: json['holder_name'] as String,
      is_default: json['is_default'] as bool,
      brand: json['brand'] as String,
    );

Map<String, dynamic> _$$_CreditCardToJson(_$_CreditCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'masked_number': instance.masked_number,
      'expiry_date': instance.expiry_date.toIso8601String(),
      'cvv': instance.cvv,
      'holder_name': instance.holder_name,
      'is_default': instance.is_default,
      'brand': instance.brand,
    };
