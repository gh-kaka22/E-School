import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
part 'eschool_state.dart';

class EschoolCubit extends Cubit<EschoolState> {
  EschoolCubit() : super(EschoolInitial());
  static EschoolCubit get(context)=> BlocProvider.of(context);


}
