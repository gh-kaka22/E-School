import 'package:e_school/layout/home_layout/cubit/states.dart';

import 'package:e_school/modules/home/home_screen.dart';
import 'package:e_school/modules/posts/posts_screen.dart';
import 'package:e_school/modules/profile/profile_screen.dart';
import 'package:e_school/modules/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SchoolCubit extends Cubit<SchoolStates>
{
  SchoolCubit() : super(SchoolInitialState());

  static SchoolCubit get(context) => BlocProvider.of(context);

  int currentIndex= 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label:'Home',
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
    HomeScreen(),
    PostsScreen(),
    ProfileStudent(),
    SettingsScreen(),

  ];
  void changeBottomNavBar(int index)
  {
    currentIndex= index;
    emit(SchoolBottomNavState());
  }


  }

