import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/extensions/datetime_extension.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:app/screen/daily/presentation/view_models/daily_view_model.dart';
import 'package:app/screen/daily/presentation/view_models/record_health_view_model.dart';
import 'package:app/widgets/show_dialogs/single_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordBloodGlucoseScreen extends ConsumerStatefulWidget {
  const RecordBloodGlucoseScreen({super.key});

  @override
  ConsumerState<RecordBloodGlucoseScreen> createState() =>
      _RecordBloodGlucoseScreenState();
}

class _RecordBloodGlucoseScreenState
    extends ConsumerState<RecordBloodGlucoseScreen> {
  // 입력 컨트롤러
  final TextEditingController _bloodGlucoseController = TextEditingController();
  final TextEditingController _memoController = TextEditingController();

  // 현재 선택된 날짜 (초기값은 Provider에서 가져옴)
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = ref.read(dailyDateProvider);
  }

  @override
  void dispose() {
    _bloodGlucoseController.dispose();
    _memoController.dispose();
    super.dispose();
  }

  // 날짜 변경 팝업
  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: firstCalendarDate,
      lastDate: lastCalendarDate,
    );

    if (date == null) return; // 취소하면 종료

    if (!mounted) return; // context 안전 확인
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDate),
      builder: (context, child) {
        return child!;
      },
    );

    if (time == null) return; // 취소하면 종료

    setState(() {
      _selectedDate = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  // 저장 로직
  Future<void> _onSave() async {
    final bloodGlucose = _bloodGlucoseController.text;
    final memo = _memoController.text;

    if (bloodGlucose.isEmpty || double.tryParse(bloodGlucose) == null) {
      return;
    }

    try {
      await ref
          .read(recordHealthViewModelProvider.notifier)
          .addRecordHealthLog(
            HealthLogType.BGT,
            double.parse(bloodGlucose),
            null,
            memo.isEmpty ? null : memo,
            _selectedDate,
          );

      // 팝업 닫기
      if (!context.mounted) return;
      Navigator.pop(context, _selectedDate);
    } catch (e) {
      debugMessage('체중 기록 저장 실패: $e');
      if (!context.mounted) return;
      singleDialogWidget(
        context,
        '실패',
        onConfirm: () => Navigator.pop(context, null),
      );
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
          Text(
            context.tr.bloodGlucoseLogRecordTitle,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // 2. 날짜 선택 행
          Row(
            children: [
              Text(
                '${context.tr.inputDateText}: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                _selectedDate.forYearMonthDay,
                style: const TextStyle(fontSize: 16),
              ),
              const Spacer(),
              TextButton(
                onPressed: _pickDate,
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: Colors.grey[200],
                ),
                child: const Text('변경', style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 3. 혈당 입력
          TextField(
            controller: _bloodGlucoseController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: context.tr.bloodGlucoseLogRecordTitle,
              suffixText: 'mg/dL',
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

          Row(
            children: [
              // 닫기 버튼
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  child: Text(
                    context.tr.dialogClosedTitle,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // 저장 버튼
              Expanded(
                child: ElevatedButton(
                  onPressed: _onSave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // 포인트 컬러
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    context.tr.dialogSavedTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
