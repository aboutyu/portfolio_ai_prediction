import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:app/screen/daily/data/repositories/record_health_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'record_health_view_model.g.dart';

@riverpod
class RecordHealthViewModel extends _$RecordHealthViewModel {
  @override
  void build() async {
    return;
  }

  Future<List<HealthLog>> addRecordHealthLog(
    HealthLogType healthType,
    double healthValue,
    double? healthExtraValue,
    String? memo,
    DateTime recordDate,
  ) async {
    try {
      final repository = ref.read(recordHealthRepositoryProvider);
      final response = await repository.addRecordHealthLog(
        healthType,
        healthValue,
        healthExtraValue,
        memo,
        recordDate,
      );

      if (response.data == null || response.data!.isEmpty) {
        return [];
      }

      return response.data!;
    } catch (e) {
      debugMessage('Error fetching timeline: $e');
      rethrow;
    }
  }

  Future<List<HealthLog>> updateRecordHealthLog(
    int sequence,
    String groupUuid,
    HealthLogType healthType,
    double healthValue,
    double? healthExtraValue,
    String? memo,
    DateTime recordDate,
  ) async {
    try {
      final repository = ref.read(recordHealthRepositoryProvider);
      final response = await repository.updateRecordHealthLog(
        sequence,
        groupUuid,
        healthType,
        healthValue,
        healthExtraValue,
        memo,
        recordDate,
      );

      if (response.data == null || response.data!.isEmpty) {
        return [];
      }

      return response.data!;
    } catch (e) {
      debugMessage('Error fetching timeline: $e');
      rethrow;
    }
  }

  Future<HealthLog?> deleteRecordHealthLog(int sequence) async {
    try {
      final repository = ref.read(recordHealthRepositoryProvider);
      final response = await repository.deleteRecordHealthLog(sequence);
      return response.data;
    } catch (e) {
      debugMessage('Error fetching timeline: $e');
      rethrow;
    }
  }
}
