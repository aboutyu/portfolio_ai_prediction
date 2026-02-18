// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_code_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceCodeModel {

 int get sequence; String get code; ServiceCodeType get type; String get name; String? get memo;
/// Create a copy of ServiceCodeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceCodeModelCopyWith<ServiceCodeModel> get copyWith => _$ServiceCodeModelCopyWithImpl<ServiceCodeModel>(this as ServiceCodeModel, _$identity);

  /// Serializes this ServiceCodeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceCodeModel&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.code, code) || other.code == code)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.memo, memo) || other.memo == memo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sequence,code,type,name,memo);

@override
String toString() {
  return 'ServiceCodeModel(sequence: $sequence, code: $code, type: $type, name: $name, memo: $memo)';
}


}

/// @nodoc
abstract mixin class $ServiceCodeModelCopyWith<$Res>  {
  factory $ServiceCodeModelCopyWith(ServiceCodeModel value, $Res Function(ServiceCodeModel) _then) = _$ServiceCodeModelCopyWithImpl;
@useResult
$Res call({
 int sequence, String code, ServiceCodeType type, String name, String? memo
});




}
/// @nodoc
class _$ServiceCodeModelCopyWithImpl<$Res>
    implements $ServiceCodeModelCopyWith<$Res> {
  _$ServiceCodeModelCopyWithImpl(this._self, this._then);

  final ServiceCodeModel _self;
  final $Res Function(ServiceCodeModel) _then;

/// Create a copy of ServiceCodeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sequence = null,Object? code = null,Object? type = null,Object? name = null,Object? memo = freezed,}) {
  return _then(_self.copyWith(
sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ServiceCodeType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,memo: freezed == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceCodeModel].
extension ServiceCodeModelPatterns on ServiceCodeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceCodeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceCodeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceCodeModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceCodeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceCodeModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceCodeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sequence,  String code,  ServiceCodeType type,  String name,  String? memo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceCodeModel() when $default != null:
return $default(_that.sequence,_that.code,_that.type,_that.name,_that.memo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sequence,  String code,  ServiceCodeType type,  String name,  String? memo)  $default,) {final _that = this;
switch (_that) {
case _ServiceCodeModel():
return $default(_that.sequence,_that.code,_that.type,_that.name,_that.memo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sequence,  String code,  ServiceCodeType type,  String name,  String? memo)?  $default,) {final _that = this;
switch (_that) {
case _ServiceCodeModel() when $default != null:
return $default(_that.sequence,_that.code,_that.type,_that.name,_that.memo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceCodeModel implements ServiceCodeModel {
  const _ServiceCodeModel({required this.sequence, required this.code, this.type = ServiceCodeType.itp, required this.name, this.memo});
  factory _ServiceCodeModel.fromJson(Map<String, dynamic> json) => _$ServiceCodeModelFromJson(json);

@override final  int sequence;
@override final  String code;
@override@JsonKey() final  ServiceCodeType type;
@override final  String name;
@override final  String? memo;

/// Create a copy of ServiceCodeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceCodeModelCopyWith<_ServiceCodeModel> get copyWith => __$ServiceCodeModelCopyWithImpl<_ServiceCodeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceCodeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceCodeModel&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.code, code) || other.code == code)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.memo, memo) || other.memo == memo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sequence,code,type,name,memo);

@override
String toString() {
  return 'ServiceCodeModel(sequence: $sequence, code: $code, type: $type, name: $name, memo: $memo)';
}


}

/// @nodoc
abstract mixin class _$ServiceCodeModelCopyWith<$Res> implements $ServiceCodeModelCopyWith<$Res> {
  factory _$ServiceCodeModelCopyWith(_ServiceCodeModel value, $Res Function(_ServiceCodeModel) _then) = __$ServiceCodeModelCopyWithImpl;
@override @useResult
$Res call({
 int sequence, String code, ServiceCodeType type, String name, String? memo
});




}
/// @nodoc
class __$ServiceCodeModelCopyWithImpl<$Res>
    implements _$ServiceCodeModelCopyWith<$Res> {
  __$ServiceCodeModelCopyWithImpl(this._self, this._then);

  final _ServiceCodeModel _self;
  final $Res Function(_ServiceCodeModel) _then;

/// Create a copy of ServiceCodeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sequence = null,Object? code = null,Object? type = null,Object? name = null,Object? memo = freezed,}) {
  return _then(_ServiceCodeModel(
sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ServiceCodeType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,memo: freezed == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
