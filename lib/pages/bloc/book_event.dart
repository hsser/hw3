part of 'book_bloc.dart';

class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class LoadBooks extends BookEvent {
  const LoadBooks();

  @override
  String toString() => 'LoadBooks';
}

class SortBooksByTitle extends BookEvent {
  const SortBooksByTitle();

  @override
  String toString() => 'SortBooksByTitle';
}

class SortBooksByAuthor extends BookEvent {
  const SortBooksByAuthor();

  @override
  String toString() => 'SortBooksByAuthor';
}

class LoadBookDetail extends BookEvent {
  const LoadBookDetail(this.book);
  final Book book;

  @override
  List<Object> get props => [book];

  @override
  String toString() => 'LoadBookDetail { book: $book }';
}

class ReturnToBookList extends BookEvent {
  const ReturnToBookList();

  @override
  String toString() => 'returnToBookList';
}
