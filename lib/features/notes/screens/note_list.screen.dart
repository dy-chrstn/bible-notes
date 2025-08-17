import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NoteListScreen extends StatelessWidget {
  const NoteListScreen({super.key});

  static const String routeName = 'NoteListScreen';

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemCount: 20,
      itemBuilder: (context, index) => Card.outlined(
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
    );
  }
}
