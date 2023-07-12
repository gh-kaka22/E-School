import 'package:e_school/models/home_model.dart';
import 'package:e_school/modules/Timetable/timetable_screen.dart';
import 'package:e_school/modules/attendance/attendance_screen.dart';
import 'package:e_school/modules/exams/exams_screen.dart';
import 'package:e_school/modules/home/cubit/home_states.dart';
import 'package:e_school/shared/components/category_card.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  List<CategoryCard> categories =[
    CategoryCard('Attendance', 'assets/icons/attendance.png', kWhiteColor,AttendanceScreen()),
    CategoryCard('Exams', 'assets/icons/exam.png', kWhiteColor,ExamsScreen()),
    CategoryCard('Schedule', 'assets/icons/schedule.png', kWhiteColor,TimetableScreen()),
    CategoryCard('Library', 'assets/icons/bookshelf.png', kWhiteColor,AttendanceScreen()),
    CategoryCard('Discipline', 'assets/icons/behavior.png', kWhiteColor,AttendanceScreen()),
    CategoryCard('Education', 'assets/icons/homework.png', kWhiteColor,AttendanceScreen()),
  ];
  HomeModel? homeModel ;
  void getHomeData()
  {
    emit(HomeLoadingState());
    print(token);
    DioHelper.getData(
        url: HOME,
      token: token

    ).then((value) {
      print(value?.data);
      homeModel = HomeModel.fromJson(value?.data);
      print(homeModel?.data);
      print(homeModel?.status);
      print(homeModel?.message);
      emit(HomeSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(HomeErrorState(error.toString()));
    });



  }
}