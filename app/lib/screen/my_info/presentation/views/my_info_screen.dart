import 'package:app/helpers/extensions/l10n.extension.dart';
import 'package:app/helpers/storages/user_info.dart';
import 'package:app/widgets/appbar_widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInfoScreen extends ConsumerWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoAsync = ref.watch(userInfoProvider);

    return Scaffold(
      appBar: appBarWidget(context.tr.myinfoAppbarText),
      body: Center(
        child: userInfoAsync.when(
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await ref.read(userInfoProvider.notifier).logout();
                  },
                  child: Text(context.tr.buttonLogoutText),
                ),
              ],
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
    );
  }
}
