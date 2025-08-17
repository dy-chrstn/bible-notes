import 'package:flutter/material.dart';

class BibleChapterTab extends StatelessWidget {
  const BibleChapterTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(8),
      crossAxisCount: 4,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: List.generate(
        40,
        (i) {
          final isSelected = i == 2;
          return Card.outlined(
            color: isSelected ? Theme.of(context).colorScheme.primary : null,
            child: Center(
              child: Text(
                '${i + 1}',
                style: isSelected ? Theme.of(context).primaryTextTheme.titleMedium : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
