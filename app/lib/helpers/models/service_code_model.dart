import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/enums/service_code-type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_code_model.freezed.dart';
part 'service_code_model.g.dart';

@freezed
abstract class ServiceCodeModel with _$ServiceCodeModel {
  const factory ServiceCodeModel({
    required ServiceCodeType code, // ITP, OBJ 등
    required List<ServiceCodeItem> items,
  }) = _ServiceCodeModel;

  factory ServiceCodeModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceCodeModelFromJson(json);
}

@freezed
abstract class ServiceCodeItem with _$ServiceCodeItem {
  const ServiceCodeItem._();

  const factory ServiceCodeItem({
    required String code,
    required String codeName,
    required ServiceCodeType type,
    Map<String, String>? names,
  }) = _ServiceCodeItem;

  factory ServiceCodeItem.fromJson(Map<String, dynamic> json) =>
      _$ServiceCodeItemFromJson(json);

  String getName(String languageCode) {
    if (names == null || !names!.containsKey(languageCode)) {
      return codeName;
    }
    return names![languageCode]!;
  }
}

extension ServiceCodeItemExtension on ServiceCodeItem {
  String get displayName => _getName();

  String _getName() {
    if (names == null || !names!.containsKey(localeLanguage)) {
      return codeName;
    }
    return names![localeLanguage]!;
  }
}
