
import 'package:e_school/models/notes_model.dart';

abstract class ParentNotesState {}

class ParentNotesInitial extends ParentNotesState {}
class ParentNotesLoadingState extends ParentNotesState {}
class ParentNotesSuccessState extends ParentNotesState {
   final NotesModel notesModel;
  ParentNotesSuccessState(this.notesModel);
}
class ParentNotesErrorState extends ParentNotesState {
  final String error;
  ParentNotesErrorState(this.error);
}
