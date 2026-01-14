import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/daily/data/models/food_nutrition_model.dart';
import 'package:app/screen/daily/presentation/view_models/record_food_view_model.dart';
import 'package:app/screen/daily/presentation/widgets/record_datetime_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodInfoWidget extends ConsumerWidget {
  const FoodInfoWidget({
    super.key,
    required this.food,
    required this.selectedDate,
  });

  final FoodNutritionModel food;
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 30),
      child: Column(
        children: [
          // 1. 상단 핸들 바 (드래그 불가 시각적 장식용)
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // 2. 스크롤 가능한 영역 (Expanded로 남은 공간 채움)
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. 날짜 선택 행
                  RecordDateTimeWidget(
                    selectedDate: selectedDate,
                    isChangeable: false,
                    onTap: () async => {},
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      // 음식 이름
                      Text(
                        food.foodName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        food.sourceName ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  Text(
                    '${context.tr.foodLogServingSizeText}: ${food.servingAAmount ?? '-'}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),

                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),

                  // 영양 정보들
                  _buildNutritionRow(
                    context.tr.foodLogCaloryText,
                    '${food.energyKcal ?? 0} kcal',
                    isHighlight: true,
                  ),
                  const SizedBox(height: 16),
                  _buildNutritionRow(
                    context.tr.foodLogCarbohydrateText,
                    '${food.carbohydrateG ?? 0} g',
                  ),
                  _buildNutritionRow(
                    context.tr.foodLogProteinText,
                    '${food.proteinG ?? 0} g',
                  ),
                  _buildNutritionRow(
                    context.tr.foodLogFatText,
                    '${food.fatG ?? 0} g',
                  ),
                  const SizedBox(height: 8),
                  _buildNutritionRow(
                    context.tr.foodLogSugarText,
                    '${food.sugarG ?? 0} g',
                    isSmall: true,
                  ),
                  _buildNutritionRow(
                    context.tr.foodLogSodiumText,
                    '${food.sodiumMg ?? 0} mg',
                    isSmall: true,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // 3. 하단 고정 닫기 버튼 (스크롤과 무관하게 항상 떠 있음)
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,

            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    context.tr.dialogClosedTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async => await _onSave(context, ref),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    context.tr.dialogSavedTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 영양 정보 한 줄을 만드는 헬퍼 위젯
  Widget _buildNutritionRow(
    String label,
    String value, {
    bool isHighlight = false,
    bool isSmall = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isSmall ? 4.0 : 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isHighlight ? 18 : (isSmall ? 14 : 16),
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.w500,
              color: isSmall ? Colors.grey[600] : Colors.black87,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isHighlight ? 18 : (isSmall ? 14 : 16),
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
              color: isHighlight ? Colors.blueAccent : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onSave(BuildContext context, WidgetRef ref) async {
    try {
      ref
          .read(recordFoodViewModelProvider.notifier)
          .saveFoodRecord(
            food.foodName,
            food.energyKcal ?? 0,
            selectedDate,
            null,
          );

      Navigator.pop(context);
    } catch (e) {
      debugMessage('Error saving food record: $e');
    }
  }
}
