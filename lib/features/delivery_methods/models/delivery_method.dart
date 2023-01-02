// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_method.freezed.dart';
part 'delivery_method.g.dart';

@freezed
class DeliveryMethod with _$DeliveryMethod {
  factory DeliveryMethod(
      {required int id,
      required String name,
      required double price}) = _DeliveryMethod;

  factory DeliveryMethod.fromJson(Map<String, Object?> json) =>
      _$DeliveryMethodFromJson(json);
}
