

import 'package:untitled/models/add_book_model.dart';


abstract class AddBookStates {}

class AddBookInitialState extends AddBookStates {}
class AddBookLoadingState extends AddBookStates {}
class AddBookSuccessState extends AddBookStates {
  final AddBookModel addBookModel;

  AddBookSuccessState(this.addBookModel);
}
class AddBookErrorState extends AddBookStates{
  final String error;
  AddBookErrorState(this.error);
}
class AddBookChangeGradeDropDownButtonState extends AddBookStates {}
