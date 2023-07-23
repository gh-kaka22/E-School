import 'package:bloc/bloc.dart';
import 'package:e_school/layout/home_layout/home_layout.dart';
import 'package:e_school/modules/teacher/teacher_schedule/teacher_schedule_screen.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/cubit/app_cubit.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/school_login/shop_login_screen.dart';
import 'modules/teacher/profie_teacher/profile_teacher_screen.dart';
import 'shared/bloc_observer.dart';

import 'shared/cubit/app_states.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';
import 'shared/styles/themes.dart';
import 'modules/on_boarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  Widget widget;
  //token = CacheHelper.getData(key: 'token');
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');

 if(onBoarding != null)
    {
      if(token != null) widget= HomeLayout();
      else widget=SchoolLoginScreen();
    }else widget=OnBoardingScreen();

  runApp( MyApp(
    isDark: false,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {

   bool? isDark;
   Widget? startWidget;
  MyApp({this.isDark,this.startWidget});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..changeAppMode(
          fromShared: isDark,
        ),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home:TeacherSchedule(),
            //startWidget,
          );
        },
      ),
    );
  }
}
