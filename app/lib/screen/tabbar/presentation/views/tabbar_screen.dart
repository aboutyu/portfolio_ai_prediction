import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/home/presentation/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabbarScreen extends ConsumerWidget {
  const TabbarScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: _naviationTheme(
        context,
        BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) async => _onTapped(index, navigationShell, ref),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          elevation: 1,
          items: [
            _navigationItem(Icon(Icons.home), context.tr.homeNavigationText),
            _navigationItem(
              Icon(Icons.calendar_today),
              context.tr.dailyNavigationText,
            ),
            _navigationItem(Icon(Icons.chat), context.tr.chatNavigationText),
            _navigationItem(
              Icon(Icons.person),
              context.tr.myinfoNavigationText,
            ),
          ],
        ),
      ),
    );
  }

  // 터치 효과 제거 테마
  Widget _naviationTheme(BuildContext context, Widget child) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      child: child,
    );
  }

  BottomNavigationBarItem _navigationItem(Widget icon, String label) {
    return BottomNavigationBarItem(
      icon: Padding(padding: EdgeInsets.only(bottom: 6), child: icon),
      label: label,
    );
  }

  Future<void> _onTapped(
    int index,
    StatefulNavigationShell navigationShell,
    WidgetRef ref,
  ) async {
    // 홈 탭을 눌렀을 때만 데이터 갱신 체크 실행
    if (index == 0) {
      ref.read(homeViewModelProvider.notifier).checkAndRefresh();
    }

    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
