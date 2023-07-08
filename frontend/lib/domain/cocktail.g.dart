// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cocktail _$$_CocktailFromJson(Map<String, dynamic> json) => _$_Cocktail(
      name: json['name'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => CocktailIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      recipe: json['recipe'] as String,
    );

Map<String, dynamic> _$$_CocktailToJson(_$_Cocktail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ingredients': instance.ingredients,
      'recipe': instance.recipe,
    };
