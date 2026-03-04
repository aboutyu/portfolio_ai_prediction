import 'package:app/helpers/commons/colors.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/widgets/text_widgets/bold_text_widget.dart';
import 'package:flutter/material.dart';

class ChatNoticeWidget extends StatefulWidget {
  const ChatNoticeWidget({super.key, required this.isNoticeVisible});

  final bool isNoticeVisible;

  @override
  _ChatNoticeWidgetState createState() => _ChatNoticeWidgetState();
}

class _ChatNoticeWidgetState extends State<ChatNoticeWidget> {
  bool get _isNoticeVisible => widget.isNoticeVisible;
  final targets = ['[AI is Not a Doctor]', '[AI는 의사가 아닙니다]'];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      height: _isNoticeVisible ? 60.0 : 0.0,
      child: ClipRect(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(height: 60.0, child: _noticeArea(context)),
        ),
      ),
    );
  }

  Widget _noticeArea(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: appbarBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(24.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: BoldTextWidget(
        text: context.tr.chatNoticeText,
        targets: targets,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 10.5,
          height: 1.4,
        ),
      ),
    );
  }
}
