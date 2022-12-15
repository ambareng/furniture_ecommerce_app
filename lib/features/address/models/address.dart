import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  factory Address({
    required int id,
    required String label,
    required String fullAddress,
    required String postalCode,
    required String country,
    required String city,
    required String region,
    required bool isDefault,
  }) = _Address;

  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);
}
