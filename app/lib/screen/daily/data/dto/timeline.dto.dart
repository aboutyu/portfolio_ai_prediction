import 'package:app/helpers/dto/base_page_request.dto.dart';

class TimelineDto extends BasePageRequestDto {
  final DateTime? date;

  TimelineDto({required super.page, required super.pageNum, this.date});

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    if (date != null) {
      map['date'] = date!.toIso8601String();
    }
    return map;
  }
}
