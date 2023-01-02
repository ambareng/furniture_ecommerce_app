// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      id: json['id'] as int,
      label: json['label'] as String,
      full_address: json['full_address'] as String,
      postal_code: json['postal_code'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
      region: json['region'] as String,
      is_default: json['is_default'] as bool,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'full_address': instance.full_address,
      'postal_code': instance.postal_code,
      'country': instance.country,
      'city': instance.city,
      'region': instance.region,
      'is_default': instance.is_default,
    };
