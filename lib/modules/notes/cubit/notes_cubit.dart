import 'package:e_school/models/notes_model.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  static NotesCubit get(context) => BlocProvider.of(context);
  NotesModel? notesModel;
  List <dynamic>? notes;
  void getNotices()
  {
    emit(NotesLoadingState());
    DioHelper.getData(
      url: 'Sshownotices',
      token: token
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
