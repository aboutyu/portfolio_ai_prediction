import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_response.dto.freezed.dart';
part 'page_response.dto.g.dart';

@freezed
abstract class PageResponseDto with _$PageResponseDto {
  const factory PageResponseDto({
    @Default(0) int page,
    @Default(0) int totalCount,
    @Default(0) int pageCount,
    @Default(10) int pageNum,
  }) = _PageResponseDto;

  factory PageResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PageResponseDtoFromJson(json);
}
