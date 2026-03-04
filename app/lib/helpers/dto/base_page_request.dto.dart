import 'package:app/helpers/dto/base_request.dto.dart';

class BasePageRequestDto implements BaseRequestDto {
  final int page;
  final int pageNum;

  BasePageRequestDto({required this.page, required this.pageNum});

  @override
  Map<String, dynamic> toJson() {
    return {"page": page, "pageNum": pageNum};
  }
}
