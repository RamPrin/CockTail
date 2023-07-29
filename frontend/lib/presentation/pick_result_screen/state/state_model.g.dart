// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Loading _$$LoadingFromJson(Map<String, dynamic> json) => _$Loading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadingToJson(_$Loading instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$Error _$$ErrorFromJson(Map<String, dynamic> json) => _$Error(
      errorReason: $enumDecodeNullable(
              _$PickResultErrorReasonEnumMap, json['errorReason']) ??
          PickResultErrorReason.serverError,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorToJson(_$Error instance) => <String, dynamic>{
      'errorReason': _$PickResultErrorReasonEnumMap[instance.errorReason]!,
      'runtimeType': instance.$type,
    };

const _$PickResultErrorReasonEnumMap = {
  PickResultErrorReason.nothingFound: 'nothingFound',
  PickResultErrorReason.serverError: 'serverError',
};

_$Data _$$DataFromJson(Map<String, dynamic> json) => _$Data(
      cocktail: Cocktail.fromJson(json['cocktail'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DataToJson(_$Data instance) => <String, dynamic>{
      'cocktail': instance.cocktail,
      'runtimeType': instance.$type,
    };
