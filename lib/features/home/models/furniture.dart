import 'package:freezed_annotation/freezed_annotation.dart';

part 'furniture.freezed.dart';
part 'furniture.g.dart';

@freezed
class Furniture with _$Furniture {
  factory Furniture(
      {required int id,
      required String name,
      required double price,
      required String imageURL,
      required bool isBookmarked}) = _Furniture;

  factory Furniture.fromJson(Map<String, Object?> json) =>
      _$FurnitureFromJson(json);
}
