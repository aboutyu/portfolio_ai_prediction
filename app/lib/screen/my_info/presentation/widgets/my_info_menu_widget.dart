import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/helpers/storages/user_info.dart';
import 'package:app/widgets/buttons/my_info_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyInfoMenuWidget extends ConsumerWidget {
  const MyInfoMenuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyInfoButtonWidget(
          onPressed: () async => context.push('/notice'),
          icon: Icons.notifications_none,
          text: context.tr.noticesButtonText,
        ),
        _lineWidget(),
        MyInfoButtonWidget(
          onPressed: () async => context.push('/event'), // 이벤트 페이지로 이동 만들기
          icon: Icons.event,
          text: context.tr.eventButtonText,
        ),
        _lineWidget(),
        MyInfoButtonWidget(
          onPressed: () async => context.push('/guide'), // 가이드 페이지로 이동 만들기
          icon: Icons.book_outlined,
          text: context.tr.guideButtonText,
        ),
        _lineWidget(),
        MyInfoButtonWidget(
          onPressed: () async => context.push('/licenses'),
          icon: Icons.info_outline,
          text: context.tr.licenseInfoButtonText,
        ),
        _lineWidget(),
        MyInfoButtonWidget(
          onPressed: () async => context.push('/faq'),
          icon: Icons.help_outline,
          text: context.tr.faqsButtonText,
        ),
        _lineWidget(),
        MyInfoButtonWidget(
          onPressed: () async => context.push('/terms'),
          icon: Icons.description_outlined,
          text: context.tr.termsAgreeButtonText,
        ),
        _lineWidget(),
        MyInfoButtonWidget(
          onPressed: () async => context.push('/myinfo'), // 내정보 이동 만들기
          icon: Icons.person_outline,
          text: context.tr.myinfoNavigationText,
        ),
        _lineWidget(),
        MyInfoButtonWidget(
          onPressed: () async {
            await ref.read(userInfoProvider.notifier).logout();
          },
          icon: Icons.logout,
          text: context.tr.buttonLogoutText,
        ),
      ],
    );
  }

  Widget _lineWidget() {
    return Container(
      height: 1,
      color: Colors.grey[400],
      margin: const EdgeInsets.symmetric(horizontal: 30),
    );
  }
}
