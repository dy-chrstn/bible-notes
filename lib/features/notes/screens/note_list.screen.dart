import 'package:flutter/cupertino.dart';

class NoteListScreen extends StatelessWidget {
  const NoteListScreen({super.key});

  static const String routeName = 'NoteListScreen';

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Note List Screen'),
      ],
    );
  }
}
