import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/my_info/data/models/oss_license_model.dart';
import 'package:app/screen/my_info/data/repositories/license_provider.dart';
import 'package:app/widgets/appbar_widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LicenseScreen extends ConsumerWidget {
  const LicenseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final licenseListAsync = ref.watch(ossLicenseProvider);

    return Scaffold(
      appBar: AppbarWidget(title: context.tr.licenseInfoButtonText),
      body: licenseListAsync.when(
        data: (licenses) {
          if (licenses.isEmpty) {
            return Center(child: Text(context.tr.noLicenseInfoAvailable));
          }
          return ListView.separated(
            itemCount: licenses.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final item = licenses[index];
              return ListTile(
                title: Text(
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'v${item.version}',
                  style: const TextStyle(color: Colors.grey),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // 상세 화면으로 이동
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => _LicenseDetailScreen(license: item),
                    ),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}

/// 라이선스 상세 내용을 보여주는 화면
class _LicenseDetailScreen extends StatelessWidget {
  final OssLicenseModel license;

  const _LicenseDetailScreen({required this.license});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: license.name),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. 패키지 설명 (있으면 표시)
            if (license.description.isNotEmpty) ...[
              Text(
                license.description,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
            ],

            // 2. 라이선스 본문 (json의 license 필드)
            const Text(
              "License Detail",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                license.license, // 라이선스 전문
                style: const TextStyle(fontSize: 12, height: 1.5),
              ),
            ),

            if (license.homepage != null) ...[
              const SizedBox(height: 20),
              Text("Homepage: ${license.homepage}"),
            ],
          ],
        ),
      ),
    );
  }
}
