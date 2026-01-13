import 'package:app/helpers/dto/base_request.dto.dart';

class RecordFoodLogDto extends BaseRequestDto {
  List<RecordFoodSaveDto> records;

  RecordFoodLogDto({required this.records});

  @override
  Map<String, dynamic> toJson() {
    return {"records": records.map((record) => record.toJson()).toList()};
  }
}

class RecordFoodSaveDto extends BaseRequestDto {
  final String foodName;
  final double calories;
  final DateTime recordDate;
  final String? memo;

  RecordFoodSaveDto({
    required this.foodName,
    required this.calories,
    required this.recordDate,
    this.memo,
  });

  @override
  Map<String, dynamic> toJson() {
    final recordDateString = recordDate.toUtc().toIso8601String();

    final map = <String, dynamic>{
      "foodName": foodName,
      "calories": calories,
      "recordDate": recordDateString,
      "memo": memo,
    };
    return map;
  }
}
