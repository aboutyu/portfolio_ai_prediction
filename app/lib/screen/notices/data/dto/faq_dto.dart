import 'package:app/helpers/dto/base_page_request.dto.dart';
import 'package:app/screen/notices/data/models/notice_model.dart';

class FaqDto extends BasePageRequestDto {
  final NoticeFaqType? faqType;

  FaqDto({required super.page, required super.pageNum, this.faqType});

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    if (faqType != null) {
      map['faqType'] = faqType!.toString();
    }
    return map;
  }
}
