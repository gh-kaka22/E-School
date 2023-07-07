
import 'package:untitled/models/add_subject_model.dart';
import 'package:untitled/models/subject_model.dart';
import 'package:untitled/modules/subjects/add/cubit/add_subject_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'package:untitled/shared/network/remote/end_points.dart';

class AddSubjectCubit extends Cubit<AddSubjectStates> {
  AddSubjectCubit() : super(AddSubjectInitialState());
  static AddSubjectCubit get(context) => BlocProvider.of(context);

  AddSubjectModel? addSubjectModel;
  void AddSubject(
      {
        required String name,
        required String max_mark,
        required String token,
      }
      )
  {
    emit(
      AddSubjectLoadingState(),
    );
    DioHelper.postData(
      token: token,
      url: ADDSUBJECT,
      data: {
        'name': name,
        'max_mark': max_mark,
      },
    ).then((value) {
      print(value?.data);
      addSubjectModel = AddSubjectModel.fromJson(value?.data);
      if(value!.data['massege'])
      emit(AddSubjectSuccessState(addSubjectModel!));
    })
        .catchError((error) {
      print("momo ${error.response.data}");
      emit(
        AddSubjectErrorState(error.toString()),
      );
    });


  }
}
