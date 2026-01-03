import 'package:app/helpers/extensions/buildcontext_extension.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/auth/presentation/view_models/login_view_model.dart';
import 'package:app/widgets/show_dialogs/base_dialog.dart';
import 'package:app/widgets/show_dialogs/single_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),

              child: TextField(
                controller: _userIdController,
                decoration: InputDecoration(
                  labelText: context.tr.useridHintText,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: context.tr.passwordHintText,
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async => _onLoginPressed(context, ref),
                  child: Text(context.tr.loginText),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async => _onRegisterPressed(context, ref),
                  child: Text(context.tr.signupText),
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
      SingleDialogWidget(
        content: context.tr.loginInputEmptyErrorText,
        onConfirm: () => Navigator.pop(context, null),
      ).show(context);
      return;
    }

    try {
      await ref
          .read(loginViewModelProvider.notifier)
          .login(_userIdController.text, _passwordController.text);
    } catch (e) {
      await context.showTryCatchErrorDialog(e);
    }
  }

  void _onRegisterPressed(BuildContext context, WidgetRef ref) async {
    FocusScope.of(context).unfocus();
    context.push('/signup');
  }
}
