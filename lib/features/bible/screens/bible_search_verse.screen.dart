import 'package:bible_notes/core/utils/app_enum.dart';
import 'package:bible_notes/core/utils/app_extensions.dart';
import 'package:bible_notes/features/bible/tabs/bible_book.tab.dart';
import 'package:bible_notes/features/bible/tabs/bible_chapter.tab.dart';
import 'package:bible_notes/features/bible/tabs/bible_verse.tab.dart';
import 'package:flutter/material.dart';

class BibleSearchVerseScreen extends StatefulWidget {
  const BibleSearchVerseScreen({super.key});

  static const String routeName = 'BibleSearchVerseScreen';

  @override
  State<BibleSearchVerseScreen> createState() => _BibleSearchVerseScreenState();
}

class _BibleSearchVerseScreenState extends State<BibleSearchVerseScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          tabs: BibleSearchTabs.values.map((el) => Tab(text: el.name.toCapitalize())).toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: const [
              BibleBookTab(),
              BibleChapterTab(),
              BibleVerseTab(),
            ],
          ),
        ),
      ],
    );
  }
}
