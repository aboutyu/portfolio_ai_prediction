import 'package:app/helpers/extensions/buildcontext_extension.dart';
import 'package:app/screen/auth/presentation/view_models/login_view_model.dart';
import 'package:app/widgets/appbar_widgets/appbar_widget.dart';
import 'package:app/widgets/show_dialogs/base_dialog.dart';
import 'package:app/widgets/show_dialogs/single_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Sign Up'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                controller: _userIdController,
                decoration: const InputDecoration(labelText: 'User ID'),
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
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                controller: _userNameController,
                decoration: const InputDecoration(labelText: 'User Name'),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async => _onSignupPressed(context, ref),
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onSignupPressed(BuildContext context, WidgetRef ref) async {
    FocusScope.of(context).unfocus();

    final userId = _userIdController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    final userName = _userNameController.text.trim();

    if (userId.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        userName.isEmpty) {
      SingleDialogWidget(content: 'Please fill in all fields.').show(context);
      return;
    }

    if (password != confirmPassword) {
      SingleDialogWidget(content: 'Passwords do not match.').show(context);
      return;
    }

    try {
      final result = await ref
          .read(loginViewModelProvider.notifier)
          .signup(userId, password, userName);

      if (result == null) {
        SingleDialogWidget(
          content: 'Signup failed. Please try again.',
        ).show(context);
        return;
      }
      // context.safePop();
    } catch (e) {
      context.showTryCatchErrorDialog(e);
    }
  }
}
