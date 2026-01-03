// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TermsModel {

/// Primary Key
 int get sequence;/// 약관 타입 (Enum)
 TermsType get type;/// 약관 제목
 String get title;/// 약관 내용
 String get content;/// 필수 동의 여부
 bool get isRequired;/// 활성화 여부
 bool get isActivate;/// 생성일
@JsonKey(name: 'create_date') DateTime get createDate; String get termsName;
/// Create a copy of TermsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TermsModelCopyWith<TermsModel> get copyWith => _$TermsModelCopyWithImpl<TermsModel>(this as TermsModel, _$identity);

  /// Serializes this TermsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TermsModel&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isActivate, isActivate) || other.isActivate == isActivate)&&(identical(other.createDate, createDate) || other.createDate == createDate)&&(identical(other.termsName, termsName) || other.termsName == termsName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sequence,type,title,content,isRequired,isActivate,createDate,termsName);

@override
String toString() {
  return 'TermsModel(sequence: $sequence, type: $type, title: $title, content: $content, isRequired: $isRequired, isActivate: $isActivate, createDate: $createDate, termsName: $termsName)';
}


}

/// @nodoc
abstract mixin class $TermsModelCopyWith<$Res>  {
  factory $TermsModelCopyWith(TermsModel value, $Res Function(TermsModel) _then) = _$TermsModelCopyWithImpl;
@useResult
$Res call({
 int sequence, TermsType type, String title, String content, bool isRequired, bool isActivate,@JsonKey(name: 'create_date') DateTime createDate, String termsName
});




}
/// @nodoc
class _$TermsModelCopyWithImpl<$Res>
    implements $TermsModelCopyWith<$Res> {
  _$TermsModelCopyWithImpl(this._self, this._then);

  final TermsModel _self;
  final $Res Function(TermsModel) _then;

/// Create a copy of TermsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sequence = null,Object? type = null,Object? title = null,Object? content = null,Object? isRequired = null,Object? isActivate = null,Object? createDate = null,Object? termsName = null,}) {
  return _then(_self.copyWith(
sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TermsType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,isActivate: null == isActivate ? _self.isActivate : isActivate // ignore: cast_nullable_to_non_nullable
as bool,createDate: null == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime,termsName: null == termsName ? _self.termsName : termsName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TermsModel].
extension TermsModelPatterns on TermsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TermsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TermsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TermsModel value)  $default,){
final _that = this;
switch (_that) {
case _TermsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TermsModel value)?  $default,){
final _that = this;
switch (_that) {
case _TermsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sequence,  TermsType type,  String title,  String content,  bool isRequired,  bool isActivate, @JsonKey(name: 'create_date')  DateTime createDate,  String termsName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TermsModel() when $default != null:
return $default(_that.sequence,_that.type,_that.title,_that.content,_that.isRequired,_that.isActivate,_that.createDate,_that.termsName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sequence,  TermsType type,  String title,  String content,  bool isRequired,  bool isActivate, @JsonKey(name: 'create_date')  DateTime createDate,  String termsName)  $default,) {final _that = this;
switch (_that) {
case _TermsModel():
return $default(_that.sequence,_that.type,_that.title,_that.content,_that.isRequired,_that.isActivate,_that.createDate,_that.termsName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sequence,  TermsType type,  String title,  String content,  bool isRequired,  bool isActivate, @JsonKey(name: 'create_date')  DateTime createDate,  String termsName)?  $default,) {final _that = this;
switch (_that) {
case _TermsModel() when $default != null:
return $default(_that.sequence,_that.type,_that.title,_that.content,_that.isRequired,_that.isActivate,_that.createDate,_that.termsName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TermsModel implements TermsModel {
  const _TermsModel({required this.sequence, this.type = TermsType.service, required this.title, required this.content, required this.isRequired, required this.isActivate, @JsonKey(name: 'create_date') required this.createDate, required this.termsName});
  factory _TermsModel.fromJson(Map<String, dynamic> json) => _$TermsModelFromJson(json);

/// Primary Key
@override final  int sequence;
/// 약관 타입 (Enum)
@override@JsonKey() final  TermsType type;
/// 약관 제목
@override final  String title;
/// 약관 내용
@override final  String content;
/// 필수 동의 여부
@override final  bool isRequired;
/// 활성화 여부
@override final  bool isActivate;
/// 생성일
@override@JsonKey(name: 'create_date') final  DateTime createDate;
@override final  String termsName;

/// Create a copy of TermsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TermsModelCopyWith<_TermsModel> get copyWith => __$TermsModelCopyWithImpl<_TermsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TermsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TermsModel&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isActivate, isActivate) || other.isActivate == isActivate)&&(identical(other.createDate, createDate) || other.createDate == createDate)&&(identical(other.termsName, termsName) || other.termsName == termsName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sequence,type,title,content,isRequired,isActivate,createDate,termsName);

@override
String toString() {
  return 'TermsModel(sequence: $sequence, type: $type, title: $title, content: $content, isRequired: $isRequired, isActivate: $isActivate, createDate: $createDate, termsName: $termsName)';
}


}

/// @nodoc
abstract mixin class _$TermsModelCopyWith<$Res> implements $TermsModelCopyWith<$Res> {
  factory _$TermsModelCopyWith(_TermsModel value, $Res Function(_TermsModel) _then) = __$TermsModelCopyWithImpl;
@override @useResult
$Res call({
 int sequence, TermsType type, String title, String content, bool isRequired, bool isActivate,@JsonKey(name: 'create_date') DateTime createDate, String termsName
});




}
/// @nodoc
class __$TermsModelCopyWithImpl<$Res>
    implements _$TermsModelCopyWith<$Res> {
  __$TermsModelCopyWithImpl(this._self, this._then);

  final _TermsModel _self;
  final $Res Function(_TermsModel) _then;

/// Create a copy of TermsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sequence = null,Object? type = null,Object? title = null,Object? content = null,Object? isRequired = null,Object? isActivate = null,Object? createDate = null,Object? termsName = null,}) {
  return _then(_TermsModel(
sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TermsType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,isActivate: null == isActivate ? _self.isActivate : isActivate // ignore: cast_nullable_to_non_nullable
as bool,createDate: null == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime,termsName: null == termsName ? _self.termsName : termsName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
