// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
class Ingredient with _$Ingredient {
  factory Ingredient({
    required String name,
  }) = _Ingredient;

  @override
  bool operator ==(Object other) =>
      other is Ingredient &&
      other.runtimeType == runtimeType &&
      other.name == name;

  @override
  int get hashCode => name.hashCode;

  bool followsQuery(String query) {
    return name
        .trim()
        .toLowerCase()
        .replaceAll(" ", "")
        .contains(query.trim().toLowerCase().replaceAll(" ", ""));
  }

  const Ingredient._();

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}
