import 'package:bible_notes/core/routing/app_router.dart';
import 'package:bible_notes/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BibleNotesApp());
}

class BibleNotesApp extends StatelessWidget {
  const BibleNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
