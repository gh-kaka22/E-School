
import 'package:untitled/models/admin_models.dart';

abstract class AdminLoginStates {}

class AdminLoginInitialState extends AdminLoginStates{}

class AdminLoginLoadingState extends AdminLoginStates{

}

class AdminLoginSuccessState extends AdminLoginStates{
  final AdminModel adminModel;

  AdminLoginSuccessState(this.adminModel);
}

class AdminLoginErrorState extends AdminLoginStates{
  final String error;
  AdminLoginErrorState(this.error);
}
class AdminLoginChangePasswordVisibilityState extends AdminLoginStates{}

