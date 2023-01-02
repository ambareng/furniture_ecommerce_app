// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card.freezed.dart';
part 'credit_card.g.dart';

@freezed
class CreditCard with _$CreditCard {
  factory CreditCard({
    required int id,
    required String token,
    required String masked_number,
    required DateTime expiry_date,
    required String cvv,
    required String holder_name,
    required bool is_default,
    required String brand,
  }) = _CreditCard;

  factory CreditCard.fromJson(Map<String, Object?> json) =>
      _$CreditCardFromJson(json);
}
