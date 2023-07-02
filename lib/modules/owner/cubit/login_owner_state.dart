
import 'package:untitled/models/admin_models.dart';

abstract class OwnerLoginStates {}

class OwnerLoginInitialState extends OwnerLoginStates{}

class OwnerLoginLoadingState extends OwnerLoginStates{

}

class OwnerLoginSuccessState extends OwnerLoginStates{
  final AdminModel owner;

  OwnerLoginSuccessState(this.owner);
}

class OwnerLoginErrorState extends OwnerLoginStates{
  final String error;
  OwnerLoginErrorState(this.error);
}
class OwnerLoginChangePasswordVisibilityState extends OwnerLoginStates{}

