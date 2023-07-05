part of 'add_school_cubit.dart';

@immutable
abstract class AddSchoolState {}

class AddSchoolInitial extends AddSchoolState {}
class AddSchoolLoadingState extends AddSchoolState {}
class AddSchoolSuccessgState extends AddSchoolState {
  final AboutUsModel? aboutUsModel;
  AddSchoolSuccessgState(this.aboutUsModel);
}
class AddSchoolErrorState extends AddSchoolState {
  final String error;
  AddSchoolErrorState(this.error);
}
