part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState{}
class RegisterSuccess extends RegisterState{}
class RegisterError extends RegisterState{
  final String error;
  RegisterError(this.error);
}

class ReligionInitialState extends RegisterState{}

class ReligionDropDownButtonState extends RegisterState{}

class GenderInitialState extends RegisterState{}
class GenderchangeDropDownButton extends RegisterState{}
class GradeInitialState extends RegisterState{}
class GradechangeDropDownButton extends RegisterState{}
class CheckBox extends RegisterState{}
class DateOfBirth extends RegisterState{}
