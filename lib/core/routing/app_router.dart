import 'package:bible_notes/features/bible/screens/bible_search_verse.screen.dart';
import 'package:bible_notes/features/notes/screens/note_list.screen.dart';
import 'package:bible_notes/features/settings/screens/settings.screen.dart';
import 'package:bible_notes/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const String homeRoutePath = '/';
const String bibleSearchVerseRoutePath = '/bible';
const String noteListRoutePath = '/notes';
const String settingsRoutePath = '/settings';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

// GoRouter configuration
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: homeRoutePath,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              switch (state.matchedLocation) {
                homeRoutePath => 'Home',
                bibleSearchVerseRoutePath => 'Bible',
                settingsRoutePath => 'Settings',
                noteListRoutePath => 'Notes',
                _ => '',
              },
            ),
          ),
          drawer: Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ColoredBox(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: DrawerHeader(
                    child: Text(
                      'Bible Notes',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () => _onTapItem(context, homeRoutePath),
                ),
                ListTile(
                  leading: const Icon(Icons.book),
                  title: const Text('Bible'),
                  onTap: () => _onTapItem(context, bibleSearchVerseRoutePath),
                ),
                ListTile(
                  leading: const Icon(Icons.note),
                  title: const Text('Notes'),
                  onTap: () => _onTapItem(context, noteListRoutePath),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () => _onTapItem(context, settingsRoutePath),
                ),
              ],
            ),
          ),
          body: child,
        );
      },
      routes: [
        GoRoute(
          name: HomeScreen.routeName,
          path: homeRoutePath,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: BibleSearchVerseScreen.routeName,
          path: bibleSearchVerseRoutePath,
          builder: (context, state) => const BibleSearchVerseScreen(),
        ),
        GoRoute(
          name: SettingsScreen.routeName,
          path: settingsRoutePath,
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          name: NoteListScreen.routeName,
          path: noteListRoutePath,
          builder: (context, state) => const NoteListScreen(),
        ),
      ],
    ),
  ],
);

_onTapItem(BuildContext context, String path) {
  context.pop();
  context.go(path);
}
