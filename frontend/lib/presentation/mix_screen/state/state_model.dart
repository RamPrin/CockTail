// ignore_for_file: invalid_annotation_target
import 'package:capstone/domain/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_model.freezed.dart';
part 'state_model.g.dart';

@freezed
sealed class MixScreenState with _$MixScreenState {
  factory MixScreenState.loading() = Loading;
  factory MixScreenState.error() = Error;
  factory MixScreenState.data({
    required List<Ingredient> items,
    required Iterable<Ingredient> included,
    required Iterable<Ingredient> excluded,
  }) = Data;

  factory MixScreenState.fromJson(Map<String, dynamic> json) =>_$MixScreenStateFromJson(json);
}