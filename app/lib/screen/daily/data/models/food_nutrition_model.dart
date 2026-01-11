import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_nutrition_model.freezed.dart';
part 'food_nutrition_model.g.dart';

@freezed
abstract class FoodNutritionModel with _$FoodNutritionModel {
  const FoodNutritionModel._();

  const factory FoodNutritionModel({
    // [1] 기본 식별 정보
    required String foodCode,
    required String foodName,
    String? representativeFoodName,

    // [2] 분류 정보
    String? categoryLarge,
    String? categoryMedium,
    String? categorySmall,

    // [3] 제조/유통 정보
    String? manufacturerName,
    String? foodManufactureNumber,
    String? importerName,
    String? distributorName,
    String? originCountry,
    @Default('N') String? isImported, // Y / N
    // [4] 데이터 소스 정보
    String? sourceName,
    String? providerName,
    String? dataGenMethod,
    DateTime? dataCreatedDate,

    // [5] 기준 규격
    String? servingStandardAmount,
    String? servingAAmount,
    String? foodAAmount,

    // [6] 영양 성분 데이터 (TypeORM의 Decimal 10,3 대응)
    double? energyKcal,
    double? moistureG,
    double? proteinG,
    double? fatG,
    double? ashG,
    double? carbohydrateG,
    double? sugarG,
    double? dietaryFiberG,
    double? calciumMg,
    double? ironMg,
    double? phosphorusMg,
    double? potassiumMg,
    double? sodiumMg,
    double? vitaminAUg,
    double? retinolUg,
    double? betaCaroteneUg,
    double? thiaminMg,
    double? riboflavinMg,
    double? niacinMg,
    double? vitaminCMg,
    double? vitaminDUg,
    double? cholesterolMg,
    double? saturatedFatG,
    double? transFatG,

    // 시스템 관리용
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _FoodNutritionModel;

  factory FoodNutritionModel.fromJson(Map<String, dynamic> json) =>
      _$FoodNutritionModelFromJson(json);

  /// AI 응답(JSON 객체 리스트)을 받아 모델 리스트로 변환하는 정적 메서드
  static List<FoodNutritionModel> fromAIResponse(
    dynamic aiResult,
    String foodCode,
  ) {
    // 배열/단일 객체 정규화 (TypeORM의 로직과 동일)
    List<dynamic> rawList = [];
    if (aiResult is List) {
      rawList = aiResult;
    } else if (aiResult is Map) {
      rawList = aiResult['foods'] ?? aiResult['data'] ?? [aiResult];
    }

    double safeNum(dynamic val) {
      if (val is num) return val.toDouble();
      if (val is String) return double.tryParse(val) ?? 0.0;
      return 0.0;
    }

    String? cleanString(dynamic val) {
      if (val == null || val == 0 || val == '0' || val == 'null' || val == '') {
        return null;
      }
      return val.toString();
    }

    return rawList.map((item) {
      final String fName =
          (item['foodName'] != null && item['foodName'] != 'null')
          ? item['foodName'].toString()
          : '';

      return FoodNutritionModel(
        foodCode: foodCode,
        foodName: fName,
        representativeFoodName: item['representativeFoodName'] ?? fName,
        categoryLarge: item['categoryLarge'] ?? 'AI 추천',
        categoryMedium: cleanString(item['categoryMedium']),
        categorySmall: cleanString(item['categorySmall']),
        manufacturerName: cleanString(item['manufacturerName']),
        foodManufactureNumber: cleanString(item['foodManufactureNumber']),
        importerName: cleanString(item['importerName']),
        distributorName: cleanString(item['distributorName']),
        originCountry: cleanString(item['originCountry']),
        isImported: (item['isImported'] == 'Y' || item['isImported'] == 'y')
            ? 'Y'
            : 'N',
        sourceName: 'AI Analysis',
        providerName: 'Personal AI Server',
        dataGenMethod: 'AI Prediction',
        dataCreatedDate: DateTime.now(),
        servingStandardAmount: item['servingStandardAmount'] ?? '100g',
        servingAAmount: item['servingAAmount'] ?? '100g',
        foodAAmount: cleanString(item['foodAAmount']),
        energyKcal: safeNum(item['energyKcal']),
        moistureG: safeNum(item['moistureG']),
        proteinG: safeNum(item['proteinG']),
        fatG: safeNum(item['fatG']),
        ashG: safeNum(item['ashG']),
        carbohydrateG: safeNum(item['carbohydrateG']),
        sugarG: safeNum(item['sugarG']),
        dietaryFiberG: safeNum(item['dietaryFiberG']),
        calciumMg: safeNum(item['calciumMg']),
        ironMg: safeNum(item['ironMg']),
        phosphorusMg: safeNum(item['phosphorusMg']),
        potassiumMg: safeNum(item['potassiumMg']),
        sodiumMg: safeNum(item['sodiumMg']),
        vitaminAUg: safeNum(item['vitaminAUg']),
        retinolUg: safeNum(item['retinolUg']),
        betaCaroteneUg: safeNum(item['betaCaroteneUg']),
        thiaminMg: safeNum(item['thiaminMg']),
        riboflavinMg: safeNum(item['riboflavinMg']),
        niacinMg: safeNum(item['niacinMg']),
        vitaminCMg: safeNum(item['vitaminCMg']),
        vitaminDUg: safeNum(item['vitaminDUg']),
        cholesterolMg: safeNum(item['cholesterolMg']),
        saturatedFatG: safeNum(item['saturatedFatG']),
        transFatG: safeNum(item['transFatG']),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    }).toList();
  }
}
