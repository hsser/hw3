import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw3/pages/bloc/book_bloc.dart';
import 'package:hw3/pages/views/view_export.dart';

class BookHomePage extends StatelessWidget {
  const BookHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookBloc()..init(),
      child: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          switch (state) {
            case BooksInitial _:
              return BookListView(
                  books: BlocProvider.of<BookBloc>(context).books);
            case BooksListLoaded _:
              return BookListView(books: state.books);
            case BookDetailLoaded _:
              return const BookDetailView();
            case BooksError _:
              return BookErrorView(
                errorText: state.message,
              );
            default:
              return BookListView(
                  books: BlocProvider.of<BookBloc>(context).books);
          }
        },
      ),
    );
  }
}
