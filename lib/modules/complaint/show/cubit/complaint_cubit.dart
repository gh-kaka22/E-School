import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/complaint_model.dart';
import 'package:untitled/models/status_complaint_modal.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';
part 'complaint_state.dart';

class ComplaintCubit extends Cubit<ComplaintState> {
  ComplaintCubit() : super(ComplaintInitial());
  static ComplaintCubit get(context) => BlocProvider.of(context);
  ComplaintModel? complaintModel;
  List<dynamic>? complaints;
  bool? click = false;
  int? change;
  void clicked (){
    click = !click!;
    emit(PressedState());
  }

  void getComplaints()
  {
    emit(ComplaintLoadingState());
    DioHelper.getData(
      url: SHOWCOMPLAINTS,
      token: token,
    ).then((value) {
      print(value?.data);
      complaintModel = ComplaintModel.fromJson(value?.data);
      print(complaintModel?.status);
      print(complaintModel!.data![0].date);
      complaints = complaintModel?.data;
      emit(ComplaintSuccessState(complaintModel!));
    }).catchError((error){
      print(error.toString());
      emit(ComplaintErrorState(error.toString()));
    });
  }

  StatusComplaintModel? statusComplaintModel;

  void solveComplaints(
      {

        required ID,
        required  status,

      })
  {
    emit(StatusComplaintLoadingState());
    DioHelper.postData(
        url: '${SOLVECOMPLAINTS}/${ID}',
        token: token,
        data: {
          'status':status,
        }).then((value) {
      print(value?.data);
      statusComplaintModel= StatusComplaintModel.fromJson(value?.data);
      print(statusComplaintModel!.data!.date);
      print(statusComplaintModel!.data!.status);

      emit(StatusComplaintSuccessState(statusComplaintModel!));

    }).catchError((error){
      print('Error ===> ${error}');
      print(error.toString());
      emit(StatusComplaintErrorState(error.toString()));
    });

  }

}
