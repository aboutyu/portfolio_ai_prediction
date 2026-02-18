import 'package:app/helpers/enums/service_code-type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_code_model.freezed.dart';
part 'service_code_model.g.dart';

@freezed
abstract class ServiceCodeModel with _$ServiceCodeModel {
  const factory ServiceCodeModel({
    required int sequence,
    required String code,
    @Default(ServiceCodeType.itp) ServiceCodeType type,
    required String name,
    String? memo,
  }) = _ServiceCodeModel;

  factory ServiceCodeModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceCodeModelFromJson(json);
}
