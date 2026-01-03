import 'package:app/screen/auth/data/dto/terms.dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_model.freezed.dart';
part 'terms_model.g.dart';

@freezed
abstract class TermsModel with _$TermsModel {
  const factory TermsModel({
    /// Primary Key
    required int sequence,

    /// 약관 타입 (Enum)
    @Default(TermsType.service) TermsType type,

    /// 약관 제목
    required String title,

    /// 약관 내용
    required String content,

    /// 필수 동의 여부
    required bool isRequired,

    /// 활성화 여부
    required bool isActivate,

    /// 생성일
    required DateTime createDate,

    required String termsName,
  }) = _TermsModel;

  factory TermsModel.fromJson(Map<String, dynamic> json) =>
      _$TermsModelFromJson(json);
}
