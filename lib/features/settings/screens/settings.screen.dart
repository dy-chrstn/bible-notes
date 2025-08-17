import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String routeName = 'SettingsScreen';

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          leading: Icon(Icons.dark_mode),
          title: Text('Theme'),
        ),
        ListTile(
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
