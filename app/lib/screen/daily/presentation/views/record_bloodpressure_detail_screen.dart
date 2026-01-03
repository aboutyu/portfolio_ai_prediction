import 'package:app/helpers/extensions/buildcontext_extension.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:app/screen/daily/presentation/view_models/daily_view_model.dart';
import 'package:app/screen/daily/presentation/view_models/record_health_view_model.dart';
import 'package:app/screen/daily/presentation/widgets/record_button_widget.dart';
import 'package:app/screen/daily/presentation/widgets/record_datetime_widget.dart';
import 'package:app/screen/daily/presentation/widgets/record_title_widget.dart';
import 'package:app/widgets/show_dialogs/base_dialog.dart';
import 'package:app/widgets/show_dialogs/single_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordBloodpressureDetailScreen extends ConsumerStatefulWidget {
  const RecordBloodpressureDetailScreen({required this.healthLog, super.key});

  final HealthLog healthLog;

  @override
  ConsumerState<RecordBloodpressureDetailScreen> createState() =>
      _RecordBloodpressureDetailScreenState();
}

class _RecordBloodpressureDetailScreenState
    extends ConsumerState<RecordBloodpressureDetailScreen> {
  // 입력 컨트롤러
  final TextEditingController _diastolicController = TextEditingController();
  final TextEditingController _systolicController = TextEditingController();
  final TextEditingController _memoController = TextEditingController();

  // 현재 선택된 날짜 (초기값은 Provider에서 가져옴)
  late DateTime _selectedDate;
  late HealthLog _healthLog;

  @override
  void initState() {
    super.initState();
    _selectedDate = ref.read(dailyDateProvider);
    _healthLog = widget.healthLog;

    _systolicController.text = _healthLog.healthValue.toString();
    _diastolicController.text = _healthLog.healthExtraValue?.toString() ?? '';
    _memoController.text = _healthLog.memo ?? '';
  }

  @override
  void dispose() {
    _systolicController.dispose();
    _diastolicController.dispose();
    _memoController.dispose();
    super.dispose();
  }

  // 저장 로직
  Future<void> _onSave() async {
    final systolic = _systolicController.text;
    final diastolic = _diastolicController.text;
    final memo = _memoController.text;

    if (systolic.isEmpty ||
        double.tryParse(systolic) == null ||
        diastolic.isEmpty ||
        double.tryParse(diastolic) == null) {
      return;
    }

    try {
      await ref
          .read(recordHealthViewModelProvider.notifier)
          .updateRecordHealthLog(
            _healthLog.sequence,
            _healthLog.groupUuid,
            HealthLogType.BPT,
            double.parse(systolic),
            double.parse(diastolic),
            memo.isEmpty ? null : memo,
            _selectedDate,
          );

      // 팝업 닫기
      if (!context.mounted) return;
      Navigator.pop(context, _selectedDate);
    } catch (e) {
      if (!context.mounted) return;
      SingleDialogWidget(
        content: context.tr.tryCatchErrorText(e.toString()),
        onConfirm: () => Navigator.pop(context, null),
      ).show(context);
    }
  }

  Future<void> _onDelete() async {
    try {
      await ref
          .read(recordHealthViewModelProvider.notifier)
          .deleteRecordHealthLog(_healthLog.sequence);

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
          RecordTitleWidget(title: context.tr.bloodPressureLogRecordTitle),
          const SizedBox(height: 20),

          // 2. 날짜 선택 행
          RecordDateTimeWidget(
            selectedDate: _selectedDate,
            isChangeable: false,
            onTap: () async => {},
          ),
          const SizedBox(height: 16),

          // 3. 혈압 입력
          TextField(
            controller: _systolicController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: context.tr.bloodPressureLogInputHintSystolicText,
              suffixText: 'mmHg',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
          ),
          const SizedBox(height: 16),

          TextField(
            controller: _diastolicController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: context.tr.bloodPressureLogInputHintDiastolicText,
              suffixText: 'mmHg',
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
              alignLabelWithHint: true, // 라벨을 위쪽으로 정렬
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
