import 'package:app/helpers/extensions/async_value_extension.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/notices/presentation/view_models/faq_view_model.dart';
import 'package:app/screen/notices/presentation/view_models/notice_view_model.dart';
import 'package:app/widgets/appbar_widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/screen/notices/data/models/notice_model.dart';

class FaqScreen extends ConsumerWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final faqsState = ref.watch(faqViewModelProvider);

    return Scaffold(
      appBar: AppbarWidget(title: context.tr.faqsButtonText),
      // 2. 상태에 따른 UI 분기 처리
      body: faqsState.draws(
        data: (notices) {
          // 데이터가 비어있을 경우 처리
          if (notices.isEmpty) {
            return Center(child: Text(context.tr.faqNoText));
          }
          // 데이터가 있을 경우 리스트 렌더링
          return RefreshIndicator(
            onRefresh: () async {
              // 3. 당겨서 새로고침: Provider를 다시 build하여 최신 데이터 fetch
              return ref.refresh(noticeViewModelProvider.future);
            },
            child: ListView.separated(
              itemCount: notices.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final notice = notices[index];
                return _buildNoticeItem(context, notice);
              },
            ),
          );
        },
      ),
    );
  }

  // 리스트 아이템 위젯 (NoticeModel의 필드명은 가정하여 작성했습니다)
  Widget _buildNoticeItem(BuildContext context, NoticeModel notice) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: Text(
        '${notice.categoryName ?? ''}${notice.title}', // NoticeModel의 필드명에 맞게 수정 필요
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Text(
          notice.createDate.timeZoneName, // 날짜 필드명에 맞게 수정 필요
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
      ),
      onTap: () {
        // 상세 화면 이동 로직
        // Navigator.push(context, MaterialPageRoute(builder: (_) => NoticeDetailScreen(notice: notice)));
      },
    );
  }
}
