import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabbarScreen extends StatelessWidget {
  const TabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 현재 선택된 탭의 화면을 보여줌
      body: Container(), // navigationShell.currentPage.child,
      // 하단 탭바
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // navigationShell.currentIndex, // 현재 선택된 탭 인덱스
        onTap: (index) {
          // 탭이 선택되었을 때 해당 탭으로 이동
          switch (index) {
            case 0:
              context.go('/'); // 홈 탭
              break;
            case 1:
              context.go('/daily'); // 데일리 탭
              break;
            case 2:
              context.go('/chat'); // 채팅 탭
              break;
            case 3:
              context.go('/my'); // 마이 탭
              break;
          }
        },
        type: BottomNavigationBarType.fixed, // 탭이 4개 이상이면 fixed 필수
        selectedItemColor: Colors.blue, // 선택된 색상
        unselectedItemColor: Colors.grey, // 선택 안 된 색상
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '데일리',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: '채팅'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이'),
        ],
      ),
    );
  }
}
