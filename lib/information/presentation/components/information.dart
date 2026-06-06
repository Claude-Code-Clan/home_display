import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_md/flutter_md.dart';

class Information extends StatelessWidget {
  const Information({required this.markdownData, super.key});

  final String markdownData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: MarkdownWidget(
        markdown: Markdown.fromString(markdownData),
      ),
    );
  }
}
