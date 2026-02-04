import 'package:app/helpers/commons/colors.dart';
import 'package:app/helpers/extensions/async_value_extension.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/helpers/storages/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoWidget extends ConsumerWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvider);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: appbarBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(24.0),
        ),
      ),
      child: userInfo.draws(
        data: (user) {
          if (user == null) {
            return Text(context.tr.noUserInfoAvailable);
          }

          final lastDate = '-';
          final totalCount = '0';

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _userNameWidget(context, user.username, user.thumbnail),
              const SizedBox(height: 16),
              _activeInfoWidget(context, lastDate, totalCount),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }

  Widget _userNameWidget(
    BuildContext context,
    String username,
    String? thumbnail,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 1. 이름/환영인사 텍스트
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.black, // 기본 색상
                height: 1.2, // 줄간격 좁게 (아래 영역이 붙도록)
              ),
              children: [
                // 이름: Bold, 20
                TextSpan(
                  text: username,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: context.tr.welcomeSuffix,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: thumbnail != null
                ? ClipOval(
                    child: Image.network(
                      thumbnail,
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                    ),
                  )
                : Icon(Icons.person, size: 40, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _activeInfoWidget(
    BuildContext context,
    String lastDate,
    String totalCount,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          // 첫 번째 열: 마지막 작성일
          Expanded(
            child: _buildInfoItem(
              label: context.tr.lastRecordedAt, // "마지막 작성일"
              value: lastDate,
            ),
          ),
          // 구분선 (선택사항)
          Container(width: 1, height: 40, color: Colors.grey[300]),
          // 두 번째 열: 전체 작성 개수
          Expanded(
            child: _buildInfoItem(
              label: context.tr.totalRecordCount, // "전체 작성 개수"
              value: totalCount,
            ),
          ),
        ],
      ),
    );
  }

  // 2x2 표 내부 아이템 빌더
  Widget _buildInfoItem({required String label, required String value}) {
    return Column(
      children: [
        // 라벨 (위)
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        // 데이터 (아래)
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
