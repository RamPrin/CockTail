// ignore_for_file: invalid_annotation_target
import 'package:capstone/domain/cocktail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_model.freezed.dart';
part 'state_model.g.dart';

@freezed
sealed class PickResultState with _$PickResultState {
  factory PickResultState.loading() = Loading;
  factory PickResultState.error() = Error;
  factory PickResultState.data({
    required Cocktail cocktail,
  }) = Data;

  factory PickResultState.fromJson(Map<String, dynamic> json) =>_$PickResultStateFromJson(json);
}