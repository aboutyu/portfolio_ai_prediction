import 'package:app/helpers/extensions/buildcontext_extension.dart';
import 'package:app/screen/auth/data/models/terms_model.dart';
import 'package:app/screen/auth/presentation/view_models/login_view_model.dart';
import 'package:app/screen/auth/presentation/view_models/terms_view_model.dart';
import 'package:app/widgets/appbar_widgets/appbar_widget.dart';
import 'package:app/widgets/show_dialogs/base_dialog.dart';
import 'package:app/widgets/show_dialogs/single_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

  final List<int> _agreedTerms = [];

  @override
  Widget build(BuildContext context) {
    final termsList = ref.watch(termsViewModelProvider);

    return Scaffold(
      appBar: AppbarWidget(title: 'Sign Up'),
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

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
              ), // 위 필드와 동일한 여백
              child: termsList.when(
                data: (terms) {
                  return Column(
                    children: terms.asMap().entries.map((entry) {
                      final index = entry.key;
                      final term = entry.value;
                      return _buildTermCheckbox(term, index);
                    }).toList(),
                  );
                },
                // 로딩 중엔 아무것도 안 보이거나 로딩바
                loading: () => const SizedBox.shrink(),
                // 에러 나면 숨김 (또는 에러 텍스트)
                error: (e, s) => const SizedBox.shrink(),
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

  Widget _buildTermCheckbox(TermsModel term, int index) {
    final bool isAgreed = _agreedTerms.contains(term.sequence);
    final String isAgreeLabel = term.isRequired ? '(필수)' : '(선택)';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 양끝 정렬
      children: [
        Checkbox(
          value: isAgreed,
          onChanged: (value) async {
            debugPrint('Term ${term.sequence} checkbox changed: $value');
            setState(() {
              if (value == true) {
                _agreedTerms.add(term.sequence); // 체크 시 추가
              } else {
                _agreedTerms.remove(term.sequence); // 체크 해제 시 제거
              }
            });
          },
        ),
        // 1. 약관 이름
        Expanded(
          child: Text(
            '${term.termsName} $isAgreeLabel',
            style: const TextStyle(fontSize: 14),
          ),
        ),

        // 2. [보기] 버튼
        TextButton(
          onPressed: () =>
              context.push('/terms', extra: {'term': term, 'index': index}),
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            '[보기]',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
      ],
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

    // 1. 필수 약관 체크 확인 로직 추가
    final termsState = ref.read(termsViewModelProvider);

    // 데이터가 로드된 상태인지 확인
    if (termsState.hasValue) {
      final terms = termsState.value!;

      // 필수 약관인데 체크 안 된 게 있는지 확인
      final missingRequired = terms.any((term) {
        return term.isRequired && !_agreedTerms.contains(term.sequence);
      });

      if (missingRequired) {
        SingleDialogWidget(content: '모든 필수 약관에 동의해주세요.').show(context);
        return; // 진행 중단
      }
    } else {
      SingleDialogWidget(
        content: '약관 정보를 불러오는 중입니다. 잠시 후 다시 시도해주세요.',
      ).show(context);
      return; // 진행 중단
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
    } catch (e) {
      context.showTryCatchErrorDialog(e);
    }
  }
}
