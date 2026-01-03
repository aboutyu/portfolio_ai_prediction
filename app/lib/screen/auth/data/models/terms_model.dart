import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_model.freezed.dart';
part 'terms_model.g.dart';

enum TermsType {
  @JsonValue('service')
  service,
  @JsonValue('privacy')
  privacy,
  @JsonValue('marketing')
  marketing,
}

@freezed
abstract class TermsModel with _$TermsModel {
  const factory TermsModel({
    /// Primary Key
    required int sequence,

    /// 약관 타입 (Enum)
    @Default(TermsType.service) TermsType type,

    /// 약관 제목
    @Default('') String title,

    /// 약관 내용
    @Default('') String content,

    /// 필수 동의 여부
    @Default(false) bool isRequired,

    /// 활성화 여부
    @Default(false) bool isActivate,

    /// 생성일
    DateTime? createDate,

    required String termsName,
  }) = _TermsModel;

  factory TermsModel.fromJson(Map<String, dynamic> json) =>
      _$TermsModelFromJson(json);
}
