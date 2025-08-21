import 'package:bible_notes/features/bible/screens/bible_reading.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: Icon(
                Icons.menu_book,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: const Text('Mathew 1 - 60% read'),
              subtitle: const LinearProgressIndicator(value: 0.6),
            ),
            FilledButton(
              onPressed: () => context.pushNamed(BibleReadingScreen.routeName),
              child: const Text('Continue Reading'),
            ),
            const Divider(height: 48),
            Text(
              '"For God so loved the world, that he gave his only begotten Son, '
              'that whosoever believeth in him should not perish, but have everlasting '
              'life."',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Verse of the Day',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
