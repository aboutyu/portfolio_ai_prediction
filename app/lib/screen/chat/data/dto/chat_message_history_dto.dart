import 'package:app/helpers/dto/base_page_request.dto.dart';

class ChatMessageHistoryDto extends BasePageRequestDto {
  final String? keyword;

  ChatMessageHistoryDto({
    required super.page,
    required super.pageNum,
    this.keyword,
  });

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    if (keyword != null) {
      map['keyword'] = keyword;
    }
    return map;
  }
}
