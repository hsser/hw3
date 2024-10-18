import 'package:flutter/material.dart';
import 'package:hw3/pages/book_home_page.dart';

void main() {
  runApp(const BookClub());
}

class BookClub extends StatelessWidget {
  const BookClub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Club',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const BookHomePage(),
    );
  }
}
