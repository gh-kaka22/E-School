import 'package:e_school/modules/exams/cubit/exams_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamsCubit extends Cubit<ExamsStates> {
  ExamsCubit() : super(ExamsInitialState());

  static ExamsCubit get(context) => BlocProvider.of(context);

  String dropDownValue = 'Exams T1';

  List<DropdownMenuItem> menuItems = [
    DropdownMenuItem(
      value: 'Exams T1',
      child: Text('Exams T1'),
    ),
    DropdownMenuItem(
      value: 'Mid',
      child: Text('Mid'),
    ),
    DropdownMenuItem(
      value: 'Exams T2',
      child: Text('Exams T2'),
    ),
    DropdownMenuItem(
      value: 'Final',
      child: Text('Final'),
    ),

  ];
  void changeDropDownButton(String newValue)
  {
    dropDownValue = newValue;
    emit(ExamsDropDownButtonState());
  }

}