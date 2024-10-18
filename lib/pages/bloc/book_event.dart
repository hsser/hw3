part of 'book_bloc.dart';

@immutable
sealed class BookEvent {
  const BookEvent();
}

class LoadBooks extends BookEvent {}

class SortBooksByTitle extends BookEvent {}

class SortBooksByAuthor extends BookEvent {}

class ReturnToBookList extends BookEvent {}

class LoadBookDetail extends BookEvent {
  const LoadBookDetail(this.book);
  final Book book;
}
