import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/cores/app_config.dart';
import 'package:app/helpers/cores/repositories/app_initializer_repository.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/helpers/models/app_update_model.dart';
import 'package:app/helpers/networks/enums/status_code.enum.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_update_service.g.dart';

// '나중에 하기' 선택 상태를 저장하는 Provider (앱 종료 시 초기화)
@riverpod
class SkipUpdateState extends _$SkipUpdateState {
  @override
  bool build() => false;

  void skip() => state = true;
}

// 앱 업데이트 비즈니스 로직
@Riverpod(keepAlive: true)
class AppUpdateService extends _$AppUpdateService {
  DateTime? _lastCheckedAt;
  int skipTimes = 30;
  bool _isChecking = false;

  @override
  FutureOr<void> build() => null;

  Future<void> checkUpdate(
    BuildContext context, {
    bool isForced = false,
  }) async {
    if (_isChecking) return;

    final now = DateTime.now();
    if (!isForced &&
        _lastCheckedAt != null &&
        now.difference(_lastCheckedAt!).inSeconds < skipTimes) {
      return;
    }

    _isChecking = true;
    _lastCheckedAt = now;

    try {
      final repository = ref.read(appInitializerRepositoryProvider);
      final response = await repository.fetchAppUpdate();
      if (!ref.mounted) return;

      if (response.status == StatusCode.success && response.data != null) {
        await _processUpdate(context, response.data!);
      }
    } catch (e) {
      debugMessage('AppUpdateService Error: $e');
    } finally {
      if (ref.mounted) {
        _isChecking = false;
      }
    }
  }

  Future<void> _processUpdate(
    BuildContext context,
    AppUpdateModel update,
  ) async {
    if (!ref.mounted) return;

    final currentBuild = AppConfig.buildNumber;
    if (update.buildNumber <= currentBuild) return;

    if (!update.isEssential && ref.read(skipUpdateStateProvider)) return;

    if (context.mounted) {
      _showUpdateDialog(context, update);
    }
  }

  void _showUpdateDialog(BuildContext context, AppUpdateModel update) {
    showDialog(
      context: context,
      barrierDismissible: !update.isEssential, // 필수 업데이트면 밖을 눌러도 안 꺼짐
      builder: (ctx) => PopScope(
        canPop: !update.isEssential, // 뒤로가기 버튼 제어
        child: AlertDialog(
          title: Text(
            update.isEssential
                ? context.tr.updateEssentialTitle
                : context.tr.updateOptionalTitle,
          ),
          content: Text(
            update.isEssential
                ? context.tr.updateEssentialMessage
                : context.tr.updateOptionalMessage,
          ),
          actions: [
            if (!update.isEssential)
              TextButton(
                onPressed: () {
                  ref.read(skipUpdateStateProvider.notifier).skip();
                  Navigator.pop(ctx);
                },
                child: Text(context.tr.laterButtonText),
              ),
            TextButton(
              onPressed: () async => await openStore(),
              child: Text(context.tr.updateButtonText),
            ),
          ],
        ),
      ),
    );
  }
}
