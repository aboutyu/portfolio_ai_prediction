import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_model.freezed.dart';
part 'notice_model.g.dart';

/// 1. 공지사항 타입 Enum (DB: varchar -> Dart: Enum)
enum NoticeType {
  @JsonValue('notice')
  notice,
  @JsonValue('faq')
  faq,
}

/// 2. FAQ 종류 Enum (DB: varchar -> Dart: Enum)
enum NoticeFaqType {
  @JsonValue('user')
  user,
  @JsonValue('service')
  service,
  @JsonValue('payment')
  payment,
  @JsonValue('unknown')
  unknown,
}

@freezed
abstract class NoticeModel with _$NoticeModel {
  const factory NoticeModel({
    /// 1. Sequence (PK)
    required int sequence,

    /// 2. Notice Type (Default: NOTICE)
    /// JSON에 값이 없거나 매칭되지 않으면 unknown 처리하려면
    /// @Default(NoticeType.notice) 사용
    @Default(NoticeType.notice) NoticeType type,

    /// 3. FAQ Kind (Nullable)
    /// DB에서 Null일 수 있으므로 Dart에서도 Nullable(?)로 선언
    NoticeFaqType? faqKind,

    /// 4. Title
    required String title,

    /// 5. Content (HTML or Text)
    required String content,

    /// 6. Create Date
    /// TypeORM의 Date는 JSON으로 직렬화될 때 ISO8601 String으로 넘어옴
    /// Dart의 DateTime이 이를 자동으로 파싱함
    required DateTime createDate,

    /// 7. Is Activate
    /// TypeORM Transformer에 의해 DB에는 'Y'/'N'이지만
    /// API JSON 응답은 boolean(true/false)으로 내려오므로 bool 사용
    @Default(false) bool isActivate,

    String? categoryName,
  }) = _NoticeModel;

  factory NoticeModel.fromJson(Map<String, dynamic> json) =>
      _$NoticeModelFromJson(json);
}
