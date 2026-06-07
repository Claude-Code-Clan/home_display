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
      child: MarkdownTheme(
        data: MarkdownThemeData(
          textStyle: Theme.of(context).textTheme.bodyLarge!,
          h1Style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          h2Style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          quoteStyle: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            color: Colors.grey[600],
          ),
          spanFilter: (span) => !span.style.contains(MD$Style.spoiler),
        ),
        child: MarkdownWidget(
          markdown: Markdown.fromString(
            markdownData,
          ),
        ),
      ),
    );
  }
}
