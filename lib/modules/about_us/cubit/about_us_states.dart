

import 'package:e_school/models/about_us_model.dart';


abstract class AboutUsState {}

class AboutUsInitial extends AboutUsState {}
class AboutUsLoadingState extends AboutUsState {}
class AboutUsSuccessState extends AboutUsState {
  final AboutUsModel aboutUsModel;
  AboutUsSuccessState(this.aboutUsModel);
}
class AboutUsErrorState extends AboutUsState {
  final String error;
  AboutUsErrorState(this.error);
}
