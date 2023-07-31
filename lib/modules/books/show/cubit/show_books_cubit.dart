import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/show_book_model.dart';
import 'package:untitled/modules/books/show/cubit/show_books_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class ShowBooksCubit extends Cubit<ShowBooksStates> {
  ShowBooksCubit() : super(ShowBooksInitialState());

  static ShowBooksCubit get(context) => BlocProvider.of(context);

  String? dropDownValueClass = '7';

  List<DropdownMenuItem> menuItems = [
    DropdownMenuItem(
      value: '7',
      child: Text('7'),
    ),
    DropdownMenuItem(
      value: '8',
      child: Text('8'),
    ),
    DropdownMenuItem(
      value: '9',
      child: Text('9'),
    ),
  ];

  // drop down buttons changing method
  void changeClassDropDownButton(String newValue)
  {
    dropDownValueClass = newValue;
    emit(ShowBooksClassDropDownButtonState());
  }


  ShowBookModel? showBookModel;
  List<dynamic>? books;

  void getBooksByGrade(grade)
  {
    emit(ShowBooksLoadingState());
    DioHelper.getData(
      url: '${SHOWBOOKS}?grade_id=${grade}',
      token: token,
    ).then((value) {
      print(value?.data);
      showBookModel = ShowBookModel.fromJson(value?.data);
      print(showBookModel?.status);
      print(showBookModel?.message);
      print(showBookModel?.data[0]);
      books = showBookModel?.data;
      print(books?[1].name);
      emit(ShowBooksSuccessState(showBookModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowBooksErrorState(error.toString()));
    });
  }

  void deleteBook(id)
  {
    emit(DeleteBooksLoadingState());
    DioHelper.deleteData(
      url: '${DELETEBOOK}/${id}',
      token: token,
    ).then((value) {
      print(value?.data);
      emit(DeleteBooksSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(DeleteBooksErrorState(error.toString()));
    });
  }








}

