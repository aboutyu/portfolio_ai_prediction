import 'package:app/helpers/enums/platform.enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_update_model.freezed.dart';
part 'app_update_model.g.dart';

@freezed
abstract class AppUpdateModel with _$AppUpdateModel {
  // 생성자를 private(_ )으로 만들고 커스텀 getter를 추가하기 위해 'const factory' 대신 사용
  const AppUpdateModel._();

  const factory AppUpdateModel({
    required String type, // 서버 값을 String으로 수신
    required bool isEssential,
    required String version,
    required int buildNumber,
  }) = _AppUpdateModel;

  factory AppUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$AppUpdateModelFromJson(json);

  // 로직에서 사용할 타입 변환 Getter
  Platform get platformType {
    if (type.toUpperCase() == 'IOS') return Platform.iOS;
    return Platform.android;
  }
}
