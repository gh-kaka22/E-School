part of 'register_admin_cubit.dart';

@immutable
abstract class RegisterAdminState {}

class RegisterAdminInitial extends RegisterAdminState {}
class RegisterAdminLoadingState extends RegisterAdminState{}
class RegisterAdminSuccessgState extends RegisterAdminState{
  final AddAdminModel addAdminModel;
  RegisterAdminSuccessgState(this.addAdminModel);
}
class RegisterAdminErrorState extends RegisterAdminState{
  final String error;
  RegisterAdminErrorState(this.error);

}
class RegisterChangePasswordVisibilityState extends RegisterAdminState{}

