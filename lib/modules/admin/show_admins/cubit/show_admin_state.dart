part of 'show_admin_cubit.dart';

@immutable
abstract class ShowAdminState {}

class ShowAdminInitial extends ShowAdminState {}
class ShowAdminLoadingState extends ShowAdminState {}
class ShowAdminSuccessState extends ShowAdminState {
  final ShowAdminsModel adminModel;
  ShowAdminSuccessState(this.adminModel);
}
class ShowAdminErrorState extends ShowAdminState {
  final String error;
  ShowAdminErrorState(this.error);
}
