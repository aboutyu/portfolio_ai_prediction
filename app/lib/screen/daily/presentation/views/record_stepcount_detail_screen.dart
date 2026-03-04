import 'package:app/helpers/extensions/buildcontext_extension.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:app/screen/daily/presentation/view_models/daily_view_model.dart';
import 'package:app/screen/daily/presentation/view_models/record_health_view_model.dart';
import 'package:app/screen/daily/presentation/widgets/record_button_widget.dart';
import 'package:app/screen/daily/presentation/widgets/record_datetime_widget.dart';
import 'package:app/screen/daily/presentation/widgets/record_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordStepcountDetailScreen extends ConsumerStatefulWidget {
  const RecordStepcountDetailScreen({required this.healthLog, super.key});

  final HealthLog healthLog;

  @override
  ConsumerState<RecordStepcountDetailScreen> createState() =>
      _RecordStepcountDetailScreenState();
}

class _RecordStepcountDetailScreenState
    extends ConsumerState<RecordStepcountDetailScreen> {
  // 입력 컨트롤러
  final TextEditingController _stepcountController = TextEditingController();
  final TextEditingController _memoController = TextEditingController();

  // 현재 선택된 날짜 (초기값은 Provider에서 가져옴)
  late DateTime _selectedDate;
  late HealthLog _healthLog;

  @override
  void initState() {
    super.initState();
    _selectedDate = ref.read(dailyDateProvider);
    _healthLog = widget.healthLog;

    _stepcountController.text = _healthLog.healthValue.toString();
    _memoController.text = _healthLog.memo ?? '';
  }

  @override
  void dispose() {
    _stepcountController.dispose();
    _memoController.dispose();
    super.dispose();
  }

  Future<void> _onSave() async {
    final stepcount = _stepcountController.text;
    final memo = _memoController.text;

    if (stepcount.isEmpty || double.tryParse(stepcount) == null) {
      return;
    }

    try {
      await ref
          .read(recordHealthViewModelProvider.notifier)
          .updateRecordHealthLog(
            _healthLog.sequence,
            _healthLog.groupUuid,
            HealthLogType.SCT,
            double.parse(stepcount),
            null,
            memo.isEmpty ? null : memo,
            _selectedDate,
          );

      // 팝업 닫기
      context.safePop(_selectedDate);
    } catch (e) {
      await context.showTryCatchErrorDialog(e);
    }
  }

  Future<void> _onDelete() async {
    try {
      await ref
          .read(recordHealthViewModelProvider.notifier)
          .deleteRecordHealthLog(_healthLog.sequence);

      // 팝업 닫기
      context.safePop(_selectedDate);
    } catch (e) {
      await context.showTryCatchErrorDialog(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RecordTitleWidget(title: context.tr.stepcountLogRecordTitle),
          const SizedBox(height: 20),

          // 2. 날짜 선택 행
          RecordDateTimeWidget(
            selectedDate: _selectedDate,
            isChangeable: false,
            onTap: () async => {},
          ),
          const SizedBox(height: 16),

          // 3. 걸음 수 입력
          TextField(
            controller: _stepcountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: context.tr.stepcountLogRecordTitle,
              suffixText: '보',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 4. 메모 입력
          TextField(
            controller: _memoController,
            maxLines: 5,
            decoration: InputDecoration(
              labelText: context.tr.inputHintMemoText,
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 24),

          RecordButtonWidget(
            isDeleted: true,
            onTapped: (type) async {
              if (type == RecordButtonType.close) {
                Navigator.pop(context);
              } else if (type == RecordButtonType.save) {
                await _onSave();
              } else if (type == RecordButtonType.delete) {
                await _onDelete();
              }
            },
          ),
        ],
      ),
    );
  }
}
