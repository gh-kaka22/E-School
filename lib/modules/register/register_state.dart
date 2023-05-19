part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState{}
class RegisterSuccess extends RegisterState{}
class ReligionState extends RegisterState{}
class GenderState extends RegisterState{}


class RegisterError extends RegisterState{
  final String error;
  RegisterError(this.error);
}
