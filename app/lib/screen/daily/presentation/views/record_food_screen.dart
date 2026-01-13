import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/extensions/async_value_extension.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/daily/data/dto/record_food_dto.dart';
import 'package:app/screen/daily/data/models/food_nutrition_model.dart';
import 'package:app/screen/daily/presentation/view_models/record_food_view_model.dart';
import 'package:app/screen/daily/presentation/widgets/food_info_widget.dart';
import 'package:app/widgets/appbar_widgets/appbar_widget.dart';
import 'package:app/widgets/show_dialogs/base_dialog.dart';
import 'package:app/widgets/show_dialogs/single_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordFoodScreen extends ConsumerStatefulWidget {
  const RecordFoodScreen({super.key});

  @override
  ConsumerState<RecordFoodScreen> createState() => _RecordFoodScreenState();
}

class _RecordFoodScreenState extends ConsumerState<RecordFoodScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ViewModel 상태 감시
    final foodResult = ref.watch(recordFoodViewModelProvider);

    return Scaffold(
      appBar: appBarWidget(context.tr.dailyFloatingFoodText),
      body: Column(
        children: [
          // 1. 상단 검색창 영역
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: context.tr.dialogSearchHintText,
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                    ),
                    // 엔터 키를 눌러도 검색 실행
                    onSubmitted: (_) async => await _onSearch(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _onSearch,
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 50),
                  ),
                  child: Text(context.tr.dialogSearchTitle),
                ),
              ],
            ),
          ),

          // 2. 하단 리스트 영역
          Expanded(
            child: foodResult.draws(
              data: (list) {
                if (list.isEmpty) {
                  return Center(child: Text(context.tr.searchResultNoText));
                }
                return _searchResultList(list);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onSearch() async {
    final query = _searchController.text.trim();
    await ref
        .read(recordFoodViewModelProvider.notifier)
        .searchFoodNutrition(foodName: query);
  }

  Widget _searchResultList(List<FoodNutritionModel> foods) {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        final item = foods[index];
        return ListTile(
          leading: Chip(
            label: Text(item.categoryLarge ?? context.tr.foodLogNoCategoryText),
          ),
          title: Text(item.foodName),
          subtitle: Text(
            '${context.tr.foodLogCaloryText}: ${item.energyKcal} kcal',
          ),
          onTap: () async => await _showModelSelection(context, item),
        );
      },
    );
  }

  Future<void> _showModelSelection(
    BuildContext context,
    FoodNutritionModel food,
  ) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('AI 모델 선택'),
          children: [
            // 검색결과 선택 버튼
            SimpleDialogOption(
              onPressed: () async {
                Navigator.pop(context); // 다이얼로그 닫기
                await _openFoodDetail(food);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.blue), // 아이콘 (선택사항)
                    SizedBox(width: 10),
                    Text('검색결과', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const Divider(), // 구분선
            SimpleDialogOption(
              onPressed: () async {
                Navigator.pop(context); // 다이얼로그 닫기
                await _searchAI(
                  context,
                  food.foodName,
                  RecordFoodModelType.gemini,
                ); // Gemini로 검색 호출
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.auto_awesome, color: Colors.blue), // 아이콘 (선택사항)
                    SizedBox(width: 10),
                    Text('Gemini', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const Divider(), // 구분선
            // Llama 선택 버튼
            SimpleDialogOption(
              onPressed: () async {
                Navigator.pop(context); // 다이얼로그 닫기
                await _searchAI(
                  context,
                  food.foodName,
                  RecordFoodModelType.local,
                ); // Llama로 검색 호출
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.smart_toy, color: Colors.orange), // 아이콘 (선택사항)
                    SizedBox(width: 10),
                    Text('Llama 3.2 1B', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _searchAI(
    BuildContext context,
    String foodName,
    RecordFoodModelType modelType,
  ) async {
    final viewModel = ref.read(recordFoodViewModelProvider.notifier);
    final result = await viewModel.fetchFoodNutritionAI(
      foodName: foodName,
      modelType: modelType,
    );

    if (result != null) {
      await _openFoodDetail(result);
    } else {
      SingleDialogWidget(
        content: context.tr.dailyNoLogsText,
        onConfirm: () => Navigator.pop(context, null),
      ).show(context);
    }
  }

  Future<void> _openFoodDetail(FoodNutritionModel food) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FoodInfoWidget(food: food, selectedDate: DateTime.now());
      },
    );
  }
}
