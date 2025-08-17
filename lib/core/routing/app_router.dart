import 'package:bible_notes/features/notes/screens/note_list.screen.dart';
import 'package:bible_notes/features/settings/screens/settings.screen.dart';
import 'package:bible_notes/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const String homeRoutePath = '/';
const String settingsRoutePath = '/settings';
const String noteListRoutePath = '/notes';

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
            title: Text(switch (state.matchedLocation) {
              homeRoutePath => 'Home',
              settingsRoutePath => 'Settings',
              noteListRoutePath => 'Notes',
              _ => '',
            }),
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
                  title: const Text('Home'),
                  onTap: () => context.go(homeRoutePath),
                ),
                ListTile(
                  title: const Text('Settings'),
                  onTap: () => context.go(settingsRoutePath),
                ),
                ListTile(
                  title: const Text('Notes'),
                  onTap: () => context.go(noteListRoutePath),
                )
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
