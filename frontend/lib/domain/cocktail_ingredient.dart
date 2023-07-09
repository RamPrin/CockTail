// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cocktail_ingredient.freezed.dart';
part 'cocktail_ingredient.g.dart';

@freezed
class CocktailIngredient with _$CocktailIngredient {
  factory CocktailIngredient({
    @JsonKey(fromJson: double.parse) required double amount,
    required String measure,
    required String name,
  }) = _CocktailIngredient;

  factory CocktailIngredient.fromJson(Map<String, dynamic> json) =>
      _$CocktailIngredientFromJson(json);
}
