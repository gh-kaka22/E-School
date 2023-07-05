import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_school_state.dart';

class ShowSchoolCubit extends Cubit<ShowSchoolState> {
  ShowSchoolCubit() : super(ShowSchoolInitial());
}
