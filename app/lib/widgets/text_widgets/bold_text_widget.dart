import 'package:flutter/material.dart';

class BoldTextWidget extends StatelessWidget {
  const BoldTextWidget({
    super.key,
    required this.text,
    required this.targets,
    required this.style,
  });

  final String text;
  final List<String> targets;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final pattern = RegExp(targets.map((t) => RegExp.escape(t)).join('|'));
    final matches = pattern.allMatches(text);

    int currentIndex = 0;
    List<TextSpan> spans = [];

    final baseStyle = style;

    final boldStyle = baseStyle.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.red,
    );

    for (final match in matches) {
      if (match.start > currentIndex) {
        spans.add(
          TextSpan(
            text: text.substring(currentIndex, match.start),
            style: baseStyle,
          ),
        );
      }
      spans.add(TextSpan(text: match.group(0), style: boldStyle));

      currentIndex = match.end;
    }

    if (currentIndex < text.length) {
      spans.add(TextSpan(text: text.substring(currentIndex), style: baseStyle));
    }

    return RichText(
      text: TextSpan(children: spans),
      textAlign: TextAlign.start,
    );
  }
}
