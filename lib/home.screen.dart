import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(
          onPressed: () {},
          child: const Text('Test'),
        ),
      ],
    );
  }
}
