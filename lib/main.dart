import 'package:bible_notes/core/routing/app_router.dart';
import 'package:bible_notes/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const BibleNotesApp());
}

class BibleNotesApp extends StatelessWidget {
  const BibleNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterQuillLocalizations.delegate,
      ],
      title: 'Flutter Demo',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
