import 'package:app/helpers/advertising/ad_manager_admob.dart';
import 'package:app/screen/home/presentation/view_models/home_view_model.dart';
import 'package:app/screen/home/presentation/widgets/home_header_widget.dart';
import 'package:app/screen/home/presentation/widgets/home_timeline_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      AdManagerAdmob().showInterstitialOnce('home_screen', onAdClosed: () {});
      ref.read(homeViewModelProvider.notifier).checkAndRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 상단 영역
              HomeHeaderWidget(),

              // 타임라인 영역
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: HomeTimelineWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
