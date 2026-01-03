import 'package:app/helpers/dto/base_request.dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum TermsType {
  @JsonValue('service')
  service,
  @JsonValue('privacy')
  privacy,
  @JsonValue('marketing')
  marketing,
}

class TermsDto implements BaseRequestDto {
  final int? sequence;
  final TermsType type;

  TermsDto({this.sequence, required this.type});

  @override
  Map<String, dynamic> toJson() {
    return {"sequence": sequence, "type": type};
  }
}
