// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CocktailIngredient _$$_CocktailIngredientFromJson(
        Map<String, dynamic> json) =>
    _$_CocktailIngredient(
      amount: double.parse(json['amount'] as String),
      measure: json['measure'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_CocktailIngredientToJson(
        _$_CocktailIngredient instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'measure': instance.measure,
      'name': instance.name,
    };
