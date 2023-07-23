import 'package:bloc/bloc.dart';
import 'package:e_school/models/notes_model.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  static NotesCubit get(context) => BlocProvider.of(context);
  NotesModel? notesModel;
  List <dynamic>? notes;
  void getAbsences()
  {
    emit(NotesLoadingState());
    DioHelper.getData(
      url: 'Sshownotices',
      token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYWU5NWZhZDMxZTJjOGViMTY5NTVlMDQ5NTk4MDgwZGM4MTg2NWZmODYyMmUwYTAyZjJjMTYzYzg2NzNiZDFjNTMzNWFhYjRiNGZkYjA4NjAiLCJpYXQiOjE2ODk2MTI0NzEuNDY3ODc3LCJuYmYiOjE2ODk2MTI0NzEuNDY3OTg4LCJleHAiOjE3MjEyMzQ4NzEuNDMyNDQ5LCJzdWIiOiIxMyIsInNjb3BlcyI6W119.zJV9ok3CP39V2KazpF294gxSsvqvjzj92eRDwGyQ8bVQp5C7VloBfvYY2DDsIZEakIUawN_0OAuJ7de2B1YNjdWAnafdghUJIXdDaaRBUEjNlzq5NMQqovBBH2lodXeNo29UbhBpK45fQiXLXR9sZNp9G7fmNAdg-hYMiyk6PgKrtnUWRjcmxX5hOPlTlRmxYqA149xh4eV9r5EhOt8jsovSKsUWGXMj81vKXAt4rY8U3JX6C4glRyYzqckFobLACjSWtWW9VUTKFEcVHzEY55og5fPDdS5aARlejH85tbZZNJOgssMsuddgSF9DHxhr3V1KTiSsV-AAbAvE1-fc24knF_lfqR9cBM_a6pP0mCEbfqm3Jken2W8tGK4OB9vAyJP-x-YUSK0cbPHEWje87idfhpDs19KulgYM5HT75wUWs5RpTCAq1c856IY3eg_mKlVhp1k1g-Lwi5WxeqVKxQ37QGMcAE7CJN7z7O3FMMmDSE4MvJPZVVl67xiauco5xpf5JmcSF4G3Qio46Xr7F_aPc3S3_EOahh4oTBj6uWF798N4snDfifZLJRY8lKpDJisHJTJVEHEFhV7W_NETzQu6bwkfm1P4N3hRcm0Kco9rjZ8lrgQnClkPRHmkQTf3bfJQ14STScufvq-dIhgFqAUbDFEJuLwMqIF8u9dTpyw',
    ).then((value) {
      print(value?.data);
      notesModel=NotesModel.fromJson(value?.data);
      print(notesModel?.status);
      print(notesModel?.message);
      notes=notesModel?.data;
      emit(NotesSuccessState(notesModel!));
    }).catchError((error){
      print(error.toString());
      emit(NotesErrorState(error.toString()));
    });

  }

}
