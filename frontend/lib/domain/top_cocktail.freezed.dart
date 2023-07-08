// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_cocktail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopCocktail _$TopCocktailFromJson(Map<String, dynamic> json) {
  return _TopCocktail.fromJson(json);
}

/// @nodoc
mixin _$TopCocktail {
  String get title => throw _privateConstructorUsedError;
  String get garnish => throw _privateConstructorUsedError;
  String get recipe => throw _privateConstructorUsedError;
  @JsonKey(fromJson: TopCocktail.decodeIngredients)
  List<List<String>> get ingredients => throw _privateConstructorUsedError;
  @JsonKey(name: "image_link")
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopCocktailCopyWith<TopCocktail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopCocktailCopyWith<$Res> {
  factory $TopCocktailCopyWith(
          TopCocktail value, $Res Function(TopCocktail) then) =
      _$TopCocktailCopyWithImpl<$Res, TopCocktail>;
  @useResult
  $Res call(
      {String title,
      String garnish,
      String recipe,
      @JsonKey(fromJson: TopCocktail.decodeIngredients)
          List<List<String>> ingredients,
      @JsonKey(name: "image_link")
          String image});
}

/// @nodoc
class _$TopCocktailCopyWithImpl<$Res, $Val extends TopCocktail>
    implements $TopCocktailCopyWith<$Res> {
  _$TopCocktailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? garnish = null,
    Object? recipe = null,
    Object? ingredients = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      garnish: null == garnish
          ? _value.garnish
          : garnish // ignore: cast_nullable_to_non_nullable
              as String,
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TopCocktailCopyWith<$Res>
    implements $TopCocktailCopyWith<$Res> {
  factory _$$_TopCocktailCopyWith(
          _$_TopCocktail value, $Res Function(_$_TopCocktail) then) =
      __$$_TopCocktailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String garnish,
      String recipe,
      @JsonKey(fromJson: TopCocktail.decodeIngredients)
          List<List<String>> ingredients,
      @JsonKey(name: "image_link")
          String image});
}

/// @nodoc
class __$$_TopCocktailCopyWithImpl<$Res>
    extends _$TopCocktailCopyWithImpl<$Res, _$_TopCocktail>
    implements _$$_TopCocktailCopyWith<$Res> {
  __$$_TopCocktailCopyWithImpl(
      _$_TopCocktail _value, $Res Function(_$_TopCocktail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? garnish = null,
    Object? recipe = null,
    Object? ingredients = null,
    Object? image = null,
  }) {
    return _then(_$_TopCocktail(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      garnish: null == garnish
          ? _value.garnish
          : garnish // ignore: cast_nullable_to_non_nullable
              as String,
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TopCocktail implements _TopCocktail {
  _$_TopCocktail(
      {required this.title,
      required this.garnish,
      required this.recipe,
      @JsonKey(fromJson: TopCocktail.decodeIngredients)
          required final List<List<String>> ingredients,
      @JsonKey(name: "image_link")
          required this.image})
      : _ingredients = ingredients;

  factory _$_TopCocktail.fromJson(Map<String, dynamic> json) =>
      _$$_TopCocktailFromJson(json);

  @override
  final String title;
  @override
  final String garnish;
  @override
  final String recipe;
  final List<List<String>> _ingredients;
  @override
  @JsonKey(fromJson: TopCocktail.decodeIngredients)
  List<List<String>> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  @JsonKey(name: "image_link")
  final String image;

  @override
  String toString() {
    return 'TopCocktail(title: $title, garnish: $garnish, recipe: $recipe, ingredients: $ingredients, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopCocktail &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.garnish, garnish) || other.garnish == garnish) &&
            (identical(other.recipe, recipe) || other.recipe == recipe) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, garnish, recipe,
      const DeepCollectionEquality().hash(_ingredients), image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopCocktailCopyWith<_$_TopCocktail> get copyWith =>
      __$$_TopCocktailCopyWithImpl<_$_TopCocktail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopCocktailToJson(
      this,
    );
  }
}

abstract class _TopCocktail implements TopCocktail {
  factory _TopCocktail(
      {required final String title,
      required final String garnish,
      required final String recipe,
      @JsonKey(fromJson: TopCocktail.decodeIngredients)
          required final List<List<String>> ingredients,
      @JsonKey(name: "image_link")
          required final String image}) = _$_TopCocktail;

  factory _TopCocktail.fromJson(Map<String, dynamic> json) =
      _$_TopCocktail.fromJson;

  @override
  String get title;
  @override
  String get garnish;
  @override
  String get recipe;
  @override
  @JsonKey(fromJson: TopCocktail.decodeIngredients)
  List<List<String>> get ingredients;
  @override
  @JsonKey(name: "image_link")
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_TopCocktailCopyWith<_$_TopCocktail> get copyWith =>
      throw _privateConstructorUsedError;
}
