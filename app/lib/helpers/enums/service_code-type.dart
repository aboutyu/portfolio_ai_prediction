import 'package:app/helpers/configures/app_config.dart';
import 'package:app/helpers/models/service_code_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum ServiceCodeType {
  @JsonValue('ITP')
  itp,
  @JsonValue('OBJ')
  obj,
}

extension ServiceCodeTypeExtension on ServiceCodeType {
  String get value {
    switch (this) {
      case ServiceCodeType.itp:
        return 'ITP';
      case ServiceCodeType.obj:
        return 'OBJ';
    }
  }

  String get name {
    switch (this) {
      case ServiceCodeType.itp:
        return '관심분야';
      case ServiceCodeType.obj:
        return '목표';
    }
  }

  List<ServiceCodeItem> get codes {
    for (var item in AppConfig.serviceCode) {
      if (item.code == this) {
        return item.items;
      }
    }
    return [];
  }
}
