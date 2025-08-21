import 'package:bible_notes/features/bible/screens/bible_reading.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jiffy/jiffy.dart';

class BookmarkListScreen extends StatelessWidget {
  const BookmarkListScreen({super.key});

  static const String routeName = 'BookmarkListScreen';

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: ListView.separated(
        itemCount: 20,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, index) => ListTile(
          onTap: () => context.pushNamed(BibleReadingScreen.routeName),
          title: Text('Genesis ${index + 1}'),
          subtitle: Text(
            "Added on ${Jiffy.parseFromDateTime(DateTime.now()).MMMMd}",
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_remove),
          ),
        ),
      ),
    );
  }
}
