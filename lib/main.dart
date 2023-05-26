import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/login_admin/login_admin_screen.dart';
import 'package:untitled/modules/students/register/register_screen.dart';
import 'package:untitled/shared/bloc_observer.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import 'layout/eschool_cubit/home_cubit.dart';
import 'layout/home_layout_screen.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  Diohelper.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key?key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),

    );
  }
}

