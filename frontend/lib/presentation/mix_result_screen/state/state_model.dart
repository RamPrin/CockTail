// ignore_for_file: invalid_annotation_target
import 'package:capstone/domain/cocktail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_model.freezed.dart';
part 'state_model.g.dart';

@freezed
sealed class MixResultState with _$MixResultState {
  factory MixResultState.loading() = Loading;
  factory MixResultState.error() = Error;
  factory MixResultState.data({
    required Cocktail cocktail,
  }) = Data;

  factory MixResultState.fromJson(Map<String, dynamic> json) =>_$MixResultStateFromJson(json);
}