import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/helpers/storages/auth_storage.dart';
import 'package:app/screen/auth/data/models/login_response.model.dart';
import 'package:app/screen/auth/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

@Riverpod(keepAlive: true)
class LoginViewModel extends _$LoginViewModel {
  @override
  Future<void> build() async {
    return;
  }

  Future<CoreResponse<LoginResponse>> login(
    String userid,
    String password,
  ) async {
    state = const AsyncValue.loading(); // 로딩 시작

    try {
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.login(userid, password);

      await authStorage(ref).saveLoginData(response.data!);

      state = const AsyncValue.data(null); // 로딩 완료

      return response;
    } catch (e, st) {
      state = AsyncValue.error(e, st); // 오류 상태로 설정
      rethrow;
    }
  }
}
