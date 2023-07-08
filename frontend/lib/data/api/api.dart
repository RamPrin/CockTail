import 'dart:convert';

import 'package:capstone/data/api/api_consts.dart';
import 'package:capstone/data/api/api_models/mixup_result_request_model.dart';
import 'package:capstone/data/api/api_models/pick_up_result_request.dart';
import 'package:capstone/data/api/dio.dart';
import 'package:capstone/domain/cocktail.dart';
import 'package:capstone/domain/ingredient.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Api {
  Api(this.dio);

  final Dio dio;

  Future<List<Ingredient>> getIngredients() async {
    final resp = (await dio.get(ApiConsts.muxUp));
    final json = resp.data;

    return (json['ingredients'] as Iterable<dynamic>)
        .map((e) => Ingredient(name: e as String))
        .toList();
  }

  Future<Cocktail> mixUpCocktail(MixUpResultRequest request) async {
    final resp = (await dio.post(ApiConsts.muxUpResult,
        data: jsonEncode(request.toJson())));
    final json = resp.data;

    return Cocktail.fromJson(json['cocktails'][0]);
  }

    Future<Cocktail> pickUpCocktail(PickUpResultRequest request) async {
    final resp = (await dio.post(ApiConsts.muxUpResult,
        data: jsonEncode(request.toJson())));
    final json = resp.data;

    return Cocktail.fromJson(json['cocktails'][0]);
  }
}

final apiProvider = Provider<Api>((ref) {
  return Api(ref.read(dioProvider));
});
