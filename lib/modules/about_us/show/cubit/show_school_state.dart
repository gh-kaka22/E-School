part of 'show_school_cubit.dart';

@immutable
abstract class ShowSchoolState {}

class ShowSchoolInitial extends ShowSchoolState {}
class ShowSchoolLoadingState extends ShowSchoolState {}
class ShowSchoolSuccessState extends ShowSchoolState {
  final AboutUsModel aboutUsModel;
  ShowSchoolSuccessState(this.aboutUsModel);
}
class ShowSchoolErrorState extends ShowSchoolState {
  final String error;
  ShowSchoolErrorState(this.error);
}
