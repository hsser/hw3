import 'package:flutter/material.dart';
import 'package:hw3/models/book.dart';
import 'package:hw3/widgets/book_detail.dart';

class BookDetailView extends StatelessWidget {
  final Book book;
  const BookDetailView({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ThemeData().colorScheme.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Book Detail'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: BookDetail(book: book),
    );
  }
}
