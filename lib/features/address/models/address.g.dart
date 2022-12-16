// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      id: json['id'] as int,
      label: json['label'] as String,
      fullAddress: json['fullAddress'] as String,
      postalCode: json['postalCode'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
      region: json['region'] as String,
      isDefault: json['isDefault'] as bool,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'fullAddress': instance.fullAddress,
      'postalCode': instance.postalCode,
      'country': instance.country,
      'city': instance.city,
      'region': instance.region,
      'isDefault': instance.isDefault,
    };
