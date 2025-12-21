// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'core_response.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoreResponse<T> {

 StatusCode get status; ResponseCode? get code; PageResponseDto? get pageInfo; T? get data;
/// Create a copy of CoreResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoreResponseCopyWith<T, CoreResponse<T>> get copyWith => _$CoreResponseCopyWithImpl<T, CoreResponse<T>>(this as CoreResponse<T>, _$identity);

  /// Serializes this CoreResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoreResponse<T>&&(identical(other.status, status) || other.status == status)&&(identical(other.code, code) || other.code == code)&&(identical(other.pageInfo, pageInfo) || other.pageInfo == pageInfo)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,code,pageInfo,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CoreResponse<$T>(status: $status, code: $code, pageInfo: $pageInfo, data: $data)';
}


}

/// @nodoc
abstract mixin class $CoreResponseCopyWith<T,$Res>  {
  factory $CoreResponseCopyWith(CoreResponse<T> value, $Res Function(CoreResponse<T>) _then) = _$CoreResponseCopyWithImpl;
@useResult
$Res call({
 StatusCode status, ResponseCode? code, PageResponseDto? pageInfo, T? data
});


$PageResponseDtoCopyWith<$Res>? get pageInfo;

}
/// @nodoc
class _$CoreResponseCopyWithImpl<T,$Res>
    implements $CoreResponseCopyWith<T, $Res> {
  _$CoreResponseCopyWithImpl(this._self, this._then);

  final CoreResponse<T> _self;
  final $Res Function(CoreResponse<T>) _then;

/// Create a copy of CoreResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? code = freezed,Object? pageInfo = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusCode,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as ResponseCode?,pageInfo: freezed == pageInfo ? _self.pageInfo : pageInfo // ignore: cast_nullable_to_non_nullable
as PageResponseDto?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}
/// Create a copy of CoreResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageResponseDtoCopyWith<$Res>? get pageInfo {
    if (_self.pageInfo == null) {
    return null;
  }

  return $PageResponseDtoCopyWith<$Res>(_self.pageInfo!, (value) {
    return _then(_self.copyWith(pageInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [CoreResponse].
extension CoreResponsePatterns<T> on CoreResponse<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoreResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoreResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoreResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _CoreResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoreResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _CoreResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StatusCode status,  ResponseCode? code,  PageResponseDto? pageInfo,  T? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoreResponse() when $default != null:
return $default(_that.status,_that.code,_that.pageInfo,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StatusCode status,  ResponseCode? code,  PageResponseDto? pageInfo,  T? data)  $default,) {final _that = this;
switch (_that) {
case _CoreResponse():
return $default(_that.status,_that.code,_that.pageInfo,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StatusCode status,  ResponseCode? code,  PageResponseDto? pageInfo,  T? data)?  $default,) {final _that = this;
switch (_that) {
case _CoreResponse() when $default != null:
return $default(_that.status,_that.code,_that.pageInfo,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _CoreResponse<T> implements CoreResponse<T> {
  const _CoreResponse({required this.status, this.code, this.pageInfo, this.data});
  factory _CoreResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$CoreResponseFromJson(json,fromJsonT);

@override final  StatusCode status;
@override final  ResponseCode? code;
@override final  PageResponseDto? pageInfo;
@override final  T? data;

/// Create a copy of CoreResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoreResponseCopyWith<T, _CoreResponse<T>> get copyWith => __$CoreResponseCopyWithImpl<T, _CoreResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$CoreResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoreResponse<T>&&(identical(other.status, status) || other.status == status)&&(identical(other.code, code) || other.code == code)&&(identical(other.pageInfo, pageInfo) || other.pageInfo == pageInfo)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,code,pageInfo,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CoreResponse<$T>(status: $status, code: $code, pageInfo: $pageInfo, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CoreResponseCopyWith<T,$Res> implements $CoreResponseCopyWith<T, $Res> {
  factory _$CoreResponseCopyWith(_CoreResponse<T> value, $Res Function(_CoreResponse<T>) _then) = __$CoreResponseCopyWithImpl;
@override @useResult
$Res call({
 StatusCode status, ResponseCode? code, PageResponseDto? pageInfo, T? data
});


@override $PageResponseDtoCopyWith<$Res>? get pageInfo;

}
/// @nodoc
class __$CoreResponseCopyWithImpl<T,$Res>
    implements _$CoreResponseCopyWith<T, $Res> {
  __$CoreResponseCopyWithImpl(this._self, this._then);

  final _CoreResponse<T> _self;
  final $Res Function(_CoreResponse<T>) _then;

/// Create a copy of CoreResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? code = freezed,Object? pageInfo = freezed,Object? data = freezed,}) {
  return _then(_CoreResponse<T>(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusCode,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as ResponseCode?,pageInfo: freezed == pageInfo ? _self.pageInfo : pageInfo // ignore: cast_nullable_to_non_nullable
as PageResponseDto?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}

/// Create a copy of CoreResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageResponseDtoCopyWith<$Res>? get pageInfo {
    if (_self.pageInfo == null) {
    return null;
  }

  return $PageResponseDtoCopyWith<$Res>(_self.pageInfo!, (value) {
    return _then(_self.copyWith(pageInfo: value));
  });
}
}

// dart format on
