import 'package:e_school/models/book_model.dart';
import 'package:e_school/models/files_model.dart';

abstract class ParentLibraryStates{}

class ParentLibraryInitialState extends ParentLibraryStates{}
class ParentLibraryLoadingState extends ParentLibraryStates{}

class ParentLibrarySuccessState extends ParentLibraryStates{
  final FilesModel filesModel;
  ParentLibrarySuccessState(this.filesModel);
}

class ParentLibraryErrorState extends ParentLibraryStates{
  final String error;
  ParentLibraryErrorState(this.error);
}

class ParentBooksInitialState extends ParentLibraryStates{}
class ParentBooksLoadingState extends ParentLibraryStates{}

class ParentBooksSuccessState extends ParentLibraryStates{
  final BookModel bookModel;
  ParentBooksSuccessState(this.bookModel);
}

class ParentBooksErrorState extends ParentLibraryStates{
  final String error;
  ParentBooksErrorState(this.error);
}

class ToggleState extends ParentLibraryStates{}