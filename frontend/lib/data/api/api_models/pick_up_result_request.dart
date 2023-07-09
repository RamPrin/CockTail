// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pick_up_result_request.freezed.dart';
part 'pick_up_result_request.g.dart';

@freezed
class PickUpResultRequest with _$PickUpResultRequest {
  factory PickUpResultRequest({
    @JsonKey(name: "alcohol_free") required bool alcoolFree,
    @JsonKey(name: "min_alc") required double minAlc,
    @JsonKey(name: "max_alc") required double maxAlc,
    required int sweet,
    required int sour,
    required int savory,
    required int bitter,
    required bool cream,
    required bool spicy,
    required bool fruity,
  }) = _PickUpResultRequest;

  factory PickUpResultRequest.fromJson(Map<String, dynamic> json) =>_$PickUpResultRequestFromJson(json);
}