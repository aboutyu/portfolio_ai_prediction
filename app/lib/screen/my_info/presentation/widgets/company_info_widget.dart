import 'package:app/helpers/configures/app_config.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/my_info/presentation/view_models/my_info_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompanyInfoWidget extends ConsumerWidget {
  const CompanyInfoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = context.tr;
    final serviceInfo = AppConfig.serviceInfo;
    final packageInfo = ref.watch(packageInfoProvider);

    String bottomText =
        '${tr.companyAddressText}: ${serviceInfo.companyAddress} | ';
    bottomText += '${tr.companyCeoText}: ${serviceInfo.ceoName} | ';
    bottomText +=
        '${tr.companyYouthProtectionManagerText}: ${serviceInfo.privateManagerName} | ';
    bottomText += '${tr.companyRegistrationText}: ${serviceInfo.companyNumber}';

    const TextStyle infoStyle = TextStyle(
      color: Colors.grey,
      fontSize: 11,
      height: 1.4,
    );

    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          const Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${serviceInfo.companyName} | ${serviceInfo.serviceName}',
                  style: infoStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(bottomText, style: infoStyle),
                const SizedBox(height: 6),
                Text(
                  '© 2026 ${serviceInfo.companyName}. All rights reserved.',
                  style: infoStyle,
                ),
                Text(
                  'App Version: ${packageInfo.asData?.value.version}',
                  style: infoStyle,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
