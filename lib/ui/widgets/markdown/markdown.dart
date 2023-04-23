import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class EasyGPTMarkdown extends StatelessWidget {
  final String data;

  const EasyGPTMarkdown({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: data,
      selectable: true,
      onTapLink: (text, href, title) {
        // href != null ? launchUrl(href) : null;
      },
      styleSheet: MarkdownStyleSheet(
        h1: const TextStyle(fontSize: 32.0),
        h2: const TextStyle(fontSize: 24.0),
        h3: const TextStyle(fontSize: 18.0),
        p: const TextStyle(fontSize: 16.0),
        strong: const TextStyle(fontWeight: FontWeight.bold),
        em: const TextStyle(fontStyle: FontStyle.italic),
        a: const TextStyle(color: Colors.blue),
      ),
    );
  }
}
