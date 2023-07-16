// ignore_for_file: invalid_annotation_target
import 'dart:convert';

import 'package:capstone/domain/cocktail_ingredient.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cocktail.freezed.dart';
part 'cocktail.g.dart';

@freezed
class Cocktail with _$Cocktail {
  factory Cocktail(
      {required String name,
      required List<CocktailIngredient> ingredients,
      required String recipe,
      @JsonKey(name: "img",fromJson: Cocktail.imageFromJson, toJson: Cocktail.imageToJson)
      Image? image}) = _Cocktail;

  factory Cocktail.fromJson(Map<String, dynamic> json) =>
      _$CocktailFromJson(json);

  static Image? imageFromJson(String? str) {
    if (str == null) return null;
    return Image.memory(base64Decode(str));
  }

  static String imageToJson(Image? img) {
    return "str";
  }
}
