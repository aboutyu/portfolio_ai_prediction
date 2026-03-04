// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_response.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PageResponseDto {

 int get page;// 현재 페이지 번호
 int get totalCount;// 전체 아이템 수
 int get pageCount;// 현재 페이지에 몇개의 아이템이 있는지
 int get pageNum;
/// Create a copy of PageResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageResponseDtoCopyWith<PageResponseDto> get copyWith => _$PageResponseDtoCopyWithImpl<PageResponseDto>(this as PageResponseDto, _$identity);

  /// Serializes this PageResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageResponseDto&&(identical(other.page, page) || other.page == page)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.pageNum, pageNum) || other.pageNum == pageNum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,totalCount,pageCount,pageNum);

@override
String toString() {
  return 'PageResponseDto(page: $page, totalCount: $totalCount, pageCount: $pageCount, pageNum: $pageNum)';
}


}

/// @nodoc
abstract mixin class $PageResponseDtoCopyWith<$Res>  {
  factory $PageResponseDtoCopyWith(PageResponseDto value, $Res Function(PageResponseDto) _then) = _$PageResponseDtoCopyWithImpl;
@useResult
$Res call({
 int page, int totalCount, int pageCount, int pageNum
});




}
/// @nodoc
class _$PageResponseDtoCopyWithImpl<$Res>
    implements $PageResponseDtoCopyWith<$Res> {
  _$PageResponseDtoCopyWithImpl(this._self, this._then);

  final PageResponseDto _self;
  final $Res Function(PageResponseDto) _then;

/// Create a copy of PageResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? totalCount = null,Object? pageCount = null,Object? pageNum = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,pageNum: null == pageNum ? _self.pageNum : pageNum // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PageResponseDto].
extension PageResponseDtoPatterns on PageResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PageResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PageResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PageResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _PageResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PageResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _PageResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int totalCount,  int pageCount,  int pageNum)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PageResponseDto() when $default != null:
return $default(_that.page,_that.totalCount,_that.pageCount,_that.pageNum);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int totalCount,  int pageCount,  int pageNum)  $default,) {final _that = this;
switch (_that) {
case _PageResponseDto():
return $default(_that.page,_that.totalCount,_that.pageCount,_that.pageNum);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int totalCount,  int pageCount,  int pageNum)?  $default,) {final _that = this;
switch (_that) {
case _PageResponseDto() when $default != null:
return $default(_that.page,_that.totalCount,_that.pageCount,_that.pageNum);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PageResponseDto implements PageResponseDto {
  const _PageResponseDto({this.page = 0, this.totalCount = 0, this.pageCount = 0, this.pageNum = 10});
  factory _PageResponseDto.fromJson(Map<String, dynamic> json) => _$PageResponseDtoFromJson(json);

@override@JsonKey() final  int page;
// 현재 페이지 번호
@override@JsonKey() final  int totalCount;
// 전체 아이템 수
@override@JsonKey() final  int pageCount;
// 현재 페이지에 몇개의 아이템이 있는지
@override@JsonKey() final  int pageNum;

/// Create a copy of PageResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageResponseDtoCopyWith<_PageResponseDto> get copyWith => __$PageResponseDtoCopyWithImpl<_PageResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PageResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageResponseDto&&(identical(other.page, page) || other.page == page)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.pageNum, pageNum) || other.pageNum == pageNum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,totalCount,pageCount,pageNum);

@override
String toString() {
  return 'PageResponseDto(page: $page, totalCount: $totalCount, pageCount: $pageCount, pageNum: $pageNum)';
}


}

/// @nodoc
abstract mixin class _$PageResponseDtoCopyWith<$Res> implements $PageResponseDtoCopyWith<$Res> {
  factory _$PageResponseDtoCopyWith(_PageResponseDto value, $Res Function(_PageResponseDto) _then) = __$PageResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 int page, int totalCount, int pageCount, int pageNum
});




}
/// @nodoc
class __$PageResponseDtoCopyWithImpl<$Res>
    implements _$PageResponseDtoCopyWith<$Res> {
  __$PageResponseDtoCopyWithImpl(this._self, this._then);

  final _PageResponseDto _self;
  final $Res Function(_PageResponseDto) _then;

/// Create a copy of PageResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? totalCount = null,Object? pageCount = null,Object? pageNum = null,}) {
  return _then(_PageResponseDto(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,pageNum: null == pageNum ? _self.pageNum : pageNum // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
