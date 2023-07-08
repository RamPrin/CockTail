// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pick_up_result_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PickUpResultRequest _$$_PickUpResultRequestFromJson(
        Map<String, dynamic> json) =>
    _$_PickUpResultRequest(
      alcoolFree: json['alcohol_free'] as bool,
      minAlc: (json['min_alc'] as num).toDouble(),
      maxAlc: (json['max_alc'] as num).toDouble(),
      sweet: json['sweet'] as int,
      sour: json['sour'] as int,
      savory: json['savory'] as int,
      bitter: json['bitter'] as int,
      cream: json['cream'] as bool,
      spicy: json['spicy'] as bool,
      fruity: json['fruity'] as bool,
    );

Map<String, dynamic> _$$_PickUpResultRequestToJson(
        _$_PickUpResultRequest instance) =>
    <String, dynamic>{
      'alcohol_free': instance.alcoolFree,
      'min_alc': instance.minAlc,
      'max_alc': instance.maxAlc,
      'sweet': instance.sweet,
      'sour': instance.sour,
      'savory': instance.savory,
      'bitter': instance.bitter,
      'cream': instance.cream,
      'spicy': instance.spicy,
      'fruity': instance.fruity,
    };
