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
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorToJson(_$Error instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$Data _$$DataFromJson(Map<String, dynamic> json) => _$Data(
      items: (json['items'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      included: (json['included'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>)),
      excluded: (json['excluded'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DataToJson(_$Data instance) => <String, dynamic>{
      'items': instance.items,
      'included': instance.included.toList(),
      'excluded': instance.excluded.toList(),
      'runtimeType': instance.$type,
    };
