import 'package:app/helpers/networks/core_api_provider.dart';
import 'package:app/helpers/networks/enums/api_endpoint.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/screen/daily/data/dto/record_food_dto.dart';
import 'package:app/screen/daily/data/dto/record_food_save_dto.dart';
import 'package:app/screen/daily/data/models/food_nutrition_model.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'record_food_repository.g.dart';

@riverpod
RecordFoodRepository recordFoodRepository(Ref ref) {
  final client = ref.watch(coreApiProviderProvider);
  return RecordFoodRepository(client);
}

class RecordFoodRepository {
  final CoreApiProvider _client;

  RecordFoodRepository(this._client);

  Future<CoreResponse<List<FoodNutritionModel>>> searchFoodNutrition(
    int page,
    int pageNum,
    String foodName,
  ) async {
    final dto = RecordFoodSearchDto(
      page: page,
      pageNum: pageNum,
      foodName: foodName,
    );

    return await _client.request<List<FoodNutritionModel>>(
      endpoint: ApiEndpoint.recordFoodSearch,
      dto: dto,
    );
  }

  Future<CoreResponse<List<FoodNutritionModel>>> fetchFoodNutritionAI(
    String foodName,
    RecordFoodModelType modelType,
  ) async {
    final dto = RecordFoodAnalysisDto(foodName: foodName, useModel: modelType);

    return await _client.request<List<FoodNutritionModel>>(
      endpoint: ApiEndpoint.recordFoodAnalysis,
      dto: dto,
    );
  }

  Future<CoreResponse<List<FoodLog>>> recordFood(
    String foodName,
    double calories,
    DateTime recordDate,
    String? memo,
  ) async {
    final recordFoodLogDto = RecordFoodSaveDto(
      foodName: foodName,
      calories: calories,
      recordDate: recordDate,
      memo: memo,
    );
    final dto = RecordFoodLogDto(records: [recordFoodLogDto]);

    return await _client.request<List<FoodLog>>(
      endpoint: ApiEndpoint.recordFood,
      dto: dto,
    );
  }
}
