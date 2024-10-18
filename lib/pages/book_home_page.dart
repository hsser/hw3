import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw3/pages/bloc/book_bloc.dart';
import 'package:hw3/pages/views/view_export.dart';
import 'package:hw3/models/book.dart';

class BookHomePage extends StatelessWidget {
  const BookHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Book> books =
        List.generate(10, (index) => Book.createMockUser());

    return BlocProvider(
      create: (_) => BookBloc(),
      child: const BookLoadingView(),
    );
  }
}
