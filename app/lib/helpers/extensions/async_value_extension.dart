import 'package:app/helpers/commons/common_funcs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueUI<T> on AsyncValue<T> {
  // data 부분만 넘겨받아서 처리하는 메서드
  Widget draws({
    bool skipLoadingOnRefresh = true,
    bool skipLoadingOnReload = true,
    required Widget Function(T data) data,
  }) {
    return when(
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipLoadingOnReload: skipLoadingOnReload,

      data: data,

      // 전역 로딩바가 뜨므로, UI 공간에는 아무것도 그리지 않음 (공백)
      loading: () => const SizedBox.shrink(),

      // 공통 에러 로그 출력
      error: (error, stack) {
        debugMessage(['AsyncValue Error', error]);
        return const SizedBox.shrink();
      },
    );
  }
}
