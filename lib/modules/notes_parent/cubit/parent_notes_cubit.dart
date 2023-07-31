import 'package:e_school/models/notes_model.dart';
import 'package:e_school/modules/notes_parent/cubit/parent_notes_state.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ParentNotesCubit extends Cubit<ParentNotesState> {
  ParentNotesCubit() : super(ParentNotesInitial());
  static ParentNotesCubit get(context) => BlocProvider.of(context);
  NotesModel? notesModel;
  List <dynamic>? notes;
  void getNoticesParent(id)
  {
    emit(ParentNotesLoadingState());
    DioHelper.getData(
      url: '${PARENTNOTICES}/${id}',
      token: token
    ).then((value) {
      print(value?.data);
      notesModel=NotesModel.fromJson(value?.data);
      print(notesModel?.status);
      print(notesModel?.message);
      notes=notesModel?.data;
      emit(ParentNotesSuccessState(notesModel!));
    }).catchError((error){
      print(error.toString());
      emit(ParentNotesErrorState(error.toString()));
    });

  }

}
