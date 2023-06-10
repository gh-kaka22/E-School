import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'update_students_state.dart';

class UpdateStudentsCubit extends Cubit<UpdateStudentsState> {
  UpdateStudentsCubit() : super(UpdateStudentsInitial());
}
