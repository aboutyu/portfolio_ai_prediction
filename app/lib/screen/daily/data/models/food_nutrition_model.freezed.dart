// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_nutrition_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FoodNutritionModel {

// [1] 기본 식별 정보
 String get foodCode; String get foodName; String? get representativeFoodName;// [2] 분류 정보
 String? get categoryLarge; String? get categoryMedium; String? get categorySmall;// [3] 제조/유통 정보
 String? get manufacturerName; String? get foodManufactureNumber; String? get importerName; String? get distributorName; String? get originCountry; String? get isImported;// Y / N
// [4] 데이터 소스 정보
 String? get sourceName; String? get providerName; String? get dataGenMethod; DateTime? get dataCreatedDate;// [5] 기준 규격
 String? get servingStandardAmount; String? get servingAAmount; String? get foodAAmount;// [6] 영양 성분 데이터 (TypeORM의 Decimal 10,3 대응)
 double? get energyKcal; double? get moistureG; double? get proteinG; double? get fatG; double? get ashG; double? get carbohydrateG; double? get sugarG; double? get dietaryFiberG; double? get calciumMg; double? get ironMg; double? get phosphorusMg; double? get potassiumMg; double? get sodiumMg; double? get vitaminAUg; double? get retinolUg; double? get betaCaroteneUg; double? get thiaminMg; double? get riboflavinMg; double? get niacinMg; double? get vitaminCMg; double? get vitaminDUg; double? get cholesterolMg; double? get saturatedFatG; double? get transFatG;// 시스템 관리용
 DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of FoodNutritionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodNutritionModelCopyWith<FoodNutritionModel> get copyWith => _$FoodNutritionModelCopyWithImpl<FoodNutritionModel>(this as FoodNutritionModel, _$identity);

  /// Serializes this FoodNutritionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodNutritionModel&&(identical(other.foodCode, foodCode) || other.foodCode == foodCode)&&(identical(other.foodName, foodName) || other.foodName == foodName)&&(identical(other.representativeFoodName, representativeFoodName) || other.representativeFoodName == representativeFoodName)&&(identical(other.categoryLarge, categoryLarge) || other.categoryLarge == categoryLarge)&&(identical(other.categoryMedium, categoryMedium) || other.categoryMedium == categoryMedium)&&(identical(other.categorySmall, categorySmall) || other.categorySmall == categorySmall)&&(identical(other.manufacturerName, manufacturerName) || other.manufacturerName == manufacturerName)&&(identical(other.foodManufactureNumber, foodManufactureNumber) || other.foodManufactureNumber == foodManufactureNumber)&&(identical(other.importerName, importerName) || other.importerName == importerName)&&(identical(other.distributorName, distributorName) || other.distributorName == distributorName)&&(identical(other.originCountry, originCountry) || other.originCountry == originCountry)&&(identical(other.isImported, isImported) || other.isImported == isImported)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName)&&(identical(other.providerName, providerName) || other.providerName == providerName)&&(identical(other.dataGenMethod, dataGenMethod) || other.dataGenMethod == dataGenMethod)&&(identical(other.dataCreatedDate, dataCreatedDate) || other.dataCreatedDate == dataCreatedDate)&&(identical(other.servingStandardAmount, servingStandardAmount) || other.servingStandardAmount == servingStandardAmount)&&(identical(other.servingAAmount, servingAAmount) || other.servingAAmount == servingAAmount)&&(identical(other.foodAAmount, foodAAmount) || other.foodAAmount == foodAAmount)&&(identical(other.energyKcal, energyKcal) || other.energyKcal == energyKcal)&&(identical(other.moistureG, moistureG) || other.moistureG == moistureG)&&(identical(other.proteinG, proteinG) || other.proteinG == proteinG)&&(identical(other.fatG, fatG) || other.fatG == fatG)&&(identical(other.ashG, ashG) || other.ashG == ashG)&&(identical(other.carbohydrateG, carbohydrateG) || other.carbohydrateG == carbohydrateG)&&(identical(other.sugarG, sugarG) || other.sugarG == sugarG)&&(identical(other.dietaryFiberG, dietaryFiberG) || other.dietaryFiberG == dietaryFiberG)&&(identical(other.calciumMg, calciumMg) || other.calciumMg == calciumMg)&&(identical(other.ironMg, ironMg) || other.ironMg == ironMg)&&(identical(other.phosphorusMg, phosphorusMg) || other.phosphorusMg == phosphorusMg)&&(identical(other.potassiumMg, potassiumMg) || other.potassiumMg == potassiumMg)&&(identical(other.sodiumMg, sodiumMg) || other.sodiumMg == sodiumMg)&&(identical(other.vitaminAUg, vitaminAUg) || other.vitaminAUg == vitaminAUg)&&(identical(other.retinolUg, retinolUg) || other.retinolUg == retinolUg)&&(identical(other.betaCaroteneUg, betaCaroteneUg) || other.betaCaroteneUg == betaCaroteneUg)&&(identical(other.thiaminMg, thiaminMg) || other.thiaminMg == thiaminMg)&&(identical(other.riboflavinMg, riboflavinMg) || other.riboflavinMg == riboflavinMg)&&(identical(other.niacinMg, niacinMg) || other.niacinMg == niacinMg)&&(identical(other.vitaminCMg, vitaminCMg) || other.vitaminCMg == vitaminCMg)&&(identical(other.vitaminDUg, vitaminDUg) || other.vitaminDUg == vitaminDUg)&&(identical(other.cholesterolMg, cholesterolMg) || other.cholesterolMg == cholesterolMg)&&(identical(other.saturatedFatG, saturatedFatG) || other.saturatedFatG == saturatedFatG)&&(identical(other.transFatG, transFatG) || other.transFatG == transFatG)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,foodCode,foodName,representativeFoodName,categoryLarge,categoryMedium,categorySmall,manufacturerName,foodManufactureNumber,importerName,distributorName,originCountry,isImported,sourceName,providerName,dataGenMethod,dataCreatedDate,servingStandardAmount,servingAAmount,foodAAmount,energyKcal,moistureG,proteinG,fatG,ashG,carbohydrateG,sugarG,dietaryFiberG,calciumMg,ironMg,phosphorusMg,potassiumMg,sodiumMg,vitaminAUg,retinolUg,betaCaroteneUg,thiaminMg,riboflavinMg,niacinMg,vitaminCMg,vitaminDUg,cholesterolMg,saturatedFatG,transFatG,createdAt,updatedAt]);

@override
String toString() {
  return 'FoodNutritionModel(foodCode: $foodCode, foodName: $foodName, representativeFoodName: $representativeFoodName, categoryLarge: $categoryLarge, categoryMedium: $categoryMedium, categorySmall: $categorySmall, manufacturerName: $manufacturerName, foodManufactureNumber: $foodManufactureNumber, importerName: $importerName, distributorName: $distributorName, originCountry: $originCountry, isImported: $isImported, sourceName: $sourceName, providerName: $providerName, dataGenMethod: $dataGenMethod, dataCreatedDate: $dataCreatedDate, servingStandardAmount: $servingStandardAmount, servingAAmount: $servingAAmount, foodAAmount: $foodAAmount, energyKcal: $energyKcal, moistureG: $moistureG, proteinG: $proteinG, fatG: $fatG, ashG: $ashG, carbohydrateG: $carbohydrateG, sugarG: $sugarG, dietaryFiberG: $dietaryFiberG, calciumMg: $calciumMg, ironMg: $ironMg, phosphorusMg: $phosphorusMg, potassiumMg: $potassiumMg, sodiumMg: $sodiumMg, vitaminAUg: $vitaminAUg, retinolUg: $retinolUg, betaCaroteneUg: $betaCaroteneUg, thiaminMg: $thiaminMg, riboflavinMg: $riboflavinMg, niacinMg: $niacinMg, vitaminCMg: $vitaminCMg, vitaminDUg: $vitaminDUg, cholesterolMg: $cholesterolMg, saturatedFatG: $saturatedFatG, transFatG: $transFatG, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FoodNutritionModelCopyWith<$Res>  {
  factory $FoodNutritionModelCopyWith(FoodNutritionModel value, $Res Function(FoodNutritionModel) _then) = _$FoodNutritionModelCopyWithImpl;
@useResult
$Res call({
 String foodCode, String foodName, String? representativeFoodName, String? categoryLarge, String? categoryMedium, String? categorySmall, String? manufacturerName, String? foodManufactureNumber, String? importerName, String? distributorName, String? originCountry, String? isImported, String? sourceName, String? providerName, String? dataGenMethod, DateTime? dataCreatedDate, String? servingStandardAmount, String? servingAAmount, String? foodAAmount, double? energyKcal, double? moistureG, double? proteinG, double? fatG, double? ashG, double? carbohydrateG, double? sugarG, double? dietaryFiberG, double? calciumMg, double? ironMg, double? phosphorusMg, double? potassiumMg, double? sodiumMg, double? vitaminAUg, double? retinolUg, double? betaCaroteneUg, double? thiaminMg, double? riboflavinMg, double? niacinMg, double? vitaminCMg, double? vitaminDUg, double? cholesterolMg, double? saturatedFatG, double? transFatG, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$FoodNutritionModelCopyWithImpl<$Res>
    implements $FoodNutritionModelCopyWith<$Res> {
  _$FoodNutritionModelCopyWithImpl(this._self, this._then);

  final FoodNutritionModel _self;
  final $Res Function(FoodNutritionModel) _then;

/// Create a copy of FoodNutritionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? foodCode = null,Object? foodName = null,Object? representativeFoodName = freezed,Object? categoryLarge = freezed,Object? categoryMedium = freezed,Object? categorySmall = freezed,Object? manufacturerName = freezed,Object? foodManufactureNumber = freezed,Object? importerName = freezed,Object? distributorName = freezed,Object? originCountry = freezed,Object? isImported = freezed,Object? sourceName = freezed,Object? providerName = freezed,Object? dataGenMethod = freezed,Object? dataCreatedDate = freezed,Object? servingStandardAmount = freezed,Object? servingAAmount = freezed,Object? foodAAmount = freezed,Object? energyKcal = freezed,Object? moistureG = freezed,Object? proteinG = freezed,Object? fatG = freezed,Object? ashG = freezed,Object? carbohydrateG = freezed,Object? sugarG = freezed,Object? dietaryFiberG = freezed,Object? calciumMg = freezed,Object? ironMg = freezed,Object? phosphorusMg = freezed,Object? potassiumMg = freezed,Object? sodiumMg = freezed,Object? vitaminAUg = freezed,Object? retinolUg = freezed,Object? betaCaroteneUg = freezed,Object? thiaminMg = freezed,Object? riboflavinMg = freezed,Object? niacinMg = freezed,Object? vitaminCMg = freezed,Object? vitaminDUg = freezed,Object? cholesterolMg = freezed,Object? saturatedFatG = freezed,Object? transFatG = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
foodCode: null == foodCode ? _self.foodCode : foodCode // ignore: cast_nullable_to_non_nullable
as String,foodName: null == foodName ? _self.foodName : foodName // ignore: cast_nullable_to_non_nullable
as String,representativeFoodName: freezed == representativeFoodName ? _self.representativeFoodName : representativeFoodName // ignore: cast_nullable_to_non_nullable
as String?,categoryLarge: freezed == categoryLarge ? _self.categoryLarge : categoryLarge // ignore: cast_nullable_to_non_nullable
as String?,categoryMedium: freezed == categoryMedium ? _self.categoryMedium : categoryMedium // ignore: cast_nullable_to_non_nullable
as String?,categorySmall: freezed == categorySmall ? _self.categorySmall : categorySmall // ignore: cast_nullable_to_non_nullable
as String?,manufacturerName: freezed == manufacturerName ? _self.manufacturerName : manufacturerName // ignore: cast_nullable_to_non_nullable
as String?,foodManufactureNumber: freezed == foodManufactureNumber ? _self.foodManufactureNumber : foodManufactureNumber // ignore: cast_nullable_to_non_nullable
as String?,importerName: freezed == importerName ? _self.importerName : importerName // ignore: cast_nullable_to_non_nullable
as String?,distributorName: freezed == distributorName ? _self.distributorName : distributorName // ignore: cast_nullable_to_non_nullable
as String?,originCountry: freezed == originCountry ? _self.originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as String?,isImported: freezed == isImported ? _self.isImported : isImported // ignore: cast_nullable_to_non_nullable
as String?,sourceName: freezed == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String?,providerName: freezed == providerName ? _self.providerName : providerName // ignore: cast_nullable_to_non_nullable
as String?,dataGenMethod: freezed == dataGenMethod ? _self.dataGenMethod : dataGenMethod // ignore: cast_nullable_to_non_nullable
as String?,dataCreatedDate: freezed == dataCreatedDate ? _self.dataCreatedDate : dataCreatedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,servingStandardAmount: freezed == servingStandardAmount ? _self.servingStandardAmount : servingStandardAmount // ignore: cast_nullable_to_non_nullable
as String?,servingAAmount: freezed == servingAAmount ? _self.servingAAmount : servingAAmount // ignore: cast_nullable_to_non_nullable
as String?,foodAAmount: freezed == foodAAmount ? _self.foodAAmount : foodAAmount // ignore: cast_nullable_to_non_nullable
as String?,energyKcal: freezed == energyKcal ? _self.energyKcal : energyKcal // ignore: cast_nullable_to_non_nullable
as double?,moistureG: freezed == moistureG ? _self.moistureG : moistureG // ignore: cast_nullable_to_non_nullable
as double?,proteinG: freezed == proteinG ? _self.proteinG : proteinG // ignore: cast_nullable_to_non_nullable
as double?,fatG: freezed == fatG ? _self.fatG : fatG // ignore: cast_nullable_to_non_nullable
as double?,ashG: freezed == ashG ? _self.ashG : ashG // ignore: cast_nullable_to_non_nullable
as double?,carbohydrateG: freezed == carbohydrateG ? _self.carbohydrateG : carbohydrateG // ignore: cast_nullable_to_non_nullable
as double?,sugarG: freezed == sugarG ? _self.sugarG : sugarG // ignore: cast_nullable_to_non_nullable
as double?,dietaryFiberG: freezed == dietaryFiberG ? _self.dietaryFiberG : dietaryFiberG // ignore: cast_nullable_to_non_nullable
as double?,calciumMg: freezed == calciumMg ? _self.calciumMg : calciumMg // ignore: cast_nullable_to_non_nullable
as double?,ironMg: freezed == ironMg ? _self.ironMg : ironMg // ignore: cast_nullable_to_non_nullable
as double?,phosphorusMg: freezed == phosphorusMg ? _self.phosphorusMg : phosphorusMg // ignore: cast_nullable_to_non_nullable
as double?,potassiumMg: freezed == potassiumMg ? _self.potassiumMg : potassiumMg // ignore: cast_nullable_to_non_nullable
as double?,sodiumMg: freezed == sodiumMg ? _self.sodiumMg : sodiumMg // ignore: cast_nullable_to_non_nullable
as double?,vitaminAUg: freezed == vitaminAUg ? _self.vitaminAUg : vitaminAUg // ignore: cast_nullable_to_non_nullable
as double?,retinolUg: freezed == retinolUg ? _self.retinolUg : retinolUg // ignore: cast_nullable_to_non_nullable
as double?,betaCaroteneUg: freezed == betaCaroteneUg ? _self.betaCaroteneUg : betaCaroteneUg // ignore: cast_nullable_to_non_nullable
as double?,thiaminMg: freezed == thiaminMg ? _self.thiaminMg : thiaminMg // ignore: cast_nullable_to_non_nullable
as double?,riboflavinMg: freezed == riboflavinMg ? _self.riboflavinMg : riboflavinMg // ignore: cast_nullable_to_non_nullable
as double?,niacinMg: freezed == niacinMg ? _self.niacinMg : niacinMg // ignore: cast_nullable_to_non_nullable
as double?,vitaminCMg: freezed == vitaminCMg ? _self.vitaminCMg : vitaminCMg // ignore: cast_nullable_to_non_nullable
as double?,vitaminDUg: freezed == vitaminDUg ? _self.vitaminDUg : vitaminDUg // ignore: cast_nullable_to_non_nullable
as double?,cholesterolMg: freezed == cholesterolMg ? _self.cholesterolMg : cholesterolMg // ignore: cast_nullable_to_non_nullable
as double?,saturatedFatG: freezed == saturatedFatG ? _self.saturatedFatG : saturatedFatG // ignore: cast_nullable_to_non_nullable
as double?,transFatG: freezed == transFatG ? _self.transFatG : transFatG // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FoodNutritionModel].
extension FoodNutritionModelPatterns on FoodNutritionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodNutritionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodNutritionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodNutritionModel value)  $default,){
final _that = this;
switch (_that) {
case _FoodNutritionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodNutritionModel value)?  $default,){
final _that = this;
switch (_that) {
case _FoodNutritionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String foodCode,  String foodName,  String? representativeFoodName,  String? categoryLarge,  String? categoryMedium,  String? categorySmall,  String? manufacturerName,  String? foodManufactureNumber,  String? importerName,  String? distributorName,  String? originCountry,  String? isImported,  String? sourceName,  String? providerName,  String? dataGenMethod,  DateTime? dataCreatedDate,  String? servingStandardAmount,  String? servingAAmount,  String? foodAAmount,  double? energyKcal,  double? moistureG,  double? proteinG,  double? fatG,  double? ashG,  double? carbohydrateG,  double? sugarG,  double? dietaryFiberG,  double? calciumMg,  double? ironMg,  double? phosphorusMg,  double? potassiumMg,  double? sodiumMg,  double? vitaminAUg,  double? retinolUg,  double? betaCaroteneUg,  double? thiaminMg,  double? riboflavinMg,  double? niacinMg,  double? vitaminCMg,  double? vitaminDUg,  double? cholesterolMg,  double? saturatedFatG,  double? transFatG,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodNutritionModel() when $default != null:
return $default(_that.foodCode,_that.foodName,_that.representativeFoodName,_that.categoryLarge,_that.categoryMedium,_that.categorySmall,_that.manufacturerName,_that.foodManufactureNumber,_that.importerName,_that.distributorName,_that.originCountry,_that.isImported,_that.sourceName,_that.providerName,_that.dataGenMethod,_that.dataCreatedDate,_that.servingStandardAmount,_that.servingAAmount,_that.foodAAmount,_that.energyKcal,_that.moistureG,_that.proteinG,_that.fatG,_that.ashG,_that.carbohydrateG,_that.sugarG,_that.dietaryFiberG,_that.calciumMg,_that.ironMg,_that.phosphorusMg,_that.potassiumMg,_that.sodiumMg,_that.vitaminAUg,_that.retinolUg,_that.betaCaroteneUg,_that.thiaminMg,_that.riboflavinMg,_that.niacinMg,_that.vitaminCMg,_that.vitaminDUg,_that.cholesterolMg,_that.saturatedFatG,_that.transFatG,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String foodCode,  String foodName,  String? representativeFoodName,  String? categoryLarge,  String? categoryMedium,  String? categorySmall,  String? manufacturerName,  String? foodManufactureNumber,  String? importerName,  String? distributorName,  String? originCountry,  String? isImported,  String? sourceName,  String? providerName,  String? dataGenMethod,  DateTime? dataCreatedDate,  String? servingStandardAmount,  String? servingAAmount,  String? foodAAmount,  double? energyKcal,  double? moistureG,  double? proteinG,  double? fatG,  double? ashG,  double? carbohydrateG,  double? sugarG,  double? dietaryFiberG,  double? calciumMg,  double? ironMg,  double? phosphorusMg,  double? potassiumMg,  double? sodiumMg,  double? vitaminAUg,  double? retinolUg,  double? betaCaroteneUg,  double? thiaminMg,  double? riboflavinMg,  double? niacinMg,  double? vitaminCMg,  double? vitaminDUg,  double? cholesterolMg,  double? saturatedFatG,  double? transFatG,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _FoodNutritionModel():
return $default(_that.foodCode,_that.foodName,_that.representativeFoodName,_that.categoryLarge,_that.categoryMedium,_that.categorySmall,_that.manufacturerName,_that.foodManufactureNumber,_that.importerName,_that.distributorName,_that.originCountry,_that.isImported,_that.sourceName,_that.providerName,_that.dataGenMethod,_that.dataCreatedDate,_that.servingStandardAmount,_that.servingAAmount,_that.foodAAmount,_that.energyKcal,_that.moistureG,_that.proteinG,_that.fatG,_that.ashG,_that.carbohydrateG,_that.sugarG,_that.dietaryFiberG,_that.calciumMg,_that.ironMg,_that.phosphorusMg,_that.potassiumMg,_that.sodiumMg,_that.vitaminAUg,_that.retinolUg,_that.betaCaroteneUg,_that.thiaminMg,_that.riboflavinMg,_that.niacinMg,_that.vitaminCMg,_that.vitaminDUg,_that.cholesterolMg,_that.saturatedFatG,_that.transFatG,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String foodCode,  String foodName,  String? representativeFoodName,  String? categoryLarge,  String? categoryMedium,  String? categorySmall,  String? manufacturerName,  String? foodManufactureNumber,  String? importerName,  String? distributorName,  String? originCountry,  String? isImported,  String? sourceName,  String? providerName,  String? dataGenMethod,  DateTime? dataCreatedDate,  String? servingStandardAmount,  String? servingAAmount,  String? foodAAmount,  double? energyKcal,  double? moistureG,  double? proteinG,  double? fatG,  double? ashG,  double? carbohydrateG,  double? sugarG,  double? dietaryFiberG,  double? calciumMg,  double? ironMg,  double? phosphorusMg,  double? potassiumMg,  double? sodiumMg,  double? vitaminAUg,  double? retinolUg,  double? betaCaroteneUg,  double? thiaminMg,  double? riboflavinMg,  double? niacinMg,  double? vitaminCMg,  double? vitaminDUg,  double? cholesterolMg,  double? saturatedFatG,  double? transFatG,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _FoodNutritionModel() when $default != null:
return $default(_that.foodCode,_that.foodName,_that.representativeFoodName,_that.categoryLarge,_that.categoryMedium,_that.categorySmall,_that.manufacturerName,_that.foodManufactureNumber,_that.importerName,_that.distributorName,_that.originCountry,_that.isImported,_that.sourceName,_that.providerName,_that.dataGenMethod,_that.dataCreatedDate,_that.servingStandardAmount,_that.servingAAmount,_that.foodAAmount,_that.energyKcal,_that.moistureG,_that.proteinG,_that.fatG,_that.ashG,_that.carbohydrateG,_that.sugarG,_that.dietaryFiberG,_that.calciumMg,_that.ironMg,_that.phosphorusMg,_that.potassiumMg,_that.sodiumMg,_that.vitaminAUg,_that.retinolUg,_that.betaCaroteneUg,_that.thiaminMg,_that.riboflavinMg,_that.niacinMg,_that.vitaminCMg,_that.vitaminDUg,_that.cholesterolMg,_that.saturatedFatG,_that.transFatG,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FoodNutritionModel extends FoodNutritionModel {
  const _FoodNutritionModel({required this.foodCode, required this.foodName, this.representativeFoodName, this.categoryLarge, this.categoryMedium, this.categorySmall, this.manufacturerName, this.foodManufactureNumber, this.importerName, this.distributorName, this.originCountry, this.isImported = 'N', this.sourceName, this.providerName, this.dataGenMethod, this.dataCreatedDate, this.servingStandardAmount, this.servingAAmount, this.foodAAmount, this.energyKcal, this.moistureG, this.proteinG, this.fatG, this.ashG, this.carbohydrateG, this.sugarG, this.dietaryFiberG, this.calciumMg, this.ironMg, this.phosphorusMg, this.potassiumMg, this.sodiumMg, this.vitaminAUg, this.retinolUg, this.betaCaroteneUg, this.thiaminMg, this.riboflavinMg, this.niacinMg, this.vitaminCMg, this.vitaminDUg, this.cholesterolMg, this.saturatedFatG, this.transFatG, this.createdAt, this.updatedAt}): super._();
  factory _FoodNutritionModel.fromJson(Map<String, dynamic> json) => _$FoodNutritionModelFromJson(json);

// [1] 기본 식별 정보
@override final  String foodCode;
@override final  String foodName;
@override final  String? representativeFoodName;
// [2] 분류 정보
@override final  String? categoryLarge;
@override final  String? categoryMedium;
@override final  String? categorySmall;
// [3] 제조/유통 정보
@override final  String? manufacturerName;
@override final  String? foodManufactureNumber;
@override final  String? importerName;
@override final  String? distributorName;
@override final  String? originCountry;
@override@JsonKey() final  String? isImported;
// Y / N
// [4] 데이터 소스 정보
@override final  String? sourceName;
@override final  String? providerName;
@override final  String? dataGenMethod;
@override final  DateTime? dataCreatedDate;
// [5] 기준 규격
@override final  String? servingStandardAmount;
@override final  String? servingAAmount;
@override final  String? foodAAmount;
// [6] 영양 성분 데이터 (TypeORM의 Decimal 10,3 대응)
@override final  double? energyKcal;
@override final  double? moistureG;
@override final  double? proteinG;
@override final  double? fatG;
@override final  double? ashG;
@override final  double? carbohydrateG;
@override final  double? sugarG;
@override final  double? dietaryFiberG;
@override final  double? calciumMg;
@override final  double? ironMg;
@override final  double? phosphorusMg;
@override final  double? potassiumMg;
@override final  double? sodiumMg;
@override final  double? vitaminAUg;
@override final  double? retinolUg;
@override final  double? betaCaroteneUg;
@override final  double? thiaminMg;
@override final  double? riboflavinMg;
@override final  double? niacinMg;
@override final  double? vitaminCMg;
@override final  double? vitaminDUg;
@override final  double? cholesterolMg;
@override final  double? saturatedFatG;
@override final  double? transFatG;
// 시스템 관리용
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of FoodNutritionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodNutritionModelCopyWith<_FoodNutritionModel> get copyWith => __$FoodNutritionModelCopyWithImpl<_FoodNutritionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodNutritionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodNutritionModel&&(identical(other.foodCode, foodCode) || other.foodCode == foodCode)&&(identical(other.foodName, foodName) || other.foodName == foodName)&&(identical(other.representativeFoodName, representativeFoodName) || other.representativeFoodName == representativeFoodName)&&(identical(other.categoryLarge, categoryLarge) || other.categoryLarge == categoryLarge)&&(identical(other.categoryMedium, categoryMedium) || other.categoryMedium == categoryMedium)&&(identical(other.categorySmall, categorySmall) || other.categorySmall == categorySmall)&&(identical(other.manufacturerName, manufacturerName) || other.manufacturerName == manufacturerName)&&(identical(other.foodManufactureNumber, foodManufactureNumber) || other.foodManufactureNumber == foodManufactureNumber)&&(identical(other.importerName, importerName) || other.importerName == importerName)&&(identical(other.distributorName, distributorName) || other.distributorName == distributorName)&&(identical(other.originCountry, originCountry) || other.originCountry == originCountry)&&(identical(other.isImported, isImported) || other.isImported == isImported)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName)&&(identical(other.providerName, providerName) || other.providerName == providerName)&&(identical(other.dataGenMethod, dataGenMethod) || other.dataGenMethod == dataGenMethod)&&(identical(other.dataCreatedDate, dataCreatedDate) || other.dataCreatedDate == dataCreatedDate)&&(identical(other.servingStandardAmount, servingStandardAmount) || other.servingStandardAmount == servingStandardAmount)&&(identical(other.servingAAmount, servingAAmount) || other.servingAAmount == servingAAmount)&&(identical(other.foodAAmount, foodAAmount) || other.foodAAmount == foodAAmount)&&(identical(other.energyKcal, energyKcal) || other.energyKcal == energyKcal)&&(identical(other.moistureG, moistureG) || other.moistureG == moistureG)&&(identical(other.proteinG, proteinG) || other.proteinG == proteinG)&&(identical(other.fatG, fatG) || other.fatG == fatG)&&(identical(other.ashG, ashG) || other.ashG == ashG)&&(identical(other.carbohydrateG, carbohydrateG) || other.carbohydrateG == carbohydrateG)&&(identical(other.sugarG, sugarG) || other.sugarG == sugarG)&&(identical(other.dietaryFiberG, dietaryFiberG) || other.dietaryFiberG == dietaryFiberG)&&(identical(other.calciumMg, calciumMg) || other.calciumMg == calciumMg)&&(identical(other.ironMg, ironMg) || other.ironMg == ironMg)&&(identical(other.phosphorusMg, phosphorusMg) || other.phosphorusMg == phosphorusMg)&&(identical(other.potassiumMg, potassiumMg) || other.potassiumMg == potassiumMg)&&(identical(other.sodiumMg, sodiumMg) || other.sodiumMg == sodiumMg)&&(identical(other.vitaminAUg, vitaminAUg) || other.vitaminAUg == vitaminAUg)&&(identical(other.retinolUg, retinolUg) || other.retinolUg == retinolUg)&&(identical(other.betaCaroteneUg, betaCaroteneUg) || other.betaCaroteneUg == betaCaroteneUg)&&(identical(other.thiaminMg, thiaminMg) || other.thiaminMg == thiaminMg)&&(identical(other.riboflavinMg, riboflavinMg) || other.riboflavinMg == riboflavinMg)&&(identical(other.niacinMg, niacinMg) || other.niacinMg == niacinMg)&&(identical(other.vitaminCMg, vitaminCMg) || other.vitaminCMg == vitaminCMg)&&(identical(other.vitaminDUg, vitaminDUg) || other.vitaminDUg == vitaminDUg)&&(identical(other.cholesterolMg, cholesterolMg) || other.cholesterolMg == cholesterolMg)&&(identical(other.saturatedFatG, saturatedFatG) || other.saturatedFatG == saturatedFatG)&&(identical(other.transFatG, transFatG) || other.transFatG == transFatG)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,foodCode,foodName,representativeFoodName,categoryLarge,categoryMedium,categorySmall,manufacturerName,foodManufactureNumber,importerName,distributorName,originCountry,isImported,sourceName,providerName,dataGenMethod,dataCreatedDate,servingStandardAmount,servingAAmount,foodAAmount,energyKcal,moistureG,proteinG,fatG,ashG,carbohydrateG,sugarG,dietaryFiberG,calciumMg,ironMg,phosphorusMg,potassiumMg,sodiumMg,vitaminAUg,retinolUg,betaCaroteneUg,thiaminMg,riboflavinMg,niacinMg,vitaminCMg,vitaminDUg,cholesterolMg,saturatedFatG,transFatG,createdAt,updatedAt]);

@override
String toString() {
  return 'FoodNutritionModel(foodCode: $foodCode, foodName: $foodName, representativeFoodName: $representativeFoodName, categoryLarge: $categoryLarge, categoryMedium: $categoryMedium, categorySmall: $categorySmall, manufacturerName: $manufacturerName, foodManufactureNumber: $foodManufactureNumber, importerName: $importerName, distributorName: $distributorName, originCountry: $originCountry, isImported: $isImported, sourceName: $sourceName, providerName: $providerName, dataGenMethod: $dataGenMethod, dataCreatedDate: $dataCreatedDate, servingStandardAmount: $servingStandardAmount, servingAAmount: $servingAAmount, foodAAmount: $foodAAmount, energyKcal: $energyKcal, moistureG: $moistureG, proteinG: $proteinG, fatG: $fatG, ashG: $ashG, carbohydrateG: $carbohydrateG, sugarG: $sugarG, dietaryFiberG: $dietaryFiberG, calciumMg: $calciumMg, ironMg: $ironMg, phosphorusMg: $phosphorusMg, potassiumMg: $potassiumMg, sodiumMg: $sodiumMg, vitaminAUg: $vitaminAUg, retinolUg: $retinolUg, betaCaroteneUg: $betaCaroteneUg, thiaminMg: $thiaminMg, riboflavinMg: $riboflavinMg, niacinMg: $niacinMg, vitaminCMg: $vitaminCMg, vitaminDUg: $vitaminDUg, cholesterolMg: $cholesterolMg, saturatedFatG: $saturatedFatG, transFatG: $transFatG, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FoodNutritionModelCopyWith<$Res> implements $FoodNutritionModelCopyWith<$Res> {
  factory _$FoodNutritionModelCopyWith(_FoodNutritionModel value, $Res Function(_FoodNutritionModel) _then) = __$FoodNutritionModelCopyWithImpl;
@override @useResult
$Res call({
 String foodCode, String foodName, String? representativeFoodName, String? categoryLarge, String? categoryMedium, String? categorySmall, String? manufacturerName, String? foodManufactureNumber, String? importerName, String? distributorName, String? originCountry, String? isImported, String? sourceName, String? providerName, String? dataGenMethod, DateTime? dataCreatedDate, String? servingStandardAmount, String? servingAAmount, String? foodAAmount, double? energyKcal, double? moistureG, double? proteinG, double? fatG, double? ashG, double? carbohydrateG, double? sugarG, double? dietaryFiberG, double? calciumMg, double? ironMg, double? phosphorusMg, double? potassiumMg, double? sodiumMg, double? vitaminAUg, double? retinolUg, double? betaCaroteneUg, double? thiaminMg, double? riboflavinMg, double? niacinMg, double? vitaminCMg, double? vitaminDUg, double? cholesterolMg, double? saturatedFatG, double? transFatG, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$FoodNutritionModelCopyWithImpl<$Res>
    implements _$FoodNutritionModelCopyWith<$Res> {
  __$FoodNutritionModelCopyWithImpl(this._self, this._then);

  final _FoodNutritionModel _self;
  final $Res Function(_FoodNutritionModel) _then;

/// Create a copy of FoodNutritionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? foodCode = null,Object? foodName = null,Object? representativeFoodName = freezed,Object? categoryLarge = freezed,Object? categoryMedium = freezed,Object? categorySmall = freezed,Object? manufacturerName = freezed,Object? foodManufactureNumber = freezed,Object? importerName = freezed,Object? distributorName = freezed,Object? originCountry = freezed,Object? isImported = freezed,Object? sourceName = freezed,Object? providerName = freezed,Object? dataGenMethod = freezed,Object? dataCreatedDate = freezed,Object? servingStandardAmount = freezed,Object? servingAAmount = freezed,Object? foodAAmount = freezed,Object? energyKcal = freezed,Object? moistureG = freezed,Object? proteinG = freezed,Object? fatG = freezed,Object? ashG = freezed,Object? carbohydrateG = freezed,Object? sugarG = freezed,Object? dietaryFiberG = freezed,Object? calciumMg = freezed,Object? ironMg = freezed,Object? phosphorusMg = freezed,Object? potassiumMg = freezed,Object? sodiumMg = freezed,Object? vitaminAUg = freezed,Object? retinolUg = freezed,Object? betaCaroteneUg = freezed,Object? thiaminMg = freezed,Object? riboflavinMg = freezed,Object? niacinMg = freezed,Object? vitaminCMg = freezed,Object? vitaminDUg = freezed,Object? cholesterolMg = freezed,Object? saturatedFatG = freezed,Object? transFatG = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_FoodNutritionModel(
foodCode: null == foodCode ? _self.foodCode : foodCode // ignore: cast_nullable_to_non_nullable
as String,foodName: null == foodName ? _self.foodName : foodName // ignore: cast_nullable_to_non_nullable
as String,representativeFoodName: freezed == representativeFoodName ? _self.representativeFoodName : representativeFoodName // ignore: cast_nullable_to_non_nullable
as String?,categoryLarge: freezed == categoryLarge ? _self.categoryLarge : categoryLarge // ignore: cast_nullable_to_non_nullable
as String?,categoryMedium: freezed == categoryMedium ? _self.categoryMedium : categoryMedium // ignore: cast_nullable_to_non_nullable
as String?,categorySmall: freezed == categorySmall ? _self.categorySmall : categorySmall // ignore: cast_nullable_to_non_nullable
as String?,manufacturerName: freezed == manufacturerName ? _self.manufacturerName : manufacturerName // ignore: cast_nullable_to_non_nullable
as String?,foodManufactureNumber: freezed == foodManufactureNumber ? _self.foodManufactureNumber : foodManufactureNumber // ignore: cast_nullable_to_non_nullable
as String?,importerName: freezed == importerName ? _self.importerName : importerName // ignore: cast_nullable_to_non_nullable
as String?,distributorName: freezed == distributorName ? _self.distributorName : distributorName // ignore: cast_nullable_to_non_nullable
as String?,originCountry: freezed == originCountry ? _self.originCountry : originCountry // ignore: cast_nullable_to_non_nullable
as String?,isImported: freezed == isImported ? _self.isImported : isImported // ignore: cast_nullable_to_non_nullable
as String?,sourceName: freezed == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String?,providerName: freezed == providerName ? _self.providerName : providerName // ignore: cast_nullable_to_non_nullable
as String?,dataGenMethod: freezed == dataGenMethod ? _self.dataGenMethod : dataGenMethod // ignore: cast_nullable_to_non_nullable
as String?,dataCreatedDate: freezed == dataCreatedDate ? _self.dataCreatedDate : dataCreatedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,servingStandardAmount: freezed == servingStandardAmount ? _self.servingStandardAmount : servingStandardAmount // ignore: cast_nullable_to_non_nullable
as String?,servingAAmount: freezed == servingAAmount ? _self.servingAAmount : servingAAmount // ignore: cast_nullable_to_non_nullable
as String?,foodAAmount: freezed == foodAAmount ? _self.foodAAmount : foodAAmount // ignore: cast_nullable_to_non_nullable
as String?,energyKcal: freezed == energyKcal ? _self.energyKcal : energyKcal // ignore: cast_nullable_to_non_nullable
as double?,moistureG: freezed == moistureG ? _self.moistureG : moistureG // ignore: cast_nullable_to_non_nullable
as double?,proteinG: freezed == proteinG ? _self.proteinG : proteinG // ignore: cast_nullable_to_non_nullable
as double?,fatG: freezed == fatG ? _self.fatG : fatG // ignore: cast_nullable_to_non_nullable
as double?,ashG: freezed == ashG ? _self.ashG : ashG // ignore: cast_nullable_to_non_nullable
as double?,carbohydrateG: freezed == carbohydrateG ? _self.carbohydrateG : carbohydrateG // ignore: cast_nullable_to_non_nullable
as double?,sugarG: freezed == sugarG ? _self.sugarG : sugarG // ignore: cast_nullable_to_non_nullable
as double?,dietaryFiberG: freezed == dietaryFiberG ? _self.dietaryFiberG : dietaryFiberG // ignore: cast_nullable_to_non_nullable
as double?,calciumMg: freezed == calciumMg ? _self.calciumMg : calciumMg // ignore: cast_nullable_to_non_nullable
as double?,ironMg: freezed == ironMg ? _self.ironMg : ironMg // ignore: cast_nullable_to_non_nullable
as double?,phosphorusMg: freezed == phosphorusMg ? _self.phosphorusMg : phosphorusMg // ignore: cast_nullable_to_non_nullable
as double?,potassiumMg: freezed == potassiumMg ? _self.potassiumMg : potassiumMg // ignore: cast_nullable_to_non_nullable
as double?,sodiumMg: freezed == sodiumMg ? _self.sodiumMg : sodiumMg // ignore: cast_nullable_to_non_nullable
as double?,vitaminAUg: freezed == vitaminAUg ? _self.vitaminAUg : vitaminAUg // ignore: cast_nullable_to_non_nullable
as double?,retinolUg: freezed == retinolUg ? _self.retinolUg : retinolUg // ignore: cast_nullable_to_non_nullable
as double?,betaCaroteneUg: freezed == betaCaroteneUg ? _self.betaCaroteneUg : betaCaroteneUg // ignore: cast_nullable_to_non_nullable
as double?,thiaminMg: freezed == thiaminMg ? _self.thiaminMg : thiaminMg // ignore: cast_nullable_to_non_nullable
as double?,riboflavinMg: freezed == riboflavinMg ? _self.riboflavinMg : riboflavinMg // ignore: cast_nullable_to_non_nullable
as double?,niacinMg: freezed == niacinMg ? _self.niacinMg : niacinMg // ignore: cast_nullable_to_non_nullable
as double?,vitaminCMg: freezed == vitaminCMg ? _self.vitaminCMg : vitaminCMg // ignore: cast_nullable_to_non_nullable
as double?,vitaminDUg: freezed == vitaminDUg ? _self.vitaminDUg : vitaminDUg // ignore: cast_nullable_to_non_nullable
as double?,cholesterolMg: freezed == cholesterolMg ? _self.cholesterolMg : cholesterolMg // ignore: cast_nullable_to_non_nullable
as double?,saturatedFatG: freezed == saturatedFatG ? _self.saturatedFatG : saturatedFatG // ignore: cast_nullable_to_non_nullable
as double?,transFatG: freezed == transFatG ? _self.transFatG : transFatG // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
