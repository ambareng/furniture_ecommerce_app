// GENERATED CODE - DO NOT MODIFY BY HAND

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
      holder: json['holder'] as String,
      is_default: json['is_default'] as bool,
    );

Map<String, dynamic> _$$_CreditCardToJson(_$_CreditCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'masked_number': instance.masked_number,
      'expiry_date': instance.expiry_date.toIso8601String(),
      'cvv': instance.cvv,
      'holder': instance.holder,
      'is_default': instance.is_default,
    };
