// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_item.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimelineItem {

 String get uuid; DateTime get recordTime; String? get memo;// null 가능
 List<FoodLog> get foodLogs; List<HealthLog> get healthLogs;
/// Create a copy of TimelineItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelineItemCopyWith<TimelineItem> get copyWith => _$TimelineItemCopyWithImpl<TimelineItem>(this as TimelineItem, _$identity);

  /// Serializes this TimelineItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimelineItem&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.recordTime, recordTime) || other.recordTime == recordTime)&&(identical(other.memo, memo) || other.memo == memo)&&const DeepCollectionEquality().equals(other.foodLogs, foodLogs)&&const DeepCollectionEquality().equals(other.healthLogs, healthLogs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,recordTime,memo,const DeepCollectionEquality().hash(foodLogs),const DeepCollectionEquality().hash(healthLogs));

@override
String toString() {
  return 'TimelineItem(uuid: $uuid, recordTime: $recordTime, memo: $memo, foodLogs: $foodLogs, healthLogs: $healthLogs)';
}


}

/// @nodoc
abstract mixin class $TimelineItemCopyWith<$Res>  {
  factory $TimelineItemCopyWith(TimelineItem value, $Res Function(TimelineItem) _then) = _$TimelineItemCopyWithImpl;
@useResult
$Res call({
 String uuid, DateTime recordTime, String? memo, List<FoodLog> foodLogs, List<HealthLog> healthLogs
});




}
/// @nodoc
class _$TimelineItemCopyWithImpl<$Res>
    implements $TimelineItemCopyWith<$Res> {
  _$TimelineItemCopyWithImpl(this._self, this._then);

  final TimelineItem _self;
  final $Res Function(TimelineItem) _then;

/// Create a copy of TimelineItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = null,Object? recordTime = null,Object? memo = freezed,Object? foodLogs = null,Object? healthLogs = null,}) {
  return _then(_self.copyWith(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,recordTime: null == recordTime ? _self.recordTime : recordTime // ignore: cast_nullable_to_non_nullable
as DateTime,memo: freezed == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String?,foodLogs: null == foodLogs ? _self.foodLogs : foodLogs // ignore: cast_nullable_to_non_nullable
as List<FoodLog>,healthLogs: null == healthLogs ? _self.healthLogs : healthLogs // ignore: cast_nullable_to_non_nullable
as List<HealthLog>,
  ));
}

}


/// Adds pattern-matching-related methods to [TimelineItem].
extension TimelineItemPatterns on TimelineItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimelineItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimelineItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimelineItem value)  $default,){
final _that = this;
switch (_that) {
case _TimelineItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimelineItem value)?  $default,){
final _that = this;
switch (_that) {
case _TimelineItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uuid,  DateTime recordTime,  String? memo,  List<FoodLog> foodLogs,  List<HealthLog> healthLogs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimelineItem() when $default != null:
return $default(_that.uuid,_that.recordTime,_that.memo,_that.foodLogs,_that.healthLogs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uuid,  DateTime recordTime,  String? memo,  List<FoodLog> foodLogs,  List<HealthLog> healthLogs)  $default,) {final _that = this;
switch (_that) {
case _TimelineItem():
return $default(_that.uuid,_that.recordTime,_that.memo,_that.foodLogs,_that.healthLogs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uuid,  DateTime recordTime,  String? memo,  List<FoodLog> foodLogs,  List<HealthLog> healthLogs)?  $default,) {final _that = this;
switch (_that) {
case _TimelineItem() when $default != null:
return $default(_that.uuid,_that.recordTime,_that.memo,_that.foodLogs,_that.healthLogs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimelineItem extends TimelineItem {
   _TimelineItem({required this.uuid, required this.recordTime, this.memo, final  List<FoodLog> foodLogs = const [], final  List<HealthLog> healthLogs = const []}): _foodLogs = foodLogs,_healthLogs = healthLogs,super._();
  factory _TimelineItem.fromJson(Map<String, dynamic> json) => _$TimelineItemFromJson(json);

@override final  String uuid;
@override final  DateTime recordTime;
@override final  String? memo;
// null 가능
 final  List<FoodLog> _foodLogs;
// null 가능
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


/// Create a copy of TimelineItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimelineItemCopyWith<_TimelineItem> get copyWith => __$TimelineItemCopyWithImpl<_TimelineItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimelineItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimelineItem&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.recordTime, recordTime) || other.recordTime == recordTime)&&(identical(other.memo, memo) || other.memo == memo)&&const DeepCollectionEquality().equals(other._foodLogs, _foodLogs)&&const DeepCollectionEquality().equals(other._healthLogs, _healthLogs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,recordTime,memo,const DeepCollectionEquality().hash(_foodLogs),const DeepCollectionEquality().hash(_healthLogs));

@override
String toString() {
  return 'TimelineItem(uuid: $uuid, recordTime: $recordTime, memo: $memo, foodLogs: $foodLogs, healthLogs: $healthLogs)';
}


}

/// @nodoc
abstract mixin class _$TimelineItemCopyWith<$Res> implements $TimelineItemCopyWith<$Res> {
  factory _$TimelineItemCopyWith(_TimelineItem value, $Res Function(_TimelineItem) _then) = __$TimelineItemCopyWithImpl;
@override @useResult
$Res call({
 String uuid, DateTime recordTime, String? memo, List<FoodLog> foodLogs, List<HealthLog> healthLogs
});




}
/// @nodoc
class __$TimelineItemCopyWithImpl<$Res>
    implements _$TimelineItemCopyWith<$Res> {
  __$TimelineItemCopyWithImpl(this._self, this._then);

  final _TimelineItem _self;
  final $Res Function(_TimelineItem) _then;

/// Create a copy of TimelineItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = null,Object? recordTime = null,Object? memo = freezed,Object? foodLogs = null,Object? healthLogs = null,}) {
  return _then(_TimelineItem(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,recordTime: null == recordTime ? _self.recordTime : recordTime // ignore: cast_nullable_to_non_nullable
as DateTime,memo: freezed == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String?,foodLogs: null == foodLogs ? _self._foodLogs : foodLogs // ignore: cast_nullable_to_non_nullable
as List<FoodLog>,healthLogs: null == healthLogs ? _self._healthLogs : healthLogs // ignore: cast_nullable_to_non_nullable
as List<HealthLog>,
  ));
}


}

/// @nodoc
mixin _$Log {

 TimelineLogType get type; int get sequence; String get groupUuid; DateTime get recordDate; String? get foodName; double? get calories; HealthLogType? get healthType; double? get healthValue; double? get healthExtraValue;
/// Create a copy of Log
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogCopyWith<Log> get copyWith => _$LogCopyWithImpl<Log>(this as Log, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Log&&(identical(other.type, type) || other.type == type)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.groupUuid, groupUuid) || other.groupUuid == groupUuid)&&(identical(other.recordDate, recordDate) || other.recordDate == recordDate)&&(identical(other.foodName, foodName) || other.foodName == foodName)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.healthType, healthType) || other.healthType == healthType)&&(identical(other.healthValue, healthValue) || other.healthValue == healthValue)&&(identical(other.healthExtraValue, healthExtraValue) || other.healthExtraValue == healthExtraValue));
}


@override
int get hashCode => Object.hash(runtimeType,type,sequence,groupUuid,recordDate,foodName,calories,healthType,healthValue,healthExtraValue);

@override
String toString() {
  return 'Log(type: $type, sequence: $sequence, groupUuid: $groupUuid, recordDate: $recordDate, foodName: $foodName, calories: $calories, healthType: $healthType, healthValue: $healthValue, healthExtraValue: $healthExtraValue)';
}


}

/// @nodoc
abstract mixin class $LogCopyWith<$Res>  {
  factory $LogCopyWith(Log value, $Res Function(Log) _then) = _$LogCopyWithImpl;
@useResult
$Res call({
 TimelineLogType type, int sequence, String groupUuid, DateTime recordDate, String? foodName, double? calories, HealthLogType? healthType, double? healthValue, double? healthExtraValue
});




}
/// @nodoc
class _$LogCopyWithImpl<$Res>
    implements $LogCopyWith<$Res> {
  _$LogCopyWithImpl(this._self, this._then);

  final Log _self;
  final $Res Function(Log) _then;

/// Create a copy of Log
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? sequence = null,Object? groupUuid = null,Object? recordDate = null,Object? foodName = freezed,Object? calories = freezed,Object? healthType = freezed,Object? healthValue = freezed,Object? healthExtraValue = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TimelineLogType,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,groupUuid: null == groupUuid ? _self.groupUuid : groupUuid // ignore: cast_nullable_to_non_nullable
as String,recordDate: null == recordDate ? _self.recordDate : recordDate // ignore: cast_nullable_to_non_nullable
as DateTime,foodName: freezed == foodName ? _self.foodName : foodName // ignore: cast_nullable_to_non_nullable
as String?,calories: freezed == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double?,healthType: freezed == healthType ? _self.healthType : healthType // ignore: cast_nullable_to_non_nullable
as HealthLogType?,healthValue: freezed == healthValue ? _self.healthValue : healthValue // ignore: cast_nullable_to_non_nullable
as double?,healthExtraValue: freezed == healthExtraValue ? _self.healthExtraValue : healthExtraValue // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Log].
extension LogPatterns on Log {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Log value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Log() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Log value)  $default,){
final _that = this;
switch (_that) {
case _Log():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Log value)?  $default,){
final _that = this;
switch (_that) {
case _Log() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TimelineLogType type,  int sequence,  String groupUuid,  DateTime recordDate,  String? foodName,  double? calories,  HealthLogType? healthType,  double? healthValue,  double? healthExtraValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Log() when $default != null:
return $default(_that.type,_that.sequence,_that.groupUuid,_that.recordDate,_that.foodName,_that.calories,_that.healthType,_that.healthValue,_that.healthExtraValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TimelineLogType type,  int sequence,  String groupUuid,  DateTime recordDate,  String? foodName,  double? calories,  HealthLogType? healthType,  double? healthValue,  double? healthExtraValue)  $default,) {final _that = this;
switch (_that) {
case _Log():
return $default(_that.type,_that.sequence,_that.groupUuid,_that.recordDate,_that.foodName,_that.calories,_that.healthType,_that.healthValue,_that.healthExtraValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TimelineLogType type,  int sequence,  String groupUuid,  DateTime recordDate,  String? foodName,  double? calories,  HealthLogType? healthType,  double? healthValue,  double? healthExtraValue)?  $default,) {final _that = this;
switch (_that) {
case _Log() when $default != null:
return $default(_that.type,_that.sequence,_that.groupUuid,_that.recordDate,_that.foodName,_that.calories,_that.healthType,_that.healthValue,_that.healthExtraValue);case _:
  return null;

}
}

}

/// @nodoc


class _Log implements Log {
   _Log({required this.type, required this.sequence, required this.groupUuid, required this.recordDate, this.foodName, this.calories, this.healthType, this.healthValue, this.healthExtraValue});
  

@override final  TimelineLogType type;
@override final  int sequence;
@override final  String groupUuid;
@override final  DateTime recordDate;
@override final  String? foodName;
@override final  double? calories;
@override final  HealthLogType? healthType;
@override final  double? healthValue;
@override final  double? healthExtraValue;

/// Create a copy of Log
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogCopyWith<_Log> get copyWith => __$LogCopyWithImpl<_Log>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Log&&(identical(other.type, type) || other.type == type)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.groupUuid, groupUuid) || other.groupUuid == groupUuid)&&(identical(other.recordDate, recordDate) || other.recordDate == recordDate)&&(identical(other.foodName, foodName) || other.foodName == foodName)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.healthType, healthType) || other.healthType == healthType)&&(identical(other.healthValue, healthValue) || other.healthValue == healthValue)&&(identical(other.healthExtraValue, healthExtraValue) || other.healthExtraValue == healthExtraValue));
}


@override
int get hashCode => Object.hash(runtimeType,type,sequence,groupUuid,recordDate,foodName,calories,healthType,healthValue,healthExtraValue);

@override
String toString() {
  return 'Log(type: $type, sequence: $sequence, groupUuid: $groupUuid, recordDate: $recordDate, foodName: $foodName, calories: $calories, healthType: $healthType, healthValue: $healthValue, healthExtraValue: $healthExtraValue)';
}


}

/// @nodoc
abstract mixin class _$LogCopyWith<$Res> implements $LogCopyWith<$Res> {
  factory _$LogCopyWith(_Log value, $Res Function(_Log) _then) = __$LogCopyWithImpl;
@override @useResult
$Res call({
 TimelineLogType type, int sequence, String groupUuid, DateTime recordDate, String? foodName, double? calories, HealthLogType? healthType, double? healthValue, double? healthExtraValue
});




}
/// @nodoc
class __$LogCopyWithImpl<$Res>
    implements _$LogCopyWith<$Res> {
  __$LogCopyWithImpl(this._self, this._then);

  final _Log _self;
  final $Res Function(_Log) _then;

/// Create a copy of Log
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? sequence = null,Object? groupUuid = null,Object? recordDate = null,Object? foodName = freezed,Object? calories = freezed,Object? healthType = freezed,Object? healthValue = freezed,Object? healthExtraValue = freezed,}) {
  return _then(_Log(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TimelineLogType,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,groupUuid: null == groupUuid ? _self.groupUuid : groupUuid // ignore: cast_nullable_to_non_nullable
as String,recordDate: null == recordDate ? _self.recordDate : recordDate // ignore: cast_nullable_to_non_nullable
as DateTime,foodName: freezed == foodName ? _self.foodName : foodName // ignore: cast_nullable_to_non_nullable
as String?,calories: freezed == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double?,healthType: freezed == healthType ? _self.healthType : healthType // ignore: cast_nullable_to_non_nullable
as HealthLogType?,healthValue: freezed == healthValue ? _self.healthValue : healthValue // ignore: cast_nullable_to_non_nullable
as double?,healthExtraValue: freezed == healthExtraValue ? _self.healthExtraValue : healthExtraValue // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$FoodLog {

 int get sequence; String get foodName; double get calories;// int, double 호환
 DateTime get recordDate; String get groupUuid;
/// Create a copy of FoodLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodLogCopyWith<FoodLog> get copyWith => _$FoodLogCopyWithImpl<FoodLog>(this as FoodLog, _$identity);

  /// Serializes this FoodLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodLog&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.foodName, foodName) || other.foodName == foodName)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.recordDate, recordDate) || other.recordDate == recordDate)&&(identical(other.groupUuid, groupUuid) || other.groupUuid == groupUuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sequence,foodName,calories,recordDate,groupUuid);

@override
String toString() {
  return 'FoodLog(sequence: $sequence, foodName: $foodName, calories: $calories, recordDate: $recordDate, groupUuid: $groupUuid)';
}


}

/// @nodoc
abstract mixin class $FoodLogCopyWith<$Res>  {
  factory $FoodLogCopyWith(FoodLog value, $Res Function(FoodLog) _then) = _$FoodLogCopyWithImpl;
@useResult
$Res call({
 int sequence, String foodName, double calories, DateTime recordDate, String groupUuid
});




}
/// @nodoc
class _$FoodLogCopyWithImpl<$Res>
    implements $FoodLogCopyWith<$Res> {
  _$FoodLogCopyWithImpl(this._self, this._then);

  final FoodLog _self;
  final $Res Function(FoodLog) _then;

/// Create a copy of FoodLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sequence = null,Object? foodName = null,Object? calories = null,Object? recordDate = null,Object? groupUuid = null,}) {
  return _then(_self.copyWith(
sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,foodName: null == foodName ? _self.foodName : foodName // ignore: cast_nullable_to_non_nullable
as String,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double,recordDate: null == recordDate ? _self.recordDate : recordDate // ignore: cast_nullable_to_non_nullable
as DateTime,groupUuid: null == groupUuid ? _self.groupUuid : groupUuid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FoodLog].
extension FoodLogPatterns on FoodLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodLog value)  $default,){
final _that = this;
switch (_that) {
case _FoodLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodLog value)?  $default,){
final _that = this;
switch (_that) {
case _FoodLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sequence,  String foodName,  double calories,  DateTime recordDate,  String groupUuid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodLog() when $default != null:
return $default(_that.sequence,_that.foodName,_that.calories,_that.recordDate,_that.groupUuid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sequence,  String foodName,  double calories,  DateTime recordDate,  String groupUuid)  $default,) {final _that = this;
switch (_that) {
case _FoodLog():
return $default(_that.sequence,_that.foodName,_that.calories,_that.recordDate,_that.groupUuid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sequence,  String foodName,  double calories,  DateTime recordDate,  String groupUuid)?  $default,) {final _that = this;
switch (_that) {
case _FoodLog() when $default != null:
return $default(_that.sequence,_that.foodName,_that.calories,_that.recordDate,_that.groupUuid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FoodLog implements FoodLog {
   _FoodLog({required this.sequence, required this.foodName, required this.calories, required this.recordDate, required this.groupUuid});
  factory _FoodLog.fromJson(Map<String, dynamic> json) => _$FoodLogFromJson(json);

@override final  int sequence;
@override final  String foodName;
@override final  double calories;
// int, double 호환
@override final  DateTime recordDate;
@override final  String groupUuid;

/// Create a copy of FoodLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodLogCopyWith<_FoodLog> get copyWith => __$FoodLogCopyWithImpl<_FoodLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodLog&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.foodName, foodName) || other.foodName == foodName)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.recordDate, recordDate) || other.recordDate == recordDate)&&(identical(other.groupUuid, groupUuid) || other.groupUuid == groupUuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sequence,foodName,calories,recordDate,groupUuid);

@override
String toString() {
  return 'FoodLog(sequence: $sequence, foodName: $foodName, calories: $calories, recordDate: $recordDate, groupUuid: $groupUuid)';
}


}

/// @nodoc
abstract mixin class _$FoodLogCopyWith<$Res> implements $FoodLogCopyWith<$Res> {
  factory _$FoodLogCopyWith(_FoodLog value, $Res Function(_FoodLog) _then) = __$FoodLogCopyWithImpl;
@override @useResult
$Res call({
 int sequence, String foodName, double calories, DateTime recordDate, String groupUuid
});




}
/// @nodoc
class __$FoodLogCopyWithImpl<$Res>
    implements _$FoodLogCopyWith<$Res> {
  __$FoodLogCopyWithImpl(this._self, this._then);

  final _FoodLog _self;
  final $Res Function(_FoodLog) _then;

/// Create a copy of FoodLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sequence = null,Object? foodName = null,Object? calories = null,Object? recordDate = null,Object? groupUuid = null,}) {
  return _then(_FoodLog(
sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,foodName: null == foodName ? _self.foodName : foodName // ignore: cast_nullable_to_non_nullable
as String,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double,recordDate: null == recordDate ? _self.recordDate : recordDate // ignore: cast_nullable_to_non_nullable
as DateTime,groupUuid: null == groupUuid ? _self.groupUuid : groupUuid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$HealthLog {

 int get sequence; String get groupUuid; HealthLogType get healthType; double get healthValue; DateTime get recordDate; double? get healthExtraValue;
/// Create a copy of HealthLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthLogCopyWith<HealthLog> get copyWith => _$HealthLogCopyWithImpl<HealthLog>(this as HealthLog, _$identity);

  /// Serializes this HealthLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthLog&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.groupUuid, groupUuid) || other.groupUuid == groupUuid)&&(identical(other.healthType, healthType) || other.healthType == healthType)&&(identical(other.healthValue, healthValue) || other.healthValue == healthValue)&&(identical(other.recordDate, recordDate) || other.recordDate == recordDate)&&(identical(other.healthExtraValue, healthExtraValue) || other.healthExtraValue == healthExtraValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sequence,groupUuid,healthType,healthValue,recordDate,healthExtraValue);

@override
String toString() {
  return 'HealthLog(sequence: $sequence, groupUuid: $groupUuid, healthType: $healthType, healthValue: $healthValue, recordDate: $recordDate, healthExtraValue: $healthExtraValue)';
}


}

/// @nodoc
abstract mixin class $HealthLogCopyWith<$Res>  {
  factory $HealthLogCopyWith(HealthLog value, $Res Function(HealthLog) _then) = _$HealthLogCopyWithImpl;
@useResult
$Res call({
 int sequence, String groupUuid, HealthLogType healthType, double healthValue, DateTime recordDate, double? healthExtraValue
});




}
/// @nodoc
class _$HealthLogCopyWithImpl<$Res>
    implements $HealthLogCopyWith<$Res> {
  _$HealthLogCopyWithImpl(this._self, this._then);

  final HealthLog _self;
  final $Res Function(HealthLog) _then;

/// Create a copy of HealthLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sequence = null,Object? groupUuid = null,Object? healthType = null,Object? healthValue = null,Object? recordDate = null,Object? healthExtraValue = freezed,}) {
  return _then(_self.copyWith(
sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,groupUuid: null == groupUuid ? _self.groupUuid : groupUuid // ignore: cast_nullable_to_non_nullable
as String,healthType: null == healthType ? _self.healthType : healthType // ignore: cast_nullable_to_non_nullable
as HealthLogType,healthValue: null == healthValue ? _self.healthValue : healthValue // ignore: cast_nullable_to_non_nullable
as double,recordDate: null == recordDate ? _self.recordDate : recordDate // ignore: cast_nullable_to_non_nullable
as DateTime,healthExtraValue: freezed == healthExtraValue ? _self.healthExtraValue : healthExtraValue // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthLog].
extension HealthLogPatterns on HealthLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthLog value)  $default,){
final _that = this;
switch (_that) {
case _HealthLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthLog value)?  $default,){
final _that = this;
switch (_that) {
case _HealthLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sequence,  String groupUuid,  HealthLogType healthType,  double healthValue,  DateTime recordDate,  double? healthExtraValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthLog() when $default != null:
return $default(_that.sequence,_that.groupUuid,_that.healthType,_that.healthValue,_that.recordDate,_that.healthExtraValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sequence,  String groupUuid,  HealthLogType healthType,  double healthValue,  DateTime recordDate,  double? healthExtraValue)  $default,) {final _that = this;
switch (_that) {
case _HealthLog():
return $default(_that.sequence,_that.groupUuid,_that.healthType,_that.healthValue,_that.recordDate,_that.healthExtraValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sequence,  String groupUuid,  HealthLogType healthType,  double healthValue,  DateTime recordDate,  double? healthExtraValue)?  $default,) {final _that = this;
switch (_that) {
case _HealthLog() when $default != null:
return $default(_that.sequence,_that.groupUuid,_that.healthType,_that.healthValue,_that.recordDate,_that.healthExtraValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthLog implements HealthLog {
   _HealthLog({required this.sequence, required this.groupUuid, required this.healthType, required this.healthValue, required this.recordDate, this.healthExtraValue});
  factory _HealthLog.fromJson(Map<String, dynamic> json) => _$HealthLogFromJson(json);

@override final  int sequence;
@override final  String groupUuid;
@override final  HealthLogType healthType;
@override final  double healthValue;
@override final  DateTime recordDate;
@override final  double? healthExtraValue;

/// Create a copy of HealthLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthLogCopyWith<_HealthLog> get copyWith => __$HealthLogCopyWithImpl<_HealthLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthLog&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.groupUuid, groupUuid) || other.groupUuid == groupUuid)&&(identical(other.healthType, healthType) || other.healthType == healthType)&&(identical(other.healthValue, healthValue) || other.healthValue == healthValue)&&(identical(other.recordDate, recordDate) || other.recordDate == recordDate)&&(identical(other.healthExtraValue, healthExtraValue) || other.healthExtraValue == healthExtraValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sequence,groupUuid,healthType,healthValue,recordDate,healthExtraValue);

@override
String toString() {
  return 'HealthLog(sequence: $sequence, groupUuid: $groupUuid, healthType: $healthType, healthValue: $healthValue, recordDate: $recordDate, healthExtraValue: $healthExtraValue)';
}


}

/// @nodoc
abstract mixin class _$HealthLogCopyWith<$Res> implements $HealthLogCopyWith<$Res> {
  factory _$HealthLogCopyWith(_HealthLog value, $Res Function(_HealthLog) _then) = __$HealthLogCopyWithImpl;
@override @useResult
$Res call({
 int sequence, String groupUuid, HealthLogType healthType, double healthValue, DateTime recordDate, double? healthExtraValue
});




}
/// @nodoc
class __$HealthLogCopyWithImpl<$Res>
    implements _$HealthLogCopyWith<$Res> {
  __$HealthLogCopyWithImpl(this._self, this._then);

  final _HealthLog _self;
  final $Res Function(_HealthLog) _then;

/// Create a copy of HealthLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sequence = null,Object? groupUuid = null,Object? healthType = null,Object? healthValue = null,Object? recordDate = null,Object? healthExtraValue = freezed,}) {
  return _then(_HealthLog(
sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,groupUuid: null == groupUuid ? _self.groupUuid : groupUuid // ignore: cast_nullable_to_non_nullable
as String,healthType: null == healthType ? _self.healthType : healthType // ignore: cast_nullable_to_non_nullable
as HealthLogType,healthValue: null == healthValue ? _self.healthValue : healthValue // ignore: cast_nullable_to_non_nullable
as double,recordDate: null == recordDate ? _self.recordDate : recordDate // ignore: cast_nullable_to_non_nullable
as DateTime,healthExtraValue: freezed == healthExtraValue ? _self.healthExtraValue : healthExtraValue // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
