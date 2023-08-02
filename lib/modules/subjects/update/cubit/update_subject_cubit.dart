import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/add_subject_model.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

part 'update_subject_state.dart';

class UpdateSubjectCubit extends Cubit<UpdateSubjectState> {
  UpdateSubjectCubit() : super(UpdateSubjectInitial());
  static UpdateSubjectCubit get(context) => BlocProvider.of(context);

  AddSubjectModel? addSubjectModel;
  void getSubjectData(subject_Id) {
    emit(ShowSubjectLoading());
    DioHelper.getData(
      url: '${SHOWSUBJECT}/${2}',
      token: token,
    ).then((value) {
      addSubjectModel = AddSubjectModel.fromJson(value!.data);
      print(addSubjectModel!.data!.name);
      emit(ShowSubjectSuccess(addSubjectModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShowSubjectError(error.toString()));
    });
  }




  void UpdateSubject(
      {
         String? name,
         String? max_mark,
      }
      )
  {
    emit(
      UpdateSubjectLoading(),
    );
    DioHelper.postData(
      token: token,
      url: '${UPDATESUBJECT}/${addSubjectModel!.data!.subjectId}',
      data: {
        'name': name,
        'max_mark': max_mark,
      },
    ).then((value) {
      print(value?.data);
      addSubjectModel = AddSubjectModel.fromJson(value?.data);
      emit(UpdateSubjectSuccess(addSubjectModel!));
    }).catchError((error) {
      emit(
        UpdateSubjectError(error.toString()),
      );
    });


  }
}
