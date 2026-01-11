import 'package:app/helpers/dto/base_page_request.dto.dart';
import 'package:app/helpers/dto/base_request.dto.dart';

enum RecordFoodModelType { local, gemini }

class RecordFoodAnalysisDto extends BaseRequestDto {
  final String foodName;
  final RecordFoodModelType useModel;

  RecordFoodAnalysisDto({
    required this.foodName,
    this.useModel = RecordFoodModelType.gemini,
  });

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'foodName': foodName,
      'useModel': useModel.toString(),
    };
    return map;
  }
}

class RecordFoodSearchDto extends BasePageRequestDto {
  final String foodName;

  RecordFoodSearchDto({
    required super.page,
    required super.pageNum,
    required this.foodName,
  });

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['foodName'] = foodName;
    return map;
  }
}
