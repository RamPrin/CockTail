// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cocktail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cocktail _$CocktailFromJson(Map<String, dynamic> json) {
  return _Cocktail.fromJson(json);
}

/// @nodoc
mixin _$Cocktail {
  String get name => throw _privateConstructorUsedError;
  List<CocktailIngredient> get ingredients =>
      throw _privateConstructorUsedError;
  String get recipe => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CocktailCopyWith<Cocktail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CocktailCopyWith<$Res> {
  factory $CocktailCopyWith(Cocktail value, $Res Function(Cocktail) then) =
      _$CocktailCopyWithImpl<$Res, Cocktail>;
  @useResult
  $Res call({String name, List<CocktailIngredient> ingredients, String recipe});
}

/// @nodoc
class _$CocktailCopyWithImpl<$Res, $Val extends Cocktail>
    implements $CocktailCopyWith<$Res> {
  _$CocktailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ingredients = null,
    Object? recipe = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<CocktailIngredient>,
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CocktailCopyWith<$Res> implements $CocktailCopyWith<$Res> {
  factory _$$_CocktailCopyWith(
          _$_Cocktail value, $Res Function(_$_Cocktail) then) =
      __$$_CocktailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<CocktailIngredient> ingredients, String recipe});
}

/// @nodoc
class __$$_CocktailCopyWithImpl<$Res>
    extends _$CocktailCopyWithImpl<$Res, _$_Cocktail>
    implements _$$_CocktailCopyWith<$Res> {
  __$$_CocktailCopyWithImpl(
      _$_Cocktail _value, $Res Function(_$_Cocktail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ingredients = null,
    Object? recipe = null,
  }) {
    return _then(_$_Cocktail(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<CocktailIngredient>,
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cocktail implements _Cocktail {
  _$_Cocktail(
      {required this.name,
      required final List<CocktailIngredient> ingredients,
      required this.recipe})
      : _ingredients = ingredients;

  factory _$_Cocktail.fromJson(Map<String, dynamic> json) =>
      _$$_CocktailFromJson(json);

  @override
  final String name;
  final List<CocktailIngredient> _ingredients;
  @override
  List<CocktailIngredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  final String recipe;

  @override
  String toString() {
    return 'Cocktail(name: $name, ingredients: $ingredients, recipe: $recipe)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cocktail &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.recipe, recipe) || other.recipe == recipe));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name,
      const DeepCollectionEquality().hash(_ingredients), recipe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CocktailCopyWith<_$_Cocktail> get copyWith =>
      __$$_CocktailCopyWithImpl<_$_Cocktail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CocktailToJson(
      this,
    );
  }
}

abstract class _Cocktail implements Cocktail {
  factory _Cocktail(
      {required final String name,
      required final List<CocktailIngredient> ingredients,
      required final String recipe}) = _$_Cocktail;

  factory _Cocktail.fromJson(Map<String, dynamic> json) = _$_Cocktail.fromJson;

  @override
  String get name;
  @override
  List<CocktailIngredient> get ingredients;
  @override
  String get recipe;
  @override
  @JsonKey(ignore: true)
  _$$_CocktailCopyWith<_$_Cocktail> get copyWith =>
      throw _privateConstructorUsedError;
}
