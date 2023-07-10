// ignore_for_file: invalid_annotation_target
import 'package:capstone/domain/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
sealed class TopScreenState with _$TopScreenState {
  factory TopScreenState.loading() = Loading;
  factory TopScreenState.error() = Error;
  factory TopScreenState.data({
    required List<Cocktail> cocktails,
    @Default({}) Map<int, Image> images,
  }) = Data;
}
