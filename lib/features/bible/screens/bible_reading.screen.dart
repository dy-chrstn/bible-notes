import 'package:bible_notes/core/utils/app_enum.dart';
import 'package:bible_notes/features/bible/widgets/background_color_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class BibleReadingScreen extends StatefulWidget {
  const BibleReadingScreen({super.key});

  static const routeName = 'BibleReadingScreen';

  @override
  State<BibleReadingScreen> createState() => _BibleReadingScreenState();
}

class _BibleReadingScreenState extends State<BibleReadingScreen> {
  late final ScrollController _scrollController;

  bool _isBottomBarVisible = true;
  FontFamily _selectedFontFamily = FontFamily.notoSerif;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(_listenToScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listenToScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _listenToScroll() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      if (_isBottomBarVisible) {
        setState(() => _isBottomBarVisible = false);
      }
    }

    if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      if (!_isBottomBarVisible) {
        setState(() => _isBottomBarVisible = true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            title: const Text('Bible Reading'),
            floating: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.bookmark_border),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
            ],
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
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _isBottomBarVisible ? kBottomNavigationBarHeight + 16 : 0,
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => showReadingSettings(context),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showReadingSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => StatefulBuilder(builder: (BuildContext context, StateSetter modalSetState) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Reading Settings',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Background Color'),
                  Row(
                    children: [
                      BackgroundColorButtonWidget(
                        color: Colors.white,
                        tooltip: 'White',
                        onTapButton: () {},
                      ),
                      BackgroundColorButtonWidget(
                        color: const Color(0xFFF5DEB3),
                        tooltip: 'Sepia',
                        onTapButton: () {},
                      ),
                      BackgroundColorButtonWidget(
                        color: Colors.black,
                        tooltip: 'Black',
                        onTapButton: () {},
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 60,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Font Family',
                      ),
                      const SizedBox(width: 24),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: FontFamily.values.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemBuilder: (_, index) {
                          final fontFamily = FontFamily.values[index];

                          return ChoiceChip(
                            label: Text(
                              fontFamily.text,
                              style: TextStyle(
                                fontFamily: switch (fontFamily) {
                                  FontFamily.notoSerif => GoogleFonts.notoSerif().fontFamily,
                                  FontFamily.openSans => GoogleFonts.openSans().fontFamily,
                                  FontFamily.ebGaramond => GoogleFonts.ebGaramond().fontFamily,
                                  FontFamily.lexend => GoogleFonts.lexend().fontFamily,
                                  FontFamily.playfairDisplay => GoogleFonts.playfairDisplay().fontFamily,
                                },
                              ),
                            ),
                            selected: _selectedFontFamily == fontFamily,
                            onSelected: (_) => modalSetState(() => _selectedFontFamily = fontFamily),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
