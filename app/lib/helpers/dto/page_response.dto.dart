import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_response.dto.freezed.dart';
part 'page_response.dto.g.dart';

@freezed
abstract class PageResponseDto with _$PageResponseDto {
  const factory PageResponseDto({
    @Default(0) int page, // 현재 페이지 번호
    @Default(0) int totalCount, // 전체 아이템 수
    @Default(0) int pageCount, // 현재 페이지에 몇개의 아이템이 있는지
    @Default(10) int pageNum, // 한 페이지당 아이템 수
  }) = _PageResponseDto;

  factory PageResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PageResponseDtoFromJson(json);
}
