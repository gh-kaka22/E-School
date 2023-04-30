import 'package:bloc/bloc.dart';
import 'package:e_school/shared/cubit/app_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/school_login/shop_login_screen.dart';
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
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');

  runApp( MyApp(
    isDark: false,
    onBoarding: false,
  ));
}

class MyApp extends StatelessWidget {

  final bool? isDark;
  final bool? onBoarding;
  MyApp({this.isDark,this.onBoarding});

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
            home: onBoarding! ? SchoolLoginScreen() :  OnBoardingScreen(),
          );
        },
      ),
    );
  }
}
