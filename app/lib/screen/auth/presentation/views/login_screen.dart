import 'package:app/screen/auth/presentation/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final TextEditingController _userIdController = TextEditingController(
    text: 'a@a.com',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: 'a',
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginViewModelProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),

              child: TextField(
                controller: _userIdController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async => _onLoginPressed(context, ref),
                  child: const Text('Login'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async => _onRegisterPressed(context, ref),
                  child: const Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onLoginPressed(BuildContext context, WidgetRef ref) async {
    FocusScope.of(context).unfocus();

    if (_userIdController.text.isEmpty || _passwordController.text.isEmpty) {
      debugPrint("아이디와 비밀번호를 모두 입력해주세요.");
      return;
    }

    try {
      await ref
          .read(loginViewModelProvider.notifier)
          .login(_userIdController.text, _passwordController.text);
    } catch (e) {
      debugPrint("에러 발생: $e");
    }
  }

  void _onRegisterPressed(BuildContext context, WidgetRef ref) async {
    FocusScope.of(context).unfocus();

    await ref
        .read(loginViewModelProvider.notifier)
        .signup('2@a.com', 'a', 'user2');
  }
}
