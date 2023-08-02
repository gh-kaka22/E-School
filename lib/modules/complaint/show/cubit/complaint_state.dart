part of 'complaint_cubit.dart';

@immutable
abstract class ComplaintState {}

class ComplaintInitial extends ComplaintState {}
class ComplaintLoadingState extends ComplaintState {}

class ComplaintSuccessState extends ComplaintState {
  ComplaintModel complaintModel;
  ComplaintSuccessState(this.complaintModel);
}
class ComplaintErrorState extends ComplaintState {
  final String error;
  ComplaintErrorState (this.error);
}
///=============================================
class StatusComplaintLoadingState extends ComplaintState {}
class StatusComplaintSuccessState extends ComplaintState {
  StatusComplaintModel statusComplaintModel;
  StatusComplaintSuccessState(this.statusComplaintModel);
}
class StatusComplaintErrorState extends ComplaintState {
  final String error;
  StatusComplaintErrorState(this.error);
}
///==============================================
class PressedState extends ComplaintState {}