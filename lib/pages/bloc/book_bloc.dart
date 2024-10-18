import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hw3/models/book.dart';

part 'book_event.dart';
part 'book_state.dart';

enum SortType { title, author }

class BookBloc extends Bloc<BookEvent, BookState> {
  List<Book> books = [];
  SortType sortType = SortType.title;

  BookBloc() : super(BooksLoading()) {
    on<LoadBooks>(_onLoadBooks);
    on<SortBooksByTitle>(_onSortBooksByTitle);
    on<SortBooksByAuthor>(_onSortBooksByAuthor);
    on<LoadBookDetail>(_onLoadBookDetail);
    on<ReturnToBookList>(_onReturnToBookList);
  }

  void _onLoadBooks(LoadBooks event, Emitter<BookState> emit) {
    books.clear();
    // TODO: Replace the following code with a loop that creates 10 books
    emit(BooksInitialLoaded(books));
  }

  void _onSortBooksByTitle(SortBooksByTitle event, Emitter<BookState> emit) {
    sortType = SortType.title;
    books.sort((a, b) => a.title.compareTo(b.title));
    emit(BooksSortedByTitle(List.from(books)));
  }

  void _onSortBooksByAuthor(SortBooksByAuthor event, Emitter<BookState> emit) {
    books.sort((a, b) => a.author.compareTo(b.author));
    emit(BooksSortedByAuthor(List.from(books)));
  }

  void _onLoadBookDetail(LoadBookDetail event, Emitter<BookState> emit) {
    try {
      final book = books.firstWhere((book) => book == event.book);
      emit(BookDetailLoaded(book));
    } catch (e) {
      emit(const BookLoadError(
          'Book not found')); // Handle the case where no book matches
    }
  }

  void _onReturnToBookList(ReturnToBookList event, Emitter<BookState> emit) {
    emit(BooksInitialLoaded(List.from(books)));
  }
}
