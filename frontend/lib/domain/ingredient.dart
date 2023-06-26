// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
class Ingredient with _$Ingredient {
  factory Ingredient({
    required String name,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>_$IngredientFromJson(json);
}