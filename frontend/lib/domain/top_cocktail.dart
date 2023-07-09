// ignore_for_file: invalid_annotation_target
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_cocktail.freezed.dart';
part 'top_cocktail.g.dart';

@freezed
class TopCocktail with _$TopCocktail {
  factory TopCocktail(
      {required String title,
      required String garnish,
      required String recipe,
      @JsonKey(fromJson: TopCocktail.decodeIngredients)
      required List<List<String>> ingredients,
      @JsonKey(name: "image_link") required String image}) = _TopCocktail;

  factory TopCocktail.fromJson(Map<String, dynamic> json) =>
      _$TopCocktailFromJson(json);

  static List<List<String>> decodeIngredients(dynamic json) {
    final m = (json as String).replaceAll('\'', '"');
    print(m);
    final j = jsonDecode(m);
    return (j as Iterable<dynamic>)
        .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
        .toList();
  }
}
