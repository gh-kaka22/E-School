import 'package:e_school/models/show_complaint_model.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'show_complaints_state.dart';

class ShowComplaintsCubit extends Cubit<ShowComplaintsState> {
  ShowComplaintsCubit() : super(ShowComplaintsInitial());
  static ShowComplaintsCubit get(context) => BlocProvider.of(context);
  ShowComplaintsModel? showComplaintsModel;
  List <dynamic>? complaints;
  void getComplaints()
  {
    emit(ShowComplaintsLoadingState());
    DioHelper.getData(
        url: SHOWCOMPLAINT,
        token: token,
    ).then((value) {
      print(value?.data);
      showComplaintsModel=ShowComplaintsModel.fromJson(value?.data);
      print(showComplaintsModel?.status);
      print(showComplaintsModel?.message);
      complaints=showComplaintsModel?.data;
      emit(ShowComplaintsSuccessState(showComplaintsModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowComplaintsErrorState(error.toString()));
    });

  }


}
