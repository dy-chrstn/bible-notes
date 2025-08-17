import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String routeName = 'SettingsScreen';

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Settings Screen'),
      ],
    );
  }
}
