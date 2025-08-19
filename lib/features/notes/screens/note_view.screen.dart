import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:go_router/go_router.dart';

class NoteViewScreen extends StatefulWidget {
  const NoteViewScreen({super.key, required this.id});

  final int id;

  static const String routeName = 'NoteViewScreen';

  @override
  State<NoteViewScreen> createState() => _NoteViewScreenState();
}

class _NoteViewScreenState extends State<NoteViewScreen> {
  final QuillController _controller = QuillController.basic();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note View'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.link),
            onPressed: showBibleLinkDialog,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: QuillEditor.basic(
                  controller: _controller,
                  config: const QuillEditorConfig(),
                ),
              ),
            ),
            QuillSimpleToolbar(
              controller: _controller,
              config: const QuillSimpleToolbarConfig(
                showInlineCode: false,
                showSubscript: false,
                showSuperscript: false,
                showColorButton: false,
                showStrikeThrough: false,
                showUnderLineButton: false,
                showClearFormat: false,
                showCodeBlock: false,
                showQuote: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  showBibleLinkDialog() {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'How would you to insert a bible verse?',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(),
              ListTile(
                onTap: () => context.pop(),
                leading: const Icon(Icons.search),
                title: const Text('Search'),
              ),
              ListTile(
                onTap: () => context.pop(),
                leading: const Icon(Icons.menu_book),
                title: const Text('Browse by Reference'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
