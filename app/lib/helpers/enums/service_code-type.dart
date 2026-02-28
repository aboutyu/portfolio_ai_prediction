import 'package:app/helpers/configures/app_config.dart';
import 'package:app/helpers/models/service_code_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum ServiceCodeType {
  @JsonValue('ITP')
  itp,
}

extension ServiceCodeTypeExtension on ServiceCodeType {
  String get value {
    switch (this) {
      case ServiceCodeType.itp:
        return 'ITP';
    }
  }

  List<ServiceCodeModel> get codes {
    return AppConfig.serviceCode.where((item) => item.type == this).toList();
  }
}
