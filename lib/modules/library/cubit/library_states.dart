import 'package:e_school/models/book_model.dart';
import 'package:e_school/models/files_model.dart';

abstract class LibraryStates{}

class LibraryInitialState extends LibraryStates{}
class LibraryLoadingState extends LibraryStates{}

class LibrarySuccessState extends LibraryStates{
  final FilesModel filesModel;
  LibrarySuccessState(this.filesModel);
}

class LibraryErrorState extends LibraryStates{
  final String error;
  LibraryErrorState(this.error);
}

class BooksInitialState extends LibraryStates{}
class BooksLoadingState extends LibraryStates{}

class BooksSuccessState extends LibraryStates{
  final BookModel bookModel;
  BooksSuccessState(this.bookModel);
}

class BooksErrorState extends LibraryStates{
  final String error;
  BooksErrorState(this.error);
}

class ToggleState extends LibraryStates{}