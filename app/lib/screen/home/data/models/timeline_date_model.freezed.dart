// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_date_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimelineDate {

 String get recordDate;// "2026-01-19"
 String? get memo; List<FoodLog> get foodLogs; List<HealthLog> get healthLogs;
/// Create a copy of TimelineDate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelineDateCopyWith<TimelineDate> get copyWith => _$TimelineDateCopyWithImpl<TimelineDate>(this as TimelineDate, _$identity);

  /// Serializes this TimelineDate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimelineDate&&(identical(other.recordDate, recordDate) || other.recordDate == recordDate)&&(identical(other.memo, memo) || other.memo == memo)&&const DeepCollectionEquality().equals(other.foodLogs, foodLogs)&&const DeepCollectionEquality().equals(other.healthLogs, healthLogs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recordDate,memo,const DeepCollectionEquality().hash(foodLogs),const DeepCollectionEquality().hash(healthLogs));

@override
String toString() {
  return 'TimelineDate(recordDate: $recordDate, memo: $memo, foodLogs: $foodLogs, healthLogs: $healthLogs)';
}


}

/// @nodoc
abstract mixin class $TimelineDateCopyWith<$Res>  {
  factory $TimelineDateCopyWith(TimelineDate value, $Res Function(TimelineDate) _then) = _$TimelineDateCopyWithImpl;
@useResult
$Res call({
 String recordDate, String? memo, List<FoodLog> foodLogs, List<HealthLog> healthLogs
});




}
/// @nodoc
class _$TimelineDateCopyWithImpl<$Res>
    implements $TimelineDateCopyWith<$Res> {
  _$TimelineDateCopyWithImpl(this._self, this._then);

  final TimelineDate _self;
  final $Res Function(TimelineDate) _then;

/// Create a copy of TimelineDate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recordDate = null,Object? memo = freezed,Object? foodLogs = null,Object? healthLogs = null,}) {
  return _then(_self.copyWith(
recordDate: null == recordDate ? _self.recordDate : recordDate // ignore: cast_nullable_to_non_nullable
as String,memo: freezed == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String?,foodLogs: null == foodLogs ? _self.foodLogs : foodLogs // ignore: cast_nullable_to_non_nullable
as List<FoodLog>,healthLogs: null == healthLogs ? _self.healthLogs : healthLogs // ignore: cast_nullable_to_non_nullable
as List<HealthLog>,
  ));
}

}


/// Adds pattern-matching-related methods to [TimelineDate].
extension TimelineDatePatterns on TimelineDate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimelineDate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimelineDate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimelineDate value)  $default,){
final _that = this;
switch (_that) {
case _TimelineDate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimelineDate value)?  $default,){
final _that = this;
switch (_that) {
case _TimelineDate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String recordDate,  String? memo,  List<FoodLog> foodLogs,  List<HealthLog> healthLogs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimelineDate() when $default != null:
return $default(_that.recordDate,_that.memo,_that.foodLogs,_that.healthLogs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String recordDate,  String? memo,  List<FoodLog> foodLogs,  List<HealthLog> healthLogs)  $default,) {final _that = this;
switch (_that) {
case _TimelineDate():
return $default(_that.recordDate,_that.memo,_that.foodLogs,_that.healthLogs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String recordDate,  String? memo,  List<FoodLog> foodLogs,  List<HealthLog> healthLogs)?  $default,) {final _that = this;
switch (_that) {
case _TimelineDate() when $default != null:
return $default(_that.recordDate,_that.memo,_that.foodLogs,_that.healthLogs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimelineDate implements TimelineDate {
  const _TimelineDate({required this.recordDate, this.memo, final  List<FoodLog> foodLogs = const [], final  List<HealthLog> healthLogs = const []}): _foodLogs = foodLogs,_healthLogs = healthLogs;
  factory _TimelineDate.fromJson(Map<String, dynamic> json) => _$TimelineDateFromJson(json);

@override final  String recordDate;
// "2026-01-19"
@override final  String? memo;
 final  List<FoodLog> _foodLogs;
@override@JsonKey() List<FoodLog> get foodLogs {
  if (_foodLogs is EqualUnmodifiableListView) return _foodLogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_foodLogs);
}

 final  List<HealthLog> _healthLogs;
@override@JsonKey() List<HealthLog> get healthLogs {
  if (_healthLogs is EqualUnmodifiableListView) return _healthLogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_healthLogs);
}


/// Create a copy of TimelineDate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimelineDateCopyWith<_TimelineDate> get copyWith => __$TimelineDateCopyWithImpl<_TimelineDate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimelineDateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimelineDate&&(identical(other.recordDate, recordDate) || other.recordDate == recordDate)&&(identical(other.memo, memo) || other.memo == memo)&&const DeepCollectionEquality().equals(other._foodLogs, _foodLogs)&&const DeepCollectionEquality().equals(other._healthLogs, _healthLogs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recordDate,memo,const DeepCollectionEquality().hash(_foodLogs),const DeepCollectionEquality().hash(_healthLogs));

@override
String toString() {
  return 'TimelineDate(recordDate: $recordDate, memo: $memo, foodLogs: $foodLogs, healthLogs: $healthLogs)';
}


}

/// @nodoc
abstract mixin class _$TimelineDateCopyWith<$Res> implements $TimelineDateCopyWith<$Res> {
  factory _$TimelineDateCopyWith(_TimelineDate value, $Res Function(_TimelineDate) _then) = __$TimelineDateCopyWithImpl;
@override @useResult
$Res call({
 String recordDate, String? memo, List<FoodLog> foodLogs, List<HealthLog> healthLogs
});




}
/// @nodoc
class __$TimelineDateCopyWithImpl<$Res>
    implements _$TimelineDateCopyWith<$Res> {
  __$TimelineDateCopyWithImpl(this._self, this._then);

  final _TimelineDate _self;
  final $Res Function(_TimelineDate) _then;

/// Create a copy of TimelineDate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recordDate = null,Object? memo = freezed,Object? foodLogs = null,Object? healthLogs = null,}) {
  return _then(_TimelineDate(
recordDate: null == recordDate ? _self.recordDate : recordDate // ignore: cast_nullable_to_non_nullable
as String,memo: freezed == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String?,foodLogs: null == foodLogs ? _self._foodLogs : foodLogs // ignore: cast_nullable_to_non_nullable
as List<FoodLog>,healthLogs: null == healthLogs ? _self._healthLogs : healthLogs // ignore: cast_nullable_to_non_nullable
as List<HealthLog>,
  ));
}


}

// dart format on
