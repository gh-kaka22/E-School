



import 'package:flutter/material.dart';
import 'package:untitled/models/add_book_model.dart';
import 'package:untitled/models/add_classroom_model.dart';
import 'package:untitled/models/add_subject_model.dart';
import 'package:untitled/models/subject_model.dart';
import 'package:untitled/modules/books/add/cubit/add_book_states.dart';
import 'package:untitled/modules/classrooms/add/cubit/add_classroom_states.dart';
import 'package:untitled/modules/subjects/add/cubit/add_subject_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class AddBookCubit extends Cubit<AddBookStates> {
  AddBookCubit() : super(AddBookInitialState());
  static AddBookCubit get(context) => BlocProvider.of(context);

  String? grade;
  List<DropdownMenuItem<String>> GradeItems = [
    DropdownMenuItem(
      value: '7',
      child: Text('Seventh'),
    ),
    DropdownMenuItem(
      value: '8',
      child: Text('Eighth'),
    ),
    DropdownMenuItem(
      value: '9',
      child: Text('Ninth'),
    ),
  ];

  void changeGradeDropDownButton(String gr) {
    grade = gr;
    emit(AddBookChangeGradeDropDownButtonState());
  }

  AddBookModel? addBookModel;
  void AddBook(
      {
        required  name,
        required  url,
        required  gradeId,
        required  token,
      }
      )
  {
    emit(
      AddBookLoadingState(),
    );
    DioHelper.postData(
      token: token,
      url: ADDBOOK,
      data: {
        'name': name,
        'url': url,
        'grade_id': gradeId,
      },
    ).then((value) {
      print(value?.data);
      addBookModel = AddBookModel.fromJson(value?.data);
      emit(AddBookSuccessState(addBookModel!));
    })
        .catchError((error) {
      print("momo ${error.response.data}");
      emit(
        AddBookErrorState(error.toString()),
      );
    });


  }
}
