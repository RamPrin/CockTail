// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PickResultState _$PickResultStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return Loading.fromJson(json);
    case 'error':
      return Error.fromJson(json);
    case 'data':
      return Data.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PickResultState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PickResultState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(PickResultErrorReason errorReason) error,
    required TResult Function(Cocktail cocktail) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(PickResultErrorReason errorReason)? error,
    TResult? Function(Cocktail cocktail)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(PickResultErrorReason errorReason)? error,
    TResult Function(Cocktail cocktail)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Data value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Data value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Data value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickResultStateCopyWith<$Res> {
  factory $PickResultStateCopyWith(
          PickResultState value, $Res Function(PickResultState) then) =
      _$PickResultStateCopyWithImpl<$Res, PickResultState>;
}

/// @nodoc
class _$PickResultStateCopyWithImpl<$Res, $Val extends PickResultState>
    implements $PickResultStateCopyWith<$Res> {
  _$PickResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$PickResultStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$Loading implements Loading {
  _$Loading({final String? $type}) : $type = $type ?? 'loading';

  factory _$Loading.fromJson(Map<String, dynamic> json) =>
      _$$LoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PickResultState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(PickResultErrorReason errorReason) error,
    required TResult Function(Cocktail cocktail) data,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(PickResultErrorReason errorReason)? error,
    TResult? Function(Cocktail cocktail)? data,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(PickResultErrorReason errorReason)? error,
    TResult Function(Cocktail cocktail)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Data value) data,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Data value)? data,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Data value)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadingToJson(
      this,
    );
  }
}

abstract class Loading implements PickResultState {
  factory Loading() = _$Loading;

  factory Loading.fromJson(Map<String, dynamic> json) = _$Loading.fromJson;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({PickResultErrorReason errorReason});
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res>
    extends _$PickResultStateCopyWithImpl<$Res, _$Error>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorReason = null,
  }) {
    return _then(_$Error(
      errorReason: null == errorReason
          ? _value.errorReason
          : errorReason // ignore: cast_nullable_to_non_nullable
              as PickResultErrorReason,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Error implements Error {
  _$Error(
      {this.errorReason = PickResultErrorReason.serverError,
      final String? $type})
      : $type = $type ?? 'error';

  factory _$Error.fromJson(Map<String, dynamic> json) => _$$ErrorFromJson(json);

  @override
  @JsonKey()
  final PickResultErrorReason errorReason;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PickResultState.error(errorReason: $errorReason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            (identical(other.errorReason, errorReason) ||
                other.errorReason == errorReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, errorReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(PickResultErrorReason errorReason) error,
    required TResult Function(Cocktail cocktail) data,
  }) {
    return error(errorReason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(PickResultErrorReason errorReason)? error,
    TResult? Function(Cocktail cocktail)? data,
  }) {
    return error?.call(errorReason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(PickResultErrorReason errorReason)? error,
    TResult Function(Cocktail cocktail)? data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorReason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Data value) data,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Data value)? data,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Data value)? data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorToJson(
      this,
    );
  }
}

abstract class Error implements PickResultState {
  factory Error({final PickResultErrorReason errorReason}) = _$Error;

  factory Error.fromJson(Map<String, dynamic> json) = _$Error.fromJson;

  PickResultErrorReason get errorReason;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataCopyWith<$Res> {
  factory _$$DataCopyWith(_$Data value, $Res Function(_$Data) then) =
      __$$DataCopyWithImpl<$Res>;
  @useResult
  $Res call({Cocktail cocktail});

  $CocktailCopyWith<$Res> get cocktail;
}

/// @nodoc
class __$$DataCopyWithImpl<$Res>
    extends _$PickResultStateCopyWithImpl<$Res, _$Data>
    implements _$$DataCopyWith<$Res> {
  __$$DataCopyWithImpl(_$Data _value, $Res Function(_$Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cocktail = null,
  }) {
    return _then(_$Data(
      cocktail: null == cocktail
          ? _value.cocktail
          : cocktail // ignore: cast_nullable_to_non_nullable
              as Cocktail,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CocktailCopyWith<$Res> get cocktail {
    return $CocktailCopyWith<$Res>(_value.cocktail, (value) {
      return _then(_value.copyWith(cocktail: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$Data implements Data {
  _$Data({required this.cocktail, final String? $type})
      : $type = $type ?? 'data';

  factory _$Data.fromJson(Map<String, dynamic> json) => _$$DataFromJson(json);

  @override
  final Cocktail cocktail;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PickResultState.data(cocktail: $cocktail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Data &&
            (identical(other.cocktail, cocktail) ||
                other.cocktail == cocktail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cocktail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataCopyWith<_$Data> get copyWith =>
      __$$DataCopyWithImpl<_$Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(PickResultErrorReason errorReason) error,
    required TResult Function(Cocktail cocktail) data,
  }) {
    return data(cocktail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(PickResultErrorReason errorReason)? error,
    TResult? Function(Cocktail cocktail)? data,
  }) {
    return data?.call(cocktail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(PickResultErrorReason errorReason)? error,
    TResult Function(Cocktail cocktail)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(cocktail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(Data value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(Data value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(Data value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DataToJson(
      this,
    );
  }
}

abstract class Data implements PickResultState {
  factory Data({required final Cocktail cocktail}) = _$Data;

  factory Data.fromJson(Map<String, dynamic> json) = _$Data.fromJson;

  Cocktail get cocktail;
  @JsonKey(ignore: true)
  _$$DataCopyWith<_$Data> get copyWith => throw _privateConstructorUsedError;
}
