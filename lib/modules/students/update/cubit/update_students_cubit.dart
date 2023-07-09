import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/student_model.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/network/remote/end_points.dart';

part 'update_students_state.dart';

class UpdateStudentsCubit extends Cubit<UpdateStudentsState> {
  UpdateStudentsCubit() : super(UpdateStudentsInitial());
  static UpdateStudentsCubit get(context) => BlocProvider.of(context);
  StudentModel? studentModel;
  void getStudentData(id) {
    emit(UpdateStudentsLoading());
    DioHelper.getData(
      url: '${GETSTEUDENTBYINDEX}/${id}',
      token: token,
    ).then((value) {
      studentModel = StudentModel.fromJson(value!.data);
      print(studentModel!.data!.firstName);
      emit(UpdateStudentsSuccess(studentModel!));
    }).catchError((error) {
      print(error.toString());
      emit(UpdateStudentsError(error.message));
    });
  }

  void UpdateStudentData({
    id,
    firstname,
    lastname,
    firstFatherName,
    firstMotherName,
    lastMotherName,
    fatherPhoneNumber,
    motherPhoneNumber,
    address,
    details,
    nationalId,
  }) {
    emit(UpdateStudentsLoading());
    DioHelper.postData(
      url: '${UPDATESTUDENT}',
      token: token,
      data: {
        'student_id': id,
        'first_name': firstname,
        'address': address,
        'details': details,
        'father_first_name': firstFatherName,
        'father_phone_number': fatherPhoneNumber,
        'mother_first_name': firstMotherName,
        'mother_last_name': lastMotherName,
        'mother_phone_number': motherPhoneNumber,
        'national_id': nationalId,
      },
    );
  }
}
