// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_cocktail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TopCocktail _$$_TopCocktailFromJson(Map<String, dynamic> json) =>
    _$_TopCocktail(
      title: json['title'] as String,
      garnish: json['garnish'] as String,
      recipe: json['recipe'] as String,
      ingredients: TopCocktail.decodeIngredients(json['ingredients']),
      image: json['image_link'] as String,
    );

Map<String, dynamic> _$$_TopCocktailToJson(_$_TopCocktail instance) =>
    <String, dynamic>{
      'title': instance.title,
      'garnish': instance.garnish,
      'recipe': instance.recipe,
      'ingredients': instance.ingredients,
      'image_link': instance.image,
    };
