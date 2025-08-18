import 'package:flutter/material.dart';

class BibleReadingScreen extends StatefulWidget {
  const BibleReadingScreen({super.key});

  static const routeName = 'BibleReadingScreen';

  @override
  State<BibleReadingScreen> createState() => _BibleReadingScreenState();
}

class _BibleReadingScreenState extends State<BibleReadingScreen> {
  @override
  Widget build(BuildContext context) {
    // return NestedScrollView(headerSliverBuilder: (context, sliver) => , body: body)

    return Scaffold(
      // appBar: AppBar(title: const Text('Bible Reading')),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Bible Reading'),
            floating: true,
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Mathew 1',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverList.separated(
            itemCount: 20,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Verse ${index + 1} - '
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut "
                "labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris "
                "nisi ut aliquip ex ea commodo consequat. ",
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FilledButton(
                onPressed: () {},
                child: const Text('Proceed to next book / chapter'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
