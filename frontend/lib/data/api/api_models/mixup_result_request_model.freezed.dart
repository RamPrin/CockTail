// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mixup_result_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MixUpResultRequest _$MixUpResultRequestFromJson(Map<String, dynamic> json) {
  return _MixUpResultRequest.fromJson(json);
}

/// @nodoc
mixin _$MixUpResultRequest {
  List<String> get include => throw _privateConstructorUsedError;
  List<String> get exclude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MixUpResultRequestCopyWith<MixUpResultRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MixUpResultRequestCopyWith<$Res> {
  factory $MixUpResultRequestCopyWith(
          MixUpResultRequest value, $Res Function(MixUpResultRequest) then) =
      _$MixUpResultRequestCopyWithImpl<$Res, MixUpResultRequest>;
  @useResult
  $Res call({List<String> include, List<String> exclude});
}

/// @nodoc
class _$MixUpResultRequestCopyWithImpl<$Res, $Val extends MixUpResultRequest>
    implements $MixUpResultRequestCopyWith<$Res> {
  _$MixUpResultRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? include = null,
    Object? exclude = null,
  }) {
    return _then(_value.copyWith(
      include: null == include
          ? _value.include
          : include // ignore: cast_nullable_to_non_nullable
              as List<String>,
      exclude: null == exclude
          ? _value.exclude
          : exclude // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MixUpResultRequestCopyWith<$Res>
    implements $MixUpResultRequestCopyWith<$Res> {
  factory _$$_MixUpResultRequestCopyWith(_$_MixUpResultRequest value,
          $Res Function(_$_MixUpResultRequest) then) =
      __$$_MixUpResultRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> include, List<String> exclude});
}

/// @nodoc
class __$$_MixUpResultRequestCopyWithImpl<$Res>
    extends _$MixUpResultRequestCopyWithImpl<$Res, _$_MixUpResultRequest>
    implements _$$_MixUpResultRequestCopyWith<$Res> {
  __$$_MixUpResultRequestCopyWithImpl(
      _$_MixUpResultRequest _value, $Res Function(_$_MixUpResultRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? include = null,
    Object? exclude = null,
  }) {
    return _then(_$_MixUpResultRequest(
      include: null == include
          ? _value._include
          : include // ignore: cast_nullable_to_non_nullable
              as List<String>,
      exclude: null == exclude
          ? _value._exclude
          : exclude // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MixUpResultRequest implements _MixUpResultRequest {
  _$_MixUpResultRequest(
      {final List<String> include = const [],
      final List<String> exclude = const []})
      : _include = include,
        _exclude = exclude;

  factory _$_MixUpResultRequest.fromJson(Map<String, dynamic> json) =>
      _$$_MixUpResultRequestFromJson(json);

  final List<String> _include;
  @override
  @JsonKey()
  List<String> get include {
    if (_include is EqualUnmodifiableListView) return _include;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_include);
  }

  final List<String> _exclude;
  @override
  @JsonKey()
  List<String> get exclude {
    if (_exclude is EqualUnmodifiableListView) return _exclude;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exclude);
  }

  @override
  String toString() {
    return 'MixUpResultRequest(include: $include, exclude: $exclude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MixUpResultRequest &&
            const DeepCollectionEquality().equals(other._include, _include) &&
            const DeepCollectionEquality().equals(other._exclude, _exclude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_include),
      const DeepCollectionEquality().hash(_exclude));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MixUpResultRequestCopyWith<_$_MixUpResultRequest> get copyWith =>
      __$$_MixUpResultRequestCopyWithImpl<_$_MixUpResultRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MixUpResultRequestToJson(
      this,
    );
  }
}

abstract class _MixUpResultRequest implements MixUpResultRequest {
  factory _MixUpResultRequest(
      {final List<String> include,
      final List<String> exclude}) = _$_MixUpResultRequest;

  factory _MixUpResultRequest.fromJson(Map<String, dynamic> json) =
      _$_MixUpResultRequest.fromJson;

  @override
  List<String> get include;
  @override
  List<String> get exclude;
  @override
  @JsonKey(ignore: true)
  _$$_MixUpResultRequestCopyWith<_$_MixUpResultRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
