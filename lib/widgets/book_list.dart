import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw3/models/book.dart';
import 'package:hw3/pages/bloc/book_bloc.dart';

class BookList extends StatelessWidget {
  final List<Book> books;
  const BookList({required this.books, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Enable horizontal scrolling
      child: Row(
        // Use Row to lay out children horizontally
        children: books
            .map((book) => Padding(
                  padding: EdgeInsets.only(
                    left: books.indexOf(book) == 0 ? 20 : 10,
                  ),
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<BookBloc>(context)
                          .add(LoadBookDetail(book));
                    },
                    child: Image.network(
                      book.imageUrl,
                      width: 100,
                      height: 167,
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
