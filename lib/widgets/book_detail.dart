import 'package:flutter/material.dart';
import 'package:hw3/models/book.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              book.imageUrl,
              width: 200,
              height: 333,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              book.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              book.author,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              book.description,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
