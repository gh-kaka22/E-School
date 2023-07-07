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
  void getTeacherData(id)
  {
    emit(UpdateStudentsLoading());
    DioHelper.getData(
      url:'${GETSTEUDENTBYINDEX}/${id}',
      token:token ,
    ).
    then((value) {
      studentModel = StudentModel.fromJson(value!.data);
      print(studentModel!.data!.firstName);
      emit(UpdateStudentsSuccess(studentModel!));

    }
    ).catchError((error){
      print(error.toString());
      emit(UpdateStudentsError(error));
    });

  }
  void UpdateTeacherData({
    required id,
    required String firstname,
    required String lastname,
    required String firstFatherName,
    required String firstMotherName,
    required String lastMotherName,
    required String fatherPhoneNumber,
    required String motherPhoneNumber,
    required String address,
    required String details,
    required String nationalId,
  }){
    emit(UpdateStudentsLoading());
    DioHelper.postData(
      url: '${UPDATESTUDENT}',
      token:token ,
      data:
      {
        'student_id':id,
        'first_name':firstname,
        'address':address,
        'details':details,



      },
    );
    // then((value) {
    //   teacherModel = TeacherModel.fromJson(value!.data);
    //   print(teacherModel!.data!.firstName);
    //   emit(UpdateTeacherDataSuccess(teacherModel!));
    //
    // }
    // ).catchError((error){
    //   print(error.toString());
    //   emit(UpdateTeacherDataError());
    // });

  }

}
