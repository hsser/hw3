part of 'book_bloc.dart';

class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BooksListLoaded extends BookState {
  const BooksListLoaded(this.books);
  final List<Book> books;

  @override
  List<Object> get props => [books];
}

class BookDetailLoaded extends BookState {}

class BooksLoading extends BookState {}

class BooksError extends BookState {
  final String message;

  const BooksError(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'Error { message: $message }';
}
