import 'package:e_school/models/complaints_model.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'complaints_state.dart';

class ComplaintsCubit extends Cubit<ComplaintsState> {
  ComplaintsCubit() : super(ComplaintsInitial());
  static ComplaintsCubit get(context) => BlocProvider.of(context);
  ComplaintModel? complaintModel;

  void addComplaint(
      {
        required  description,


      })
  {
    emit(ComplaintLoadingState());
    DioHelper.postData(
        url: COMPLAINT,
        token: token,
        data: {
          'description':description,
        }).then((value) {

      print(value?.data);
      complaintModel= ComplaintModel.fromJson(value?.data);

      emit(ComplaintSuccessState(complaintModel!));

    }).catchError((error){
      print('Error ====> ${error}');
      print(error.toString());
      emit(ComplaintErrorState(error.toString()));
    });

  }
}
