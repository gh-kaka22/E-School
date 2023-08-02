part of 'update_subject_cubit.dart';

@immutable
abstract class UpdateSubjectState {}

class UpdateSubjectInitial extends UpdateSubjectState {}
class UpdateSubjectLoading extends UpdateSubjectState {}
class UpdateSubjectSuccess extends UpdateSubjectState {
  final AddSubjectModel addSubjectModel;

  UpdateSubjectSuccess(this.addSubjectModel);
}
class UpdateSubjectError extends UpdateSubjectState {
  final String error;
  UpdateSubjectError(this.error);
}
///===========================================================

class ShowSubjectLoading extends UpdateSubjectState {}
class ShowSubjectSuccess extends UpdateSubjectState {
  final AddSubjectModel addSubjectModel;

  ShowSubjectSuccess(this.addSubjectModel);
}
class ShowSubjectError extends UpdateSubjectState {
  final String error;
  ShowSubjectError(this.error);
}
