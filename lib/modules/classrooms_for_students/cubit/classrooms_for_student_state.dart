part of 'classrooms_for_student_cubit.dart';

@immutable
abstract class ClassroomsForStudentState {}

class ClassroomsForStudentInitial extends ClassroomsForStudentState {}
class ClassroomsForStudentLoadingState extends ClassroomsForStudentState {}
class ClassroomsForStudentSuccessState extends ClassroomsForStudentState {
  final ClassOneStudentModel classOneStudentModel;
  ClassroomsForStudentSuccessState (this.classOneStudentModel);
}
class ClassroomsForStudentErrorState extends ClassroomsForStudentState {
  final String error;
  ClassroomsForStudentErrorState(this.error);
}
