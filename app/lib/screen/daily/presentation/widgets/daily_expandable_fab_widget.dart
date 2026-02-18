import 'package:app/helpers/enums/daily_quick_menu_type.dart';
import 'package:flutter/material.dart';

class DailyExpandableFabWidget extends StatefulWidget {
  const DailyExpandableFabWidget({super.key, required this.onSelected});

  final Function(DailyQuickMenuType type) onSelected;

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
  void _onItemTapped(DailyQuickMenuType type) {
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
        _buildChildButton(context: context, type: DailyQuickMenuType.meal),
        _buildChildButton(context: context, type: DailyQuickMenuType.weight),
        _buildChildButton(context: context, type: DailyQuickMenuType.stepCount),
        _buildChildButton(context: context, type: DailyQuickMenuType.glucose),
        _buildChildButton(context: context, type: DailyQuickMenuType.bp),

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
    required BuildContext context,
    required DailyQuickMenuType type,
  }) {
    return SizeTransition(
      sizeFactor: _expandAnimation,
      axis: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, right: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            // 1. 라벨 (흰색 배경)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                type.displayName(context),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(width: 12), // 간격
            // 2. 아이콘 버튼
            GestureDetector(
              onTap: () => _onItemTapped(type),
              child: type.iconWidget(40),
            ),
          ],
        ),
      ),
    );
  }
}
