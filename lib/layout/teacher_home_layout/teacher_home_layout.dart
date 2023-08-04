

import 'package:e_school/language/language_constants.dart';
import 'package:e_school/layout/teacher_home_layout/cubit/teacher_layout_cubit.dart';
import 'package:e_school/layout/teacher_home_layout/cubit/teacher_layout_states.dart';
import 'package:e_school/shared/components/drawer.dart';
import 'package:e_school/shared/components/drawer_teacher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class TeacherHomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => TeacherLayoutCubit(),
      child: BlocConsumer<TeacherLayoutCubit,TeacherLayoutStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = TeacherLayoutCubit.get(context);
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index)
                {
                  cubit.changeBottomNavBar(index);
                },
                items: cubit.bottomItems,
              ),
              drawer: TeacherDrawer(translation(context).teacher, translation(context).account, 'assets/icons/teacher.png'),
              body:cubit.screens[cubit.currentIndex],
            );
        },
      ),
    );
  }
}