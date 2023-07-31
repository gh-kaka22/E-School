part of 'complaints_cubit.dart';

@immutable
abstract class ComplaintsState {}

class ComplaintsInitial extends ComplaintsState {}
class ComplaintLoadingState extends ComplaintsState {}

class ComplaintSuccessState extends ComplaintsState {
  ComplaintModel complaintModel;
  ComplaintSuccessState(this.complaintModel);
}
class ComplaintErrorState extends ComplaintsState {
  final String error;
  ComplaintErrorState (this.error);
}
///====================================