// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mixup_result_request_model.freezed.dart';
part 'mixup_result_request_model.g.dart';

@freezed
class MixUpResultRequest with _$MixUpResultRequest {
  factory MixUpResultRequest({
    @Default([]) List<String> include, 
    @Default([]) List<String> exclude, 
  }) = _MixUpResultRequest;

  factory MixUpResultRequest.fromJson(Map<String, dynamic> json) =>_$MixUpResultRequestFromJson(json);
}