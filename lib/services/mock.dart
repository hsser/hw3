import 'package:flutter_lorem/flutter_lorem.dart';
import 'dart:math';

final List<String> colors = [
  "green",
  "red",
  "orange",
  "yellow",
  "blue",
  "pink",
  "cyan",
  "magenta",
  "coral",
  "brown"
];

class Mock {
  static Random random = Random();

  static String title() {
    int numberOfWords = random.nextInt(5) + 1;
    return lorem(words: numberOfWords, paragraphs: 1).replaceAll(".", "");
  }

  static String author() {
    String firstName = lorem(words: 1, paragraphs: 1).replaceAll(".", "");
    String lastName = lorem(words: 1, paragraphs: 1).replaceAll(".", "");
    return '$firstName $lastName';
  }

  static String description() {
    return lorem(words: 200, paragraphs: 1);
  }

  static String imageUrl({String? firstName, String? lastName}) {
    return 'https://placehold.co/600x400/'
        '${colors[random.nextInt(10)]}'
        '/${colors[random.nextInt(10)]}.png';
  }
}
