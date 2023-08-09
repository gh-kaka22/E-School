import 'package:e_school/models/home_model.dart';
import 'package:e_school/models/timetable_model.dart';
import 'package:e_school/modules/Timetable/cubit/timetable_states.dart';
import 'package:e_school/modules/home/cubit/home_states.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/components/timetable_card.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class TimetableCubit extends Cubit<TimetableStates> {
  TimetableCubit() : super(TimetableInitialState());

  static TimetableCubit get(context) => BlocProvider.of(context);


  HomeModel? homeModel ;
  void getHomeData()
  {
    emit(HomedataLoadingState());
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
      print(homeModel?.data!.classroom);
      emit(HomedataSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(HomedataErrorState(error.toString()));
    });



  }




  List<TimetableCard> periodsList =[];
  List<String> days = [
    "SUN",
    "MON",
    "TUE",
    "WED",
    "THU",
  ];

  int currentIndex=0;
  void changeTimeTableTabBar(int index)
  {
    currentIndex= index;
    emit(TimeTableChangeTabBarState());
  }



  TimetableModel? timetableModel;
  void getTimetable ({
    required int day_number,
  })
  {
    emit(TimeTableLoadingState());
    DioHelper.postData(
        url: GETTIMETABLE,
        token: token,
        data:
        {
          'day_number':day_number,
        }
    ).then((value) {
      print(value?.data);
      timetableModel = TimetableModel.fromJson(value?.data);
      print(timetableModel?.status);
      print(timetableModel?.message);
      print(timetableModel?.data?.firstSubject);
      periodsList = [
        TimetableCard(
          subject: '${timetableModel?.data?.firstSubject}',
          from: '8:00 AM',
          to: '9:00 AM',
          imageUrl: '',
        ),
        TimetableCard(
          subject: timetableModel?.data?.secondSubject,
          from: '9:00 AM',
          to: '10:00 AM',
          imageUrl: '',
        ),
        TimetableCard(
          subject: timetableModel?.data?.thirdSubject,
          from: '10:00 AM',
          to: '11:00 AM',
          imageUrl: '',
        ),
        TimetableCard(
          subject: timetableModel?.data?.fourthSubject,
          from: '11:00 AM',
          to: '12:00 PM',
          imageUrl: '',
        ),
        TimetableCard(
          subject: timetableModel?.data?.fifthSubject,
          from: '12:00 PM',
          to: '1:00 PM',
          imageUrl: '',
        ),
        TimetableCard(
          subject: timetableModel?.data?.sixthSubject,
          from: '1:00 PM',
          to: '2:00 PM',
          imageUrl: '',
        ),
        TimetableCard(
          subject: timetableModel?.data?.seventhSubject,
          from: '2:00 PM',
          to: '3:00 PM',
          imageUrl: '',
        ),
      ];
      emit(TimeTableSuccessState(timetableModel!));
    }).catchError((error){
      print(error.toString());
      emit(TimeTableErrorState(error.toString()));
    });
  }






}