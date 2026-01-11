import 'package:app/helpers/extensions/async_value_extension.dart';
import 'package:app/screen/daily/presentation/view_models/record_food_view_model.dart';
import 'package:app/widgets/appbar_widgets/appbar_widget.dart';
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
      appBar: appBarWidget('음식 기록하기'),
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
                    decoration: const InputDecoration(
                      hintText: '검색어를 입력하세요',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                    // 엔터 키를 눌러도 검색 실행
                    onSubmitted: (_) async => await _onSearch(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _onSearch,
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(80, 50),
                  ),
                  child: const Text('검색'),
                ),
              ],
            ),
          ),

          // 2. 하단 리스트 영역
          Expanded(
            child: foodResult.draws(
              data: (list) {
                if (list.isEmpty) {
                  return const Center(child: Text('검색 결과가 없습니다.'));
                }
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return ListTile(
                      leading: Chip(label: Text(item.categoryLarge ?? '미분류')),
                      title: Text(item.foodName),
                      subtitle: Text(item.createdAt.toString().split('T')[0]),
                      onTap: () {
                        // 클릭 시 상세 페이지 이동 등
                      },
                    );
                  },
                );
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
}
