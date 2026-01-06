import 'package:app/helpers/extensions/async_value_extension.dart';
import 'package:app/screen/notices/presentation/view_models/notice_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/screen/notices/data/models/notice_model.dart';

class NoticeScreen extends ConsumerWidget {
  const NoticeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noticeState = ref.watch(noticeViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('공지사항')),
      body: noticeState.draws(
        data: (notices) {
          if (notices.isEmpty) {
            return const Center(child: Text('등록된 공지사항이 없습니다.'));
          }

          return RefreshIndicator(
            onRefresh: () async {
              // 새로고침 시 ViewModel을 초기화하여 다시 0페이지부터 로드
              return ref.refresh(noticeViewModelProvider.future);
            },
            // 스크롤 감지를 위한 리스너
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                // 스크롤 중이며, 바닥까지 200픽셀 남았을 때 추가 로딩 시도
                if (scrollInfo.metrics.pixels >=
                    scrollInfo.metrics.maxScrollExtent - 200) {
                  ref.read(noticeViewModelProvider.notifier).loadMore();
                }
                return false;
              },
              child: ListView.separated(
                itemCount: notices.length + 1, // 로딩 인디케이터를 위해 +1
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  // 마지막 아이템일 경우
                  if (index == notices.length) {
                    // 더 불러올 수 있는지 확인 후 로딩 표시 여부 결정
                    // (ViewModel의 _hasMore를 getter로 노출하거나, 여기서 간단히 처리)
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                    );
                  }

                  final notice = notices[index];
                  return _buildNoticeItem(context, notice);
                },
              ),
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
        notice.title, // NoticeModel의 필드명에 맞게 수정 필요
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
