import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/extensions/buildcontext_extension.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:app/screen/daily/presentation/view_models/daily_view_model.dart';
import 'package:app/screen/daily/presentation/view_models/record_health_view_model.dart';
import 'package:app/screen/daily/presentation/widgets/record_datetime_widget.dart';
import 'package:app/screen/daily/presentation/widgets/record_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordBloodPressureScreen extends ConsumerStatefulWidget {
  const RecordBloodPressureScreen({super.key});

  @override
  ConsumerState<RecordBloodPressureScreen> createState() =>
      _RecordBloodPressureScreenState();
}

class _RecordBloodPressureScreenState
    extends ConsumerState<RecordBloodPressureScreen> {
  // 입력 컨트롤러(이완기, 수축기, 메모)
  final TextEditingController _diastolicController = TextEditingController();
  final TextEditingController _systolicController = TextEditingController();
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
    _diastolicController.dispose();
    _systolicController.dispose();
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
    final diastolic = _diastolicController.text;
    final systolic = _systolicController.text;
    final memo = _memoController.text;

    if (diastolic.isEmpty ||
        double.tryParse(diastolic) == null ||
        systolic.isEmpty ||
        double.tryParse(systolic) == null) {
      return;
    }

    try {
      await ref
          .read(recordHealthViewModelProvider.notifier)
          .addRecordHealthLog(
            HealthLogType.BPT,
            double.parse(diastolic),
            double.parse(systolic),
            memo.isEmpty ? null : memo,
            _selectedDate,
          );

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
          RecordTitleWidget(title: context.tr.dailyFloatingBloodPressureText),
          const SizedBox(height: 20),

          // 2. 날짜 선택 행
          RecordDateTimeWidget(selectedDate: _selectedDate, onTap: _pickDate),
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
