import 'package:freezed_annotation/freezed_annotation.dart';

part 'promo.freezed.dart';
part 'promo.g.dart';

@freezed
class Promo with _$Promo {
  factory Promo(
      {required int id,
      required String name,
      required double discount}) = _Promo;

  factory Promo.fromJson(Map<String, Object?> json) => _$PromoFromJson(json);
}
