import 'package:app/helpers/cores/app_initializer.dart';
import 'package:app/screen/auth/presentation/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await AppInitializer.initialize();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            // 화면 어디든 터치하면 키보드 내림 (포커스 해제)
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: child,
        );
      },
      home: LoginScreen(),
    );
  }
}
