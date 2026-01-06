import 'package:app/screen/notices/data/models/notice_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_category_model.freezed.dart';
part 'faq_category_model.g.dart';

@freezed
abstract class FaqCategoryModel with _$FaqCategoryModel {
  const factory FaqCategoryModel({
    /// JSON의 "user", "service" 문자열이 자동으로 NoticeFaqType Enum으로 변환됨
    required NoticeFaqType faqKind,

    /// "회원", "서비스" 등의 한글 명칭
    required String faqName,
  }) = _FaqCategoryModel;

  factory FaqCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$FaqCategoryModelFromJson(json);
}
