import 'package:app/screen/notices/presentation/view_models/notice_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInfoSimpleNoticeWidget extends ConsumerWidget {
  const MyInfoSimpleNoticeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noticeState = ref.watch(noticeViewModelProvider);

    return Container(
      width: double.infinity,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10.0),
          bottom: Radius.circular(10.0),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          const Icon(
            Icons.notifications,
            color: Colors.white,
            size: 25, // 아이콘 크기
          ),
          const SizedBox(width: 10),
          _noticeInfo(
            noticeState.isLoading
                ? ['Loading notices...']
                : noticeState.hasError
                ? ['Failed to load notices.']
                : (noticeState.value == null || noticeState.value!.isEmpty
                      ? ['No notices available.']
                      : noticeState.value!
                            .map((notice) => notice.title)
                            .toList()),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _noticeInfo(List<String> notices) {
    return Expanded(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 30,
          autoPlay: true,
          autoPlayInterval: const Duration(milliseconds: 7000),
          scrollDirection: Axis.vertical,
          viewportFraction: 1.0,
        ),
        items: notices.map((notice) {
          return Builder(
            builder: (BuildContext context) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  notice,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
