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
  //   {
  //   "sequence": 1,
  //   "groupUuid": "550e8400-e29b-41d4-a716-446655440000",
  //   "healthType": "SCT",
  //   "healthValue": 1,
  //   "healthExtraValue": 1,
  //   "deviceType": "IOS",
  //   "recordDate": "2024-06-01T12:00:00Z"
  // }

  HealthLogType healthType;
  double healthValue;
  DateTime recordDate;

  int? sequence;
  String? groupUuid;
  double? healthExtraValue;
  String? memo;

  RecordHealthDto({
    required this.healthType,
    required this.healthValue,
    required this.recordDate,

    this.sequence,
    this.groupUuid,
    this.healthExtraValue,
    this.memo,
  });

  @override
  Map<String, dynamic> toJson() {
    final recordDateString = recordDate.toUtc().toIso8601String();

    // Timeline 날짜 체크를 위해 로컬 날짜 전달
    final timelineDate = DateFormat('yyyy-MM-dd').format(recordDate.toLocal());

    return {
      "sequence": sequence,
      "groupUuid": groupUuid,
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
