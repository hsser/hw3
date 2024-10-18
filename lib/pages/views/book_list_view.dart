import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw3/models/book.dart';
import 'package:hw3/pages/bloc/book_bloc.dart';
import 'package:hw3/widgets/book_list.dart';

class BookListView extends StatelessWidget {
  const BookListView({required this.books, super.key});
  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ThemeData().colorScheme.surface,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text('Book Club Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align children to the left
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Row(
              children: <Widget>[
                const Text(
                  'Sort by:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 10),
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        context.read<BookBloc>().sortType == SortType.author
                            ? WidgetStateProperty.all(
                                ThemeData().colorScheme.surfaceContainer)
                            : null,
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: ThemeData().colorScheme.surfaceContainer,
                        ),
                      ),
                    ),
                    foregroundColor: WidgetStateProperty.all(Colors.black),
                  ),
                  onPressed: () {
                    BlocProvider.of<BookBloc>(context).add(SortBooksByAuthor());
                  },
                  child: const Text(
                    'Author',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        context.read<BookBloc>().sortType == SortType.title
                            ? WidgetStateProperty.all(
                                ThemeData().colorScheme.surfaceContainer)
                            : null,
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: ThemeData().colorScheme.surfaceContainer,
                        ),
                      ),
                    ),
                    foregroundColor: WidgetStateProperty.all(Colors.black),
                  ),
                  onPressed: () {
                    BlocProvider.of<BookBloc>(context).add(SortBooksByTitle());
                  },
                  child: const Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child: Text(
              'Books',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          BookList(books: books),
        ],
      ),
    );
  }
}
