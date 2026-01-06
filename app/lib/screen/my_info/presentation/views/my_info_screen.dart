import 'package:app/helpers/extensions/async_value_extension.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/helpers/storages/user_info.dart';
import 'package:app/screen/my_info/presentation/view_models/my_info_view_model.dart';
import 'package:app/widgets/appbar_widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MyInfoScreen extends ConsumerWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoAsync = ref.watch(userInfoProvider);
    final packageInfo = ref.watch(packageInfoProvider);

    return Scaffold(
      appBar: appBarWidget(context.tr.myinfoAppbarText),
      body: Center(
        child: userInfoAsync.draws(
          data: (userInfo) {
            if (userInfo == null) {
              return Text(context.tr.noUserInfoAvailable);
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('User ID: ${userInfo.userId}'),
                Text('Username: ${userInfo.username}'),
                Text('Sequence: ${userInfo.sequence}'),
                Text('App Version: ${packageInfo.asData?.value.version}'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await ref.read(userInfoProvider.notifier).logout();
                  },
                  child: Text(context.tr.buttonLogoutText),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async => context.push('/terms'),
                  child: Text(context.tr.termsAgreeButtonText),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async => context.push('/licenses'),
                  child: Text(context.tr.licenseInfoButtonText),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async => context.push('/notice'),
                  child: Text(context.tr.noticesButtonText),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async => context.push('/faq'),
                  child: Text(context.tr.faqsButtonText),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<String> appVersion() async {
    // Implement your logic to fetch the app version here.
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
