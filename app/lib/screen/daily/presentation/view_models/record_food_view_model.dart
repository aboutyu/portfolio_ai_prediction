import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/screen/daily/data/models/food_nutrition_model.dart';
import 'package:app/screen/daily/data/repositories/daily_repository.dart';
import 'package:app/screen/daily/data/repositories/record_food_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'record_food_view_model.g.dart';

@riverpod
class RecordFoodViewModel extends _$RecordFoodViewModel {
  @override
  Future<List<FoodNutritionModel>> build() async {
    return searchFoodNutrition(foodName: '');
  }

  Future<List<FoodNutritionModel>> searchFoodNutrition({
    int page = 0,
    int pageNum = 20,
    required String foodName,
  }) async {
    state = await AsyncValue.guard(() async {
      if (foodName.isEmpty) {
        return [];
      }

      try {
        final repository = ref.read(recordFoodRepositoryProvider);
        final response = await repository.searchFoodNutrition(
          page,
          pageNum,
          foodName,
        );

        if (response.data == null || response.data!.isEmpty) {
          return [];
        }

        return response.data!;
      } catch (e) {
        debugMessage('Error fetching timeline: $e');
        rethrow;
      }
    });
    return state.value ?? [];
  }
}
