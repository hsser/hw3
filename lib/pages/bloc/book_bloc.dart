import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hw3/models/book.dart';

part 'book_event.dart';
part 'book_state.dart';

// Define the sort type
enum SortType { title, author }

class BookBloc extends Bloc<BookEvent, BookState> {
  List<Book> books = []; // The list of books
  late Book selectedBook; // The book that is selected
  SortType sortType = SortType.author;

  BookBloc() : super(BooksInitial()) {
    on<SortBooksByTitle>(_onSortBooksByTitle);
    on<SortBooksByAuthor>(_onSortBooksByAuthor);
    on<LoadBookDetail>(_onLoadBookDetail);
    on<ReturnToBookList>(_onReturnToBookList);
  }

  // Initialize the list of books
  void init() {
    books.clear();
    books.addAll(List.generate(10, (index) => Book.createMockUser()));
    add(SortBooksByAuthor());
  }

  // Event handlers
  void _onSortBooksByTitle(SortBooksByTitle event, Emitter<BookState> emit) {
    sortType = SortType.title;
    books.sort((a, b) => a.title.compareTo(b.title));
    emit(BooksListLoaded(List.from(books)));
  }

  void _onSortBooksByAuthor(SortBooksByAuthor event, Emitter<BookState> emit) {
    sortType = SortType.author;
    books.sort((a, b) => a.author.compareTo(b.author));
    emit(BooksListLoaded(List.from(books)));
  }

  void _onLoadBookDetail(LoadBookDetail event, Emitter<BookState> emit) {
    try {
      selectedBook = event.book;
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
