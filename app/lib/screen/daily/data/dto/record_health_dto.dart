import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/dto/base_request.dto.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:intl/intl.dart';

class RecordHealthLogDto extends BaseRequestDto {
  List<RecordHealthDto> records;

  RecordHealthLogDto({required this.records});

  @override
  Map<String, dynamic> toJson() {
    return {"records": records.map((record) => record.toJson()).toList()};
  }
}

class RecordHealthDto extends BaseRequestDto {
  HealthLogType healthType;
  double healthValue;
  double? healthExtraValue;
  String? memo;
  DateTime recordDate;

  RecordHealthDto({
    required this.healthType,
    required this.healthValue,
    this.healthExtraValue,
    this.memo,
    required this.recordDate,
  });

  @override
  Map<String, dynamic> toJson() {
    final recordDateString = recordDate.toUtc().toIso8601String();

    // Timeline 날짜 체크를 위해 로컬 날짜 전달
    final timelineDate = DateFormat('yyyy-MM-dd').format(recordDate.toLocal());

    return {
      "healthType": healthType.code,
      "healthValue": healthValue,
      "healthExtraValue": healthExtraValue,
      "deviceType": deviceType,
      "recordDate": recordDateString,
      "timelineDate": timelineDate,
      "memo": memo,
    };
  }
}
