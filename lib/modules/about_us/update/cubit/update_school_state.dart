part of 'update_school_cubit.dart';

@immutable
abstract class UpdateSchoolState {}

class UpdateSchoolInitial extends UpdateSchoolState {}
class UpdateSchoolLoading extends UpdateSchoolState {}
class UpdateSchoolSuccess extends UpdateSchoolState {
  final AboutUsModel aboutUsModel;
  UpdateSchoolSuccess(this.aboutUsModel);
}
class UpdateSchoolError extends UpdateSchoolState {
  final String error;
  UpdateSchoolError(this.error);
}



class ShowSchoolInfoLoading  extends UpdateSchoolState {}
class ShowSchoolInfoSuccess extends UpdateSchoolState {
  final AboutUsModel aboutUsModel;
  ShowSchoolInfoSuccess(this.aboutUsModel);
}
class ShowSchoolSchoolError extends UpdateSchoolState {
  final String error;
  ShowSchoolSchoolError(this.error);
}
