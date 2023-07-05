import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/admin_models.dart';
import 'package:untitled/models/show_admin_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

part 'show_admin_state.dart';

class ShowAdminCubit extends Cubit<ShowAdminState> {
  ShowAdminCubit() : super(ShowAdminInitial());
  static ShowAdminCubit get(context) => BlocProvider.of(context);
  ShowAdminsModel? adminModel;
  List <dynamic>? admins;
  void getAdmins()
  {
    emit(ShowAdminLoadingState());
    DioHelper.getData(
      url: SHOWADMINS,
      token: token,
    ).then((value) {
      print(value?.data);
      adminModel=ShowAdminsModel.fromJson(value?.data);
      print(adminModel?.status);
      print(adminModel?.message);
     admins=adminModel?.data;
     emit(ShowAdminSuccessState(adminModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShowAdminErrorState(error.toString()));
    });

  }
}
