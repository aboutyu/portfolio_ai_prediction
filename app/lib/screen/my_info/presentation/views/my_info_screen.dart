import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/my_info/presentation/widgets/company_info_widget.dart';
import 'package:app/screen/my_info/presentation/widgets/my_info_menu_widget.dart';
import 'package:app/screen/my_info/presentation/widgets/my_info_simple_notice_widget.dart';
import 'package:app/screen/my_info/presentation/widgets/user_info_widget.dart';
import 'package:app/widgets/appbar_widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInfoScreen extends ConsumerWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppbarWidget(title: context.tr.myinfoAppbarText),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const UserInfoWidget(),
                const SizedBox(height: 20),
                MyInfoSimpleNoticeWidget(),
                const SizedBox(height: 20),
                const MyInfoMenuWidget(),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // footer 영역(하단에 sticky)
          const CompanyInfoWidget(),
        ],
      ),
    );
  }
}
