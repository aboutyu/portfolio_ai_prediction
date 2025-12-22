import 'package:app/helpers/storages/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInfoScreen extends ConsumerWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoAsync = ref.watch(userInfoProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My Info')),
      body: Center(
        child: userInfoAsync.when(
          data: (userInfo) {
            if (userInfo == null) {
              return const Text('No user information available.');
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('User ID: ${userInfo.userId}'),
                Text('Username: ${userInfo.username}'),
                Text('Sequence: ${userInfo.sequence}'),
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
