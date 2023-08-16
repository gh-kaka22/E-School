

import 'package:e_school/language/language_constants.dart';
import 'package:e_school/layout/parent_home_layout/cubit/parent_layout_cubit.dart';
import 'package:e_school/layout/parent_home_layout/cubit/parent_layout_states.dart';
import 'package:e_school/shared/components/drawer.dart';
import 'package:e_school/shared/components/drawer_parent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ParentHomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ParentLayoutCubit(),
      child: BlocConsumer<ParentLayoutCubit,ParentLayoutStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = ParentLayoutCubit.get(context);
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index)
                {
                  cubit.changeBottomNavBar(index);
                },
                items: cubit.bottomItems,
              ),
              drawer: ParentDrawer(translation(context).parents, translation(context).account, 'assets/icons/parents (1).png'),
              body:cubit.screens[cubit.currentIndex],
            );
        },
      ),
    );
  }
}