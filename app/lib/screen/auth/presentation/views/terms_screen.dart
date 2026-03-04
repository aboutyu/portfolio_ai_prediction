import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/configures/app_config.dart';
import 'package:app/helpers/extensions/async_value_extension.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/auth/data/models/terms_model.dart';
import 'package:app/screen/auth/presentation/view_models/terms_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsScreen extends ConsumerStatefulWidget {
  const TermsScreen({super.key, this.index = 0});

  final int index;

  @override
  ConsumerState<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends ConsumerState<TermsScreen> {
  late final WebViewController _webViewController;
  late int _selectedIndex = widget.index;

  Future<void> _loadUrl(TermsType type) async {
    final typeStr = type.name;
    final urlString = '${AppConfig.host}membership/terms/html?type=$typeStr';
    debugMessage('[TermsScreen] Loading URL: $urlString');

    final url = Uri.parse(urlString);
    await _webViewController.loadRequest(url);
  }

  @override
  void initState() {
    super.initState();

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000));

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final initialType = TermsType.values[_selectedIndex];
      await _loadUrl(initialType);
    });
  }

  @override
  Widget build(BuildContext context) {
    final termsList = ref.watch(termsViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.tr.termsAgreeButtonText)),
      body: termsList.draws(
        data: (terms) {
          return Column(
            children: [
              SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  itemCount: terms.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final term = terms[index];
                    final isSelected = _selectedIndex == index;

                    return ChoiceChip(
                      label: Text(
                        term.termsName, // "서비스 이용약관" 등
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      selected: isSelected,
                      selectedColor: Theme.of(context).primaryColor,
                      onSelected: (selected) async {
                        if (selected) {
                          setState(() {
                            _selectedIndex = index;
                          });
                          // 탭 누르면 해당 URL 로드
                          await _loadUrl(term.type);
                        }
                      },
                    );
                  },
                ),
              ),
              const Divider(height: 1),
              Expanded(child: WebViewWidget(controller: _webViewController)),
            ],
          );
        },
      ),
    );
  }
}
