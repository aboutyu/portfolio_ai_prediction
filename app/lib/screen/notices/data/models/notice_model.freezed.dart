// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NoticeModel {

/// 1. Sequence (PK)
 int get sequence;/// 2. Notice Type (Default: NOTICE)
/// JSON에 값이 없거나 매칭되지 않으면 unknown 처리하려면
/// @Default(NoticeType.notice) 사용
 NoticeType get type;/// 3. FAQ Kind (Nullable)
/// DB에서 Null일 수 있으므로 Dart에서도 Nullable(?)로 선언
 NoticeFaqType? get faqKind;/// 4. Title
 String get title;/// 5. Content (HTML or Text)
 String get content;/// 6. Create Date
/// TypeORM의 Date는 JSON으로 직렬화될 때 ISO8601 String으로 넘어옴
/// Dart의 DateTime이 이를 자동으로 파싱함
 DateTime get createDate;/// 7. Is Activate
/// TypeORM Transformer에 의해 DB에는 'Y'/'N'이지만
/// API JSON 응답은 boolean(true/false)으로 내려오므로 bool 사용
 bool get isActivate;
/// Create a copy of NoticeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoticeModelCopyWith<NoticeModel> get copyWith => _$NoticeModelCopyWithImpl<NoticeModel>(this as NoticeModel, _$identity);

  /// Serializes this NoticeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoticeModel&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.type, type) || other.type == type)&&(identical(other.faqKind, faqKind) || other.faqKind == faqKind)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.createDate, createDate) || other.createDate == createDate)&&(identical(other.isActivate, isActivate) || other.isActivate == isActivate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sequence,type,faqKind,title,content,createDate,isActivate);

@override
String toString() {
  return 'NoticeModel(sequence: $sequence, type: $type, faqKind: $faqKind, title: $title, content: $content, createDate: $createDate, isActivate: $isActivate)';
}


}

/// @nodoc
abstract mixin class $NoticeModelCopyWith<$Res>  {
  factory $NoticeModelCopyWith(NoticeModel value, $Res Function(NoticeModel) _then) = _$NoticeModelCopyWithImpl;
@useResult
$Res call({
 int sequence, NoticeType type, NoticeFaqType? faqKind, String title, String content, DateTime createDate, bool isActivate
});




}
/// @nodoc
class _$NoticeModelCopyWithImpl<$Res>
    implements $NoticeModelCopyWith<$Res> {
  _$NoticeModelCopyWithImpl(this._self, this._then);

  final NoticeModel _self;
  final $Res Function(NoticeModel) _then;

/// Create a copy of NoticeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sequence = null,Object? type = null,Object? faqKind = freezed,Object? title = null,Object? content = null,Object? createDate = null,Object? isActivate = null,}) {
  return _then(_self.copyWith(
sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NoticeType,faqKind: freezed == faqKind ? _self.faqKind : faqKind // ignore: cast_nullable_to_non_nullable
as NoticeFaqType?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createDate: null == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime,isActivate: null == isActivate ? _self.isActivate : isActivate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NoticeModel].
extension NoticeModelPatterns on NoticeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoticeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoticeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoticeModel value)  $default,){
final _that = this;
switch (_that) {
case _NoticeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoticeModel value)?  $default,){
final _that = this;
switch (_that) {
case _NoticeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sequence,  NoticeType type,  NoticeFaqType? faqKind,  String title,  String content,  DateTime createDate,  bool isActivate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoticeModel() when $default != null:
return $default(_that.sequence,_that.type,_that.faqKind,_that.title,_that.content,_that.createDate,_that.isActivate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sequence,  NoticeType type,  NoticeFaqType? faqKind,  String title,  String content,  DateTime createDate,  bool isActivate)  $default,) {final _that = this;
switch (_that) {
case _NoticeModel():
return $default(_that.sequence,_that.type,_that.faqKind,_that.title,_that.content,_that.createDate,_that.isActivate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sequence,  NoticeType type,  NoticeFaqType? faqKind,  String title,  String content,  DateTime createDate,  bool isActivate)?  $default,) {final _that = this;
switch (_that) {
case _NoticeModel() when $default != null:
return $default(_that.sequence,_that.type,_that.faqKind,_that.title,_that.content,_that.createDate,_that.isActivate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NoticeModel implements NoticeModel {
  const _NoticeModel({required this.sequence, this.type = NoticeType.notice, this.faqKind, required this.title, required this.content, required this.createDate, this.isActivate = false});
  factory _NoticeModel.fromJson(Map<String, dynamic> json) => _$NoticeModelFromJson(json);

/// 1. Sequence (PK)
@override final  int sequence;
/// 2. Notice Type (Default: NOTICE)
/// JSON에 값이 없거나 매칭되지 않으면 unknown 처리하려면
/// @Default(NoticeType.notice) 사용
@override@JsonKey() final  NoticeType type;
/// 3. FAQ Kind (Nullable)
/// DB에서 Null일 수 있으므로 Dart에서도 Nullable(?)로 선언
@override final  NoticeFaqType? faqKind;
/// 4. Title
@override final  String title;
/// 5. Content (HTML or Text)
@override final  String content;
/// 6. Create Date
/// TypeORM의 Date는 JSON으로 직렬화될 때 ISO8601 String으로 넘어옴
/// Dart의 DateTime이 이를 자동으로 파싱함
@override final  DateTime createDate;
/// 7. Is Activate
/// TypeORM Transformer에 의해 DB에는 'Y'/'N'이지만
/// API JSON 응답은 boolean(true/false)으로 내려오므로 bool 사용
@override@JsonKey() final  bool isActivate;

/// Create a copy of NoticeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoticeModelCopyWith<_NoticeModel> get copyWith => __$NoticeModelCopyWithImpl<_NoticeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NoticeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoticeModel&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.type, type) || other.type == type)&&(identical(other.faqKind, faqKind) || other.faqKind == faqKind)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.createDate, createDate) || other.createDate == createDate)&&(identical(other.isActivate, isActivate) || other.isActivate == isActivate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sequence,type,faqKind,title,content,createDate,isActivate);

@override
String toString() {
  return 'NoticeModel(sequence: $sequence, type: $type, faqKind: $faqKind, title: $title, content: $content, createDate: $createDate, isActivate: $isActivate)';
}


}

/// @nodoc
abstract mixin class _$NoticeModelCopyWith<$Res> implements $NoticeModelCopyWith<$Res> {
  factory _$NoticeModelCopyWith(_NoticeModel value, $Res Function(_NoticeModel) _then) = __$NoticeModelCopyWithImpl;
@override @useResult
$Res call({
 int sequence, NoticeType type, NoticeFaqType? faqKind, String title, String content, DateTime createDate, bool isActivate
});




}
/// @nodoc
class __$NoticeModelCopyWithImpl<$Res>
    implements _$NoticeModelCopyWith<$Res> {
  __$NoticeModelCopyWithImpl(this._self, this._then);

  final _NoticeModel _self;
  final $Res Function(_NoticeModel) _then;

/// Create a copy of NoticeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sequence = null,Object? type = null,Object? faqKind = freezed,Object? title = null,Object? content = null,Object? createDate = null,Object? isActivate = null,}) {
  return _then(_NoticeModel(
sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NoticeType,faqKind: freezed == faqKind ? _self.faqKind : faqKind // ignore: cast_nullable_to_non_nullable
as NoticeFaqType?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createDate: null == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime,isActivate: null == isActivate ? _self.isActivate : isActivate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
