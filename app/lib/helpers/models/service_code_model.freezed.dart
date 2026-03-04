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

 ServiceCodeType get code;// ITP, OBJ 등
 List<ServiceCodeItem> get items;
/// Create a copy of ServiceCodeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceCodeModelCopyWith<ServiceCodeModel> get copyWith => _$ServiceCodeModelCopyWithImpl<ServiceCodeModel>(this as ServiceCodeModel, _$identity);

  /// Serializes this ServiceCodeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceCodeModel&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ServiceCodeModel(code: $code, items: $items)';
}


}

/// @nodoc
abstract mixin class $ServiceCodeModelCopyWith<$Res>  {
  factory $ServiceCodeModelCopyWith(ServiceCodeModel value, $Res Function(ServiceCodeModel) _then) = _$ServiceCodeModelCopyWithImpl;
@useResult
$Res call({
 ServiceCodeType code, List<ServiceCodeItem> items
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
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? items = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as ServiceCodeType,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ServiceCodeItem>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ServiceCodeType code,  List<ServiceCodeItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceCodeModel() when $default != null:
return $default(_that.code,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ServiceCodeType code,  List<ServiceCodeItem> items)  $default,) {final _that = this;
switch (_that) {
case _ServiceCodeModel():
return $default(_that.code,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ServiceCodeType code,  List<ServiceCodeItem> items)?  $default,) {final _that = this;
switch (_that) {
case _ServiceCodeModel() when $default != null:
return $default(_that.code,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceCodeModel implements ServiceCodeModel {
  const _ServiceCodeModel({required this.code, required final  List<ServiceCodeItem> items}): _items = items;
  factory _ServiceCodeModel.fromJson(Map<String, dynamic> json) => _$ServiceCodeModelFromJson(json);

@override final  ServiceCodeType code;
// ITP, OBJ 등
 final  List<ServiceCodeItem> _items;
// ITP, OBJ 등
@override List<ServiceCodeItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceCodeModel&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ServiceCodeModel(code: $code, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ServiceCodeModelCopyWith<$Res> implements $ServiceCodeModelCopyWith<$Res> {
  factory _$ServiceCodeModelCopyWith(_ServiceCodeModel value, $Res Function(_ServiceCodeModel) _then) = __$ServiceCodeModelCopyWithImpl;
@override @useResult
$Res call({
 ServiceCodeType code, List<ServiceCodeItem> items
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
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? items = null,}) {
  return _then(_ServiceCodeModel(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as ServiceCodeType,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ServiceCodeItem>,
  ));
}


}


/// @nodoc
mixin _$ServiceCodeItem {

 String get code;// ITP001 등
 String get codeName;// 기본 이름 (Fallback용)
 ServiceCodeType get type;// ITP, OBJ
 Map<String, String>? get names;
/// Create a copy of ServiceCodeItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceCodeItemCopyWith<ServiceCodeItem> get copyWith => _$ServiceCodeItemCopyWithImpl<ServiceCodeItem>(this as ServiceCodeItem, _$identity);

  /// Serializes this ServiceCodeItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceCodeItem&&(identical(other.code, code) || other.code == code)&&(identical(other.codeName, codeName) || other.codeName == codeName)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.names, names));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,codeName,type,const DeepCollectionEquality().hash(names));

@override
String toString() {
  return 'ServiceCodeItem(code: $code, codeName: $codeName, type: $type, names: $names)';
}


}

/// @nodoc
abstract mixin class $ServiceCodeItemCopyWith<$Res>  {
  factory $ServiceCodeItemCopyWith(ServiceCodeItem value, $Res Function(ServiceCodeItem) _then) = _$ServiceCodeItemCopyWithImpl;
@useResult
$Res call({
 String code, String codeName, ServiceCodeType type, Map<String, String>? names
});




}
/// @nodoc
class _$ServiceCodeItemCopyWithImpl<$Res>
    implements $ServiceCodeItemCopyWith<$Res> {
  _$ServiceCodeItemCopyWithImpl(this._self, this._then);

  final ServiceCodeItem _self;
  final $Res Function(ServiceCodeItem) _then;

/// Create a copy of ServiceCodeItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? codeName = null,Object? type = null,Object? names = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,codeName: null == codeName ? _self.codeName : codeName // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ServiceCodeType,names: freezed == names ? _self.names : names // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceCodeItem].
extension ServiceCodeItemPatterns on ServiceCodeItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceCodeItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceCodeItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceCodeItem value)  $default,){
final _that = this;
switch (_that) {
case _ServiceCodeItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceCodeItem value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceCodeItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String codeName,  ServiceCodeType type,  Map<String, String>? names)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceCodeItem() when $default != null:
return $default(_that.code,_that.codeName,_that.type,_that.names);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String codeName,  ServiceCodeType type,  Map<String, String>? names)  $default,) {final _that = this;
switch (_that) {
case _ServiceCodeItem():
return $default(_that.code,_that.codeName,_that.type,_that.names);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String codeName,  ServiceCodeType type,  Map<String, String>? names)?  $default,) {final _that = this;
switch (_that) {
case _ServiceCodeItem() when $default != null:
return $default(_that.code,_that.codeName,_that.type,_that.names);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceCodeItem extends ServiceCodeItem {
  const _ServiceCodeItem({required this.code, required this.codeName, required this.type, final  Map<String, String>? names}): _names = names,super._();
  factory _ServiceCodeItem.fromJson(Map<String, dynamic> json) => _$ServiceCodeItemFromJson(json);

@override final  String code;
// ITP001 등
@override final  String codeName;
// 기본 이름 (Fallback용)
@override final  ServiceCodeType type;
// ITP, OBJ
 final  Map<String, String>? _names;
// ITP, OBJ
@override Map<String, String>? get names {
  final value = _names;
  if (value == null) return null;
  if (_names is EqualUnmodifiableMapView) return _names;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ServiceCodeItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceCodeItemCopyWith<_ServiceCodeItem> get copyWith => __$ServiceCodeItemCopyWithImpl<_ServiceCodeItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceCodeItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceCodeItem&&(identical(other.code, code) || other.code == code)&&(identical(other.codeName, codeName) || other.codeName == codeName)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._names, _names));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,codeName,type,const DeepCollectionEquality().hash(_names));

@override
String toString() {
  return 'ServiceCodeItem(code: $code, codeName: $codeName, type: $type, names: $names)';
}


}

/// @nodoc
abstract mixin class _$ServiceCodeItemCopyWith<$Res> implements $ServiceCodeItemCopyWith<$Res> {
  factory _$ServiceCodeItemCopyWith(_ServiceCodeItem value, $Res Function(_ServiceCodeItem) _then) = __$ServiceCodeItemCopyWithImpl;
@override @useResult
$Res call({
 String code, String codeName, ServiceCodeType type, Map<String, String>? names
});




}
/// @nodoc
class __$ServiceCodeItemCopyWithImpl<$Res>
    implements _$ServiceCodeItemCopyWith<$Res> {
  __$ServiceCodeItemCopyWithImpl(this._self, this._then);

  final _ServiceCodeItem _self;
  final $Res Function(_ServiceCodeItem) _then;

/// Create a copy of ServiceCodeItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? codeName = null,Object? type = null,Object? names = freezed,}) {
  return _then(_ServiceCodeItem(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,codeName: null == codeName ? _self.codeName : codeName // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ServiceCodeType,names: freezed == names ? _self._names : names // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}


}

// dart format on
