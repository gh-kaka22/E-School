part of 'show_teachers_cubit.dart';

@immutable
abstract class ShowTeachersState {}

class ShowTeachersInitial extends ShowTeachersState {}
class ShowTeachersLoadingState extends ShowTeachersState {}
class ShowTeachersSuccessState extends ShowTeachersState {
  //todo: teacherMoel
}
class ShowTeachersErrorState extends ShowTeachersState {
  final String error;
  ShowTeachersErrorState(this.error);
}
