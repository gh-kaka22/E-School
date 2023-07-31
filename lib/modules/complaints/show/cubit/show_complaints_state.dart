part of 'show_complaints_cubit.dart';

@immutable
abstract class ShowComplaintsState {}

class ShowComplaintsInitial extends ShowComplaintsState {}
class ShowComplaintsLoadingState extends ShowComplaintsState {}
class ShowComplaintsSuccessState extends ShowComplaintsState {
  ShowComplaintsModel showComplaintsModel;
  ShowComplaintsSuccessState(this.showComplaintsModel);
}
class ShowComplaintsErrorState extends ShowComplaintsState {
  final String error;
  ShowComplaintsErrorState(this.error);
}
