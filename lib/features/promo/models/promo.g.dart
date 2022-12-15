// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Promo _$$_PromoFromJson(Map<String, dynamic> json) => _$_Promo(
      id: json['id'] as int,
      name: json['name'] as String,
      discount: (json['discount'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PromoToJson(_$_Promo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'discount': instance.discount,
    };
