// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUpdateModel _$AppUpdateModelFromJson(Map<String, dynamic> json) =>
    _AppUpdateModel(
      type: json['type'] as String,
      isEssential: json['isEssential'] as bool,
      version: json['version'] as String,
      buildNumber: (json['buildNumber'] as num).toInt(),
    );

Map<String, dynamic> _$AppUpdateModelToJson(_AppUpdateModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'isEssential': instance.isEssential,
      'version': instance.version,
      'buildNumber': instance.buildNumber,
    };
