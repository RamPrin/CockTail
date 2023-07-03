// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mixup_result_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MixUpResultRequest _$$_MixUpResultRequestFromJson(
        Map<String, dynamic> json) =>
    _$_MixUpResultRequest(
      include: (json['include'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      exclude: (json['exclude'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_MixUpResultRequestToJson(
        _$_MixUpResultRequest instance) =>
    <String, dynamic>{
      'include': instance.include,
      'exclude': instance.exclude,
    };
