// ignore_for_file: invalid_annotation_target
import 'package:capstone/domain/cocktail_ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cocktail.freezed.dart';
part 'cocktail.g.dart';

@freezed
class Cocktail with _$Cocktail {
  factory Cocktail({
    required String name,
    required List<CocktailIngredient> ingredients,
    required String recipe,
  }) = _Cocktail;

  factory Cocktail.fromJson(Map<String, dynamic> json) =>
      _$CocktailFromJson(json);
}
