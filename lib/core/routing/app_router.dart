import 'package:bible_notes/core/routing/route_transitions.dart';
import 'package:bible_notes/features/bible/screens/bible_reading.screen.dart';
import 'package:bible_notes/features/bible/screens/bible_search_verse.screen.dart';
import 'package:bible_notes/features/notes/screens/note_list.screen.dart';
import 'package:bible_notes/features/notes/screens/note_view.screen.dart';
import 'package:bible_notes/features/settings/screens/settings.screen.dart';
import 'package:bible_notes/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const String homeRoutePath = '/';
const String bibleSearchVerseRoutePath = '/bible-search-verse';
const String noteListRoutePath = '/notes';
const String noteViewRoutePath = '/note-view';
const String settingsRoutePath = '/settings';
const String bibleReadingRoutePath = '/bible-reading';

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
                  color: Theme.of(context).primaryColor,
                  child: DrawerHeader(
                    child: Text(
                      'Bible Notes',
                      style: Theme.of(context).primaryTextTheme.titleLarge,
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
          // builder: (context, state) => const HomeScreen(),
          pageBuilder: (context, state) => slideTransition(
            context: context,
            state: state,
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          name: BibleSearchVerseScreen.routeName,
          path: bibleSearchVerseRoutePath,
          // builder: (context, state) => const BibleSearchVerseScreen(),
          pageBuilder: (context, state) => slideTransition(
            context: context,
            state: state,
            child: const BibleSearchVerseScreen(),
          ),
        ),
        GoRoute(
          name: SettingsScreen.routeName,
          path: settingsRoutePath,
          // builder: (context, state) => const SettingsScreen(),
          pageBuilder: (context, state) => slideTransition(
            context: context,
            state: state,
            child: const SettingsScreen(),
          ),
        ),
        GoRoute(
          name: NoteListScreen.routeName,
          path: noteListRoutePath,
          // builder: (context, state) => const NoteListScreen(),
          pageBuilder: (context, state) => slideTransition(
            context: context,
            state: state,
            child: const NoteListScreen(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: bibleReadingRoutePath,
      name: BibleReadingScreen.routeName,
      builder: (context, state) => const BibleReadingScreen(),
    ),
    GoRoute(
      name: NoteViewScreen.routeName,
      path: '$noteViewRoutePath/:id',
      builder: (context, state) => NoteViewScreen(
        id: int.parse(state.pathParameters['id']!),
      ),
    ),
  ],
);

_onTapItem(BuildContext context, String path) {
  context.pop();
  context.go(path);
}
