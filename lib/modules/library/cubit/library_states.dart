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
class LibraryTypeDropDownButtonState extends LibraryStates{}
class LibraryYearDropDownButtonState extends LibraryStates{}