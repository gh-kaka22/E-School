

import 'package:e_school/layout/parent_home_layout/cubit/parent_layout_states.dart';
import 'package:e_school/modules/home_parent/parent_home_screen.dart';
import 'package:e_school/modules/parent_profile/profile_screen.dart';
import 'package:e_school/modules/posts/posts_screen.dart';
import 'package:e_school/modules/posts_parent/parent_posts_screen.dart';
import 'package:e_school/modules/profile/profile_screen.dart';
import 'package:e_school/modules/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ParentLayoutCubit extends Cubit<ParentLayoutStates>
{
  ParentLayoutCubit() : super(ParentLayoutInitialState());

  static ParentLayoutCubit get(context) => BlocProvider.of(context);

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
    ParentHomeScreen(),
    ParentPostsScreen(),
    ParentProfileStudent(),
    SettingsScreen(),

  ];
  void changeBottomNavBar(int index)
  {
    currentIndex= index;
    emit(ParentLayoutBottomNavState());
  }


  }

