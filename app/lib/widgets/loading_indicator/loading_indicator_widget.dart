import 'package:flutter/material.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Color? barrierColor;

  const LoadingIndicatorWidget({
    super.key,
    required this.isLoading,
    required this.child,
    this.barrierColor, // 배경색을 바꾸고 싶으면 사용 (기본: 반투명 검정)
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. 실제 앱 화면 (가장 바닥)
        child,

        // 2. 로딩 중일 때만 화면을 덮는 오버레이
        if (isLoading)
          Stack(
            children: [
              // (1) 터치 차단 및 배경 어둡게 처리
              // AbsorbPointer: 이 영역의 모든 터치 이벤트를 흡수해서 뒤쪽 버튼이 안 눌리게 함
              AbsorbPointer(
                absorbing: true,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: barrierColor ?? Colors.black.withOpacity(0.5),
                ),
              ),

              // (2) 중앙 로딩 인디케이터
              const Center(child: CircularProgressIndicator()),
            ],
          ),
      ],
    );
  }
}
