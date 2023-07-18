import 'dart:convert';

import 'package:capstone/data/api/api_consts.dart';
import 'package:capstone/data/api/api_models/mixup_result_request_model.dart';
import 'package:capstone/data/api/api_models/pick_up_result_request.dart';
import 'package:capstone/data/api/dio.dart';
import 'package:capstone/domain/cocktail.dart';
import 'package:capstone/domain/ingredient.dart';
import 'package:capstone/presentation/pick_result_screen/state/state_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
    final resp = (await dio.post(
      ApiConsts.muxUpResult,
      data: jsonEncode(request.toJson()),
    ));
    final json = resp.data;

    return Cocktail.fromJson(json);
  }

  Future<Cocktail> pickUpCocktail(PickUpResultRequest request) async {
    final resp = (await dio.post(
      ApiConsts.pickUpResult,
      data: jsonEncode(request.toJson()),
    ));

    if (resp.statusCode == 404) {
      print("404");
      throw PickResultErrorReason.nothingFound;
    }
    final json = resp.data;
    return Cocktail.fromJson(json);
  }

  Future<List<Cocktail>> getTopCocktails() async {
    final resp = (await dio.get(ApiConsts.top));
    final json = resp.data;

    return (json['cocktails'] as Iterable<dynamic>)
        .map((e) => Cocktail.fromJson(e))
        .toList();
  }

  Future<Image> getTopCocktailImage(int id) async {
    final resp = (await dio.get("${ApiConsts.top}/$id",
        options: Options(receiveTimeout: const Duration(seconds: 10))));
    final json = resp.data;

    final img = compute<String, Image>(
        (message) => Image.memory(base64Decode(message)), json['img']);

    return img;
  }
}

final apiProvider = Provider<Api>((ref) {
  return Api(ref.read(dioProvider));
});
