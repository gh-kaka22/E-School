import 'dart:io';

import 'package:cubit_form/cubit_form.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/admin/login/login_screen.dart';
import 'package:untitled/modules/login/login_screen.dart';
import 'package:untitled/modules/statistics/stats_screen.dart';
import 'package:untitled/shared/bloc_observer.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'layout/home_layout_screen.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  if(Platform.isWindows)
    await DesktopWindow.setMinWindowSize(
      Size(1000, 600),
    );

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  //await UrlLauncherPlugin().init();
  Widget widget;
  token = CacheHelper.getData(key: 'token');


    if(token != null)
      {widget= HomeLayout();}
    else {widget=LoginScreen();}


  runApp( MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {

  Widget? startWidget;
  MyApp({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),

    );
  }
}

