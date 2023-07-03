// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cocktail_ingredient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CocktailIngredient _$CocktailIngredientFromJson(Map<String, dynamic> json) {
  return _CocktailIngredient.fromJson(json);
}

/// @nodoc
mixin _$CocktailIngredient {
  double get amount => throw _privateConstructorUsedError;
  String get measure => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CocktailIngredientCopyWith<CocktailIngredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CocktailIngredientCopyWith<$Res> {
  factory $CocktailIngredientCopyWith(
          CocktailIngredient value, $Res Function(CocktailIngredient) then) =
      _$CocktailIngredientCopyWithImpl<$Res, CocktailIngredient>;
  @useResult
  $Res call({double amount, String measure, String name});
}

/// @nodoc
class _$CocktailIngredientCopyWithImpl<$Res, $Val extends CocktailIngredient>
    implements $CocktailIngredientCopyWith<$Res> {
  _$CocktailIngredientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? measure = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      measure: null == measure
          ? _value.measure
          : measure // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CocktailIngredientCopyWith<$Res>
    implements $CocktailIngredientCopyWith<$Res> {
  factory _$$_CocktailIngredientCopyWith(_$_CocktailIngredient value,
          $Res Function(_$_CocktailIngredient) then) =
      __$$_CocktailIngredientCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, String measure, String name});
}

/// @nodoc
class __$$_CocktailIngredientCopyWithImpl<$Res>
    extends _$CocktailIngredientCopyWithImpl<$Res, _$_CocktailIngredient>
    implements _$$_CocktailIngredientCopyWith<$Res> {
  __$$_CocktailIngredientCopyWithImpl(
      _$_CocktailIngredient _value, $Res Function(_$_CocktailIngredient) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? measure = null,
    Object? name = null,
  }) {
    return _then(_$_CocktailIngredient(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      measure: null == measure
          ? _value.measure
          : measure // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CocktailIngredient implements _CocktailIngredient {
  _$_CocktailIngredient(
      {required this.amount, required this.measure, required this.name});

  factory _$_CocktailIngredient.fromJson(Map<String, dynamic> json) =>
      _$$_CocktailIngredientFromJson(json);

  @override
  final double amount;
  @override
  final String measure;
  @override
  final String name;

  @override
  String toString() {
    return 'CocktailIngredient(amount: $amount, measure: $measure, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CocktailIngredient &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.measure, measure) || other.measure == measure) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, measure, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CocktailIngredientCopyWith<_$_CocktailIngredient> get copyWith =>
      __$$_CocktailIngredientCopyWithImpl<_$_CocktailIngredient>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CocktailIngredientToJson(
      this,
    );
  }
}

abstract class _CocktailIngredient implements CocktailIngredient {
  factory _CocktailIngredient(
      {required final double amount,
      required final String measure,
      required final String name}) = _$_CocktailIngredient;

  factory _CocktailIngredient.fromJson(Map<String, dynamic> json) =
      _$_CocktailIngredient.fromJson;

  @override
  double get amount;
  @override
  String get measure;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_CocktailIngredientCopyWith<_$_CocktailIngredient> get copyWith =>
      throw _privateConstructorUsedError;
}
