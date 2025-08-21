import 'package:bible_notes/features/notes/screens/note_view.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class NoteListScreen extends StatelessWidget {
  const NoteListScreen({super.key});

  static const String routeName = 'NoteListScreen';

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: MasonryGridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemCount: 20,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => context.pushNamed(NoteViewScreen.routeName, pathParameters: {'id': '$index'}),
          behavior: HitTestBehavior.opaque,
          child: Card.outlined(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Title ${index + 1}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...List.generate(
                    index + 1,
                    (i) => Text(
                      'Text ${i + 1}',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
