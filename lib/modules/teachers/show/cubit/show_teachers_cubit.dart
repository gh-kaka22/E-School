import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'show_teachers_state.dart';

class ShowTeachersCubit extends Cubit<ShowTeachersState> {
  ShowTeachersCubit() : super(ShowTeachersInitial());
  static ShowTeachersCubit get(context) => BlocProvider.of(context);

}
