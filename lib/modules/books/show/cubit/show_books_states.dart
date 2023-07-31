import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/models/show_book_model.dart';
import 'package:untitled/models/show_file_model.dart';

abstract class ShowBooksStates {}

class ShowBooksInitialState extends ShowBooksStates {}
class ShowBooksLoadingState extends ShowBooksStates{}
class ShowBooksSuccessState extends ShowBooksStates{
  final ShowBookModel showBookModel;
  ShowBooksSuccessState(this.showBookModel);
}

class ShowBooksErrorState extends ShowBooksStates{
  final String error;
  ShowBooksErrorState(this.error);
}
class ShowBooksClassDropDownButtonState extends ShowBooksStates{}


class DeleteBooksLoadingState extends ShowBooksStates{}
class DeleteBooksSuccessState extends ShowBooksStates{
}

class DeleteBooksErrorState extends ShowBooksStates{
  final String error;
  DeleteBooksErrorState(this.error);
}

