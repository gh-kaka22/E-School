
import 'package:e_school/layout/teacher_home_layout/cubit/teacher_layout_states.dart';
import 'package:e_school/modules/home_teacher/teacher_home_screen.dart';
import 'package:e_school/modules/posts/posts_screen.dart';
import 'package:e_school/modules/posts_teacher/teacher_posts_screen.dart';
import 'package:e_school/modules/profile/profile_screen.dart';
import 'package:e_school/modules/settings/settings_screen.dart';
import 'package:e_school/modules/teacher/profie_teacher/profile_teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TeacherLayoutCubit extends Cubit<TeacherLayoutStates>
{
  TeacherLayoutCubit() : super(TeacherLayoutInitialState());

  static TeacherLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex= 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label:  'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.newspaper),
      label:'Posts',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label:'Profile',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label:'Settings',
    ),
  ];

  List<Widget> screens = [
    TeacherHomeScreen(),
    TeacherPostsScreen(),
    ProfileTeacher(),
    SettingsScreen(),

  ];
  void changeBottomNavBar(int index)
  {
    currentIndex= index;
    emit(TeacherLayoutBottomNavState());
  }


  }

