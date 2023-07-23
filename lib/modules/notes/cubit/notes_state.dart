part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}
class NotesLoadingState extends NotesState {}
class NotesSuccessState extends NotesState {
  final NotesModel notesModel;
  NotesSuccessState(this.notesModel);
}
class NotesErrorState extends NotesState {
  final String error;
  NotesErrorState(this.error);
}
