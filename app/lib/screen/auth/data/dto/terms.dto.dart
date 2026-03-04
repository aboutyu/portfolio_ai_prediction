import 'package:app/helpers/dto/base_request.dto.dart';
import 'package:app/screen/auth/data/models/terms_model.dart';

class TermsDto implements BaseRequestDto {
  final int? sequence;
  final TermsType type;

  TermsDto({this.sequence, required this.type});

  @override
  Map<String, dynamic> toJson() {
    return {"sequence": sequence, "type": type};
  }
}
