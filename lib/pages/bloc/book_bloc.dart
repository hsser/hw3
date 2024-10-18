import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hw3/models/book.dart';

part 'book_event.dart';
part 'book_state.dart';

enum SortType { title, author }

class BookBloc extends Bloc<BookEvent, BookState> {
  List<Book> books = [];
  late Book selectedBook;
  SortType sortType = SortType.author;

  BookBloc() : super(BooksLoading()) {
    on<LoadBooks>(_onLoadBooks);
    on<SortBooksByTitle>(_onSortBooksByTitle);
    on<SortBooksByAuthor>(_onSortBooksByAuthor);
    on<LoadBookDetail>(_onLoadBookDetail);
    on<ReturnToBookList>(_onReturnToBookList);
  }

  void init() {
    books.clear();
    books.addAll(List.generate(10, (index) => Book.createMockUser()));
    add(SortBooksByAuthor());
  }

  void _onLoadBooks(LoadBooks event, Emitter<BookState> emit) {
    emit(BooksListLoaded(List.from(books)));
  }

  void _onSortBooksByTitle(SortBooksByTitle event, Emitter<BookState> emit) {
    emit(BooksLoading());
    sortType = SortType.title;
    books.sort((a, b) => a.title.compareTo(b.title));
    emit(BooksListLoaded(List.from(books)));
  }

  void _onSortBooksByAuthor(SortBooksByAuthor event, Emitter<BookState> emit) {
    emit(BooksLoading());
    sortType = SortType.author;
    books.sort((a, b) => a.author.compareTo(b.author));
    Future.delayed(const Duration(seconds: 3));
    emit(BooksListLoaded(List.from(books)));
  }

  void _onLoadBookDetail(LoadBookDetail event, Emitter<BookState> emit) {
    try {
      selectedBook = books.firstWhere((book) => book == event.book);
      emit(BookDetailLoaded());
    } catch (e) {
      emit(const BooksError(
          'Book not found')); // Handle the case where no book matches
    }
  }

  void _onReturnToBookList(ReturnToBookList event, Emitter<BookState> emit) {
    emit(BooksListLoaded(List.from(books)));
  }
}
