// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FaqCategoryModel {

/// JSON의 "user", "service" 문자열이 자동으로 NoticeFaqType Enum으로 변환됨
 NoticeFaqType get faqKind;/// "회원", "서비스" 등의 한글 명칭
 String get faqName;
/// Create a copy of FaqCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqCategoryModelCopyWith<FaqCategoryModel> get copyWith => _$FaqCategoryModelCopyWithImpl<FaqCategoryModel>(this as FaqCategoryModel, _$identity);

  /// Serializes this FaqCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqCategoryModel&&(identical(other.faqKind, faqKind) || other.faqKind == faqKind)&&(identical(other.faqName, faqName) || other.faqName == faqName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,faqKind,faqName);

@override
String toString() {
  return 'FaqCategoryModel(faqKind: $faqKind, faqName: $faqName)';
}


}

/// @nodoc
abstract mixin class $FaqCategoryModelCopyWith<$Res>  {
  factory $FaqCategoryModelCopyWith(FaqCategoryModel value, $Res Function(FaqCategoryModel) _then) = _$FaqCategoryModelCopyWithImpl;
@useResult
$Res call({
 NoticeFaqType faqKind, String faqName
});




}
/// @nodoc
class _$FaqCategoryModelCopyWithImpl<$Res>
    implements $FaqCategoryModelCopyWith<$Res> {
  _$FaqCategoryModelCopyWithImpl(this._self, this._then);

  final FaqCategoryModel _self;
  final $Res Function(FaqCategoryModel) _then;

/// Create a copy of FaqCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? faqKind = null,Object? faqName = null,}) {
  return _then(_self.copyWith(
faqKind: null == faqKind ? _self.faqKind : faqKind // ignore: cast_nullable_to_non_nullable
as NoticeFaqType,faqName: null == faqName ? _self.faqName : faqName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FaqCategoryModel].
extension FaqCategoryModelPatterns on FaqCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _FaqCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _FaqCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NoticeFaqType faqKind,  String faqName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaqCategoryModel() when $default != null:
return $default(_that.faqKind,_that.faqName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NoticeFaqType faqKind,  String faqName)  $default,) {final _that = this;
switch (_that) {
case _FaqCategoryModel():
return $default(_that.faqKind,_that.faqName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NoticeFaqType faqKind,  String faqName)?  $default,) {final _that = this;
switch (_that) {
case _FaqCategoryModel() when $default != null:
return $default(_that.faqKind,_that.faqName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaqCategoryModel implements FaqCategoryModel {
  const _FaqCategoryModel({required this.faqKind, required this.faqName});
  factory _FaqCategoryModel.fromJson(Map<String, dynamic> json) => _$FaqCategoryModelFromJson(json);

/// JSON의 "user", "service" 문자열이 자동으로 NoticeFaqType Enum으로 변환됨
@override final  NoticeFaqType faqKind;
/// "회원", "서비스" 등의 한글 명칭
@override final  String faqName;

/// Create a copy of FaqCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqCategoryModelCopyWith<_FaqCategoryModel> get copyWith => __$FaqCategoryModelCopyWithImpl<_FaqCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqCategoryModel&&(identical(other.faqKind, faqKind) || other.faqKind == faqKind)&&(identical(other.faqName, faqName) || other.faqName == faqName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,faqKind,faqName);

@override
String toString() {
  return 'FaqCategoryModel(faqKind: $faqKind, faqName: $faqName)';
}


}

/// @nodoc
abstract mixin class _$FaqCategoryModelCopyWith<$Res> implements $FaqCategoryModelCopyWith<$Res> {
  factory _$FaqCategoryModelCopyWith(_FaqCategoryModel value, $Res Function(_FaqCategoryModel) _then) = __$FaqCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 NoticeFaqType faqKind, String faqName
});




}
/// @nodoc
class __$FaqCategoryModelCopyWithImpl<$Res>
    implements _$FaqCategoryModelCopyWith<$Res> {
  __$FaqCategoryModelCopyWithImpl(this._self, this._then);

  final _FaqCategoryModel _self;
  final $Res Function(_FaqCategoryModel) _then;

/// Create a copy of FaqCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? faqKind = null,Object? faqName = null,}) {
  return _then(_FaqCategoryModel(
faqKind: null == faqKind ? _self.faqKind : faqKind // ignore: cast_nullable_to_non_nullable
as NoticeFaqType,faqName: null == faqName ? _self.faqName : faqName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
