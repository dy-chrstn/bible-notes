import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  static const String routeName = 'SettingsScreen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ThemeMode mode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const ListTile(
          leading: Icon(Icons.dark_mode),
          title: Text('Theme'),
        ),
        RadioListTile.adaptive(
          contentPadding: const EdgeInsets.symmetric(horizontal: 32),
          value: ThemeMode.light,
          groupValue: mode,
          title: const Text('Light Mode'),
          onChanged: (_) => setState(() => mode = ThemeMode.light),
        ),
        RadioListTile.adaptive(
          contentPadding: const EdgeInsets.symmetric(horizontal: 32),
          value: ThemeMode.dark,
          groupValue: mode,
          title: const Text('Dark Mode'),
          onChanged: (_) => setState(() => mode = ThemeMode.dark),
        ),
        const ListTile(
          leading: Icon(Icons.translate),
          title: Text('Bible Translation'),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
        ),
      ],
    );
  }
}
