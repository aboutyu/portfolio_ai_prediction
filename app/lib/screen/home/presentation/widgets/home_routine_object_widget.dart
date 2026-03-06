import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/helpers/storages/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_text/styled_text.dart';

class HomeRoutineObjectWidget extends ConsumerWidget {
  const HomeRoutineObjectWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.read(userInfoProvider);
    final user = userAsync.value;

    final username = user?.username ?? '-';
    // final objectName = AppConfig.serviceCode[0].name; // 예시로 첫 번째 서비스 코드의 이름을 사용
    final objectName = 'Object'; // 임시로 'Object'라는 이름을 사용

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.emoji_objects_outlined,
            size: 20,
            color: Colors.green[700],
          ),
          const SizedBox(width: 8),
          StyledText(
            text: context.tr.challengeMessage(username, objectName, 10),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              height: 1.5,
            ),
            tags: {
              'blue': _getTagStyle(Colors.blue),
              'red': _getTagStyle(Colors.red),
              'brown': _getTagStyle(Colors.brown),
            },
          ),
        ],
      ),
    );
  }

  StyledTextTag _getTagStyle(Color color) {
    return StyledTextTag(
      style: TextStyle(color: color, fontWeight: FontWeight.bold),
    );
  }
}
