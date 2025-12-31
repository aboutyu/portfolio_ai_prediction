import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';

enum DailyExpandableFabQuickMenuType {
  meal, // 식사
  weight, // 체중
  stepCount, // 걸음수
  glucose, // 혈당
  bp, // 혈압
}

class DailyExpandableFabWidget extends StatefulWidget {
  const DailyExpandableFabWidget({super.key, required this.onSelected});

  final Function(DailyExpandableFabQuickMenuType type) onSelected;

  @override
  State<DailyExpandableFabWidget> createState() =>
      _DailyExpandableFabWidgetState();
}

class _DailyExpandableFabWidgetState extends State<DailyExpandableFabWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  late Animation<double> _rotateAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    // 0.0 -> 0.125 (45도 회전)
    _rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 0.125,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  // 메뉴 선택 시 호출되는 함수
  void _onItemTapped(DailyExpandableFabQuickMenuType type) {
    _toggle(); // 1. 메뉴 닫기
    widget.onSelected(type); // 2. 상위 위젯에 알리기
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // --- 메뉴 버튼들 (위로 펼쳐짐) ---
        _buildChildButton(
          type: DailyExpandableFabQuickMenuType.meal,
          icon: Icons.restaurant,
          label: context.tr.dailyFloatingFoodText,
          color: Colors.green,
        ),
        _buildChildButton(
          type: DailyExpandableFabQuickMenuType.weight,
          icon: Icons.monitor_weight,
          label: context.tr.dailyFloatingWeightText,
          color: Colors.blue,
        ),
        _buildChildButton(
          type: DailyExpandableFabQuickMenuType.stepCount,
          icon: Icons.directions_walk,
          label: context.tr.dailyFloatingStepcountText,
          color: Colors.teal,
        ),
        _buildChildButton(
          type: DailyExpandableFabQuickMenuType.glucose,
          icon: Icons.water_drop,
          label: context.tr.dailyFloatingBloodGlucoseText,
          color: Colors.red,
        ),
        _buildChildButton(
          type: DailyExpandableFabQuickMenuType.bp,
          icon: Icons.favorite,
          label: context.tr.dailyFloatingBloodPressureText,
          color: Colors.pink,
        ),

        const SizedBox(height: 12),

        // --- 메인 FAB (회전함) ---
        FloatingActionButton(
          onPressed: _toggle,
          elevation: 2,
          backgroundColor: Colors.orange,
          shape: const CircleBorder(),
          child: RotationTransition(
            turns: _rotateAnimation,
            child: const Icon(Icons.add, size: 30),
          ),
        ),
      ],
    );
  }

  Widget _buildChildButton({
    required DailyExpandableFabQuickMenuType type,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return SizeTransition(
      sizeFactor: _expandAnimation,
      axis: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, right: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // 라벨 (검은 배경 살짝 추가하여 가독성 높임)
            Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            // 작은 원형 버튼
            GestureDetector(
              onTap: () => _onItemTapped(type), // ✅ 선택 시 콜백 실행
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
