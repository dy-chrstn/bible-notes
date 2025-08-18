enum BibleSearchTabs { book, chapter, verse }

enum ThemeMode { light, dark }

// 'Noto Serif',
// 'Open Sans',
// 'EB Garamond',
// 'Lexend',
// 'Playfair Display',
enum FontFamily {
  notoSerif('Noto Serif'),
  openSans('Open Sans'),
  ebGaramond('EB Garamond'),
  lexend('Lexend'),
  playfairDisplay('Playfair Display');

  final String text;

  const FontFamily(this.text);
}
