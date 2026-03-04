import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tabbar_viewmodel.g.dart';

@riverpod
class TabbarViewmodel extends _$TabbarViewmodel {
  @override
  Future<void> build() async {
    return;
  }

  Future<void> homeTapped() async {}

  Future<void> dailyTapped() async {}

  Future<void> chatTapped() async {}

  Future<void> myinfoTapped() async {}
}
