
import 'package:untitled/models/admin_models.dart';

abstract class OwnerLoginStates {}

class OwnerLoginInitialState extends OwnerLoginStates{}

class OwnerLoginLoadingState extends OwnerLoginStates{

}

class OwnerLoginSuccessState extends OwnerLoginStates{
  final AdminModel adminModel;

  OwnerLoginSuccessState(this.adminModel);
}

class OwnerLoginErrorState extends OwnerLoginStates{
  final String error;
  OwnerLoginErrorState(this.error);
}
class OwnerLoginChangePasswordVisibilityState extends OwnerLoginStates{}

