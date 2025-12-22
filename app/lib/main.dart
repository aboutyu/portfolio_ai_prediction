import 'package:app/helpers/routers/router.dart';
import 'package:app/widgets/loading_indicator/loading_indicator_widget.dart';
import 'package:app/widgets/loading_indicator/loading_provider.dart';
import 'package:app/helpers/cores/app_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await AppInitializer.initialize();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoadingProgress = ref.watch(loadingProviderProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'My App',
      routerConfig: router,
      builder: (context, child) {
        return LoadingIndicatorWidget(
          isLoading: isLoadingProgress,
          child: GestureDetector(
            onTap: () {
              // 화면 어디든 터치하면 키보드 내림 (포커스 해제)
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: child,
          ),
        );
      },
    );
  }
}
