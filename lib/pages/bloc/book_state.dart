part of 'book_bloc.dart';

class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BooksInitialLoaded extends BookState {
  const BooksInitialLoaded(this.books);
  final List<Book> books;

  @override
  List<Object> get props => [books];

  @override
  String toString() => 'BooksInitialLoaded { books: ${books.length} }';
}

class BooksSortedByTitle extends BookState {
  const BooksSortedByTitle(this.books);
  final List<Book> books;

  @override
  List<Object> get props => [books];

  @override
  String toString() => 'BooksSortedByTitle { books: ${books.length} }';
}

class BooksSortedByAuthor extends BookState {
  const BooksSortedByAuthor(this.books);
  final List<Book> books;

  @override
  List<Object> get props => [books];

  @override
  String toString() => 'BooksSortedByAuthor { books: ${books.length} }';
}

class BookDetailLoaded extends BookState {
  const BookDetailLoaded(this.book);
  final Book book;

  @override
  List<Object> get props => [book];

  @override
  String toString() => 'BookDetailLoaded { book: $book }';
}

class BooksLoading extends BookState {
  @override
  String toString() => 'BooksLoading';
}

class BookLoadError extends BookState {
  final String message;

  const BookLoadError(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'BookLoadError { message: $message }';
}

class BookSortError extends BookState {
  final String message;

  const BookSortError(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'BookSortError { message: $message }';
}
