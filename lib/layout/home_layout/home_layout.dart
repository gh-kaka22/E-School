
import 'package:e_school/layout/home_layout/cubit/cubit.dart';
import 'package:e_school/layout/home_layout/cubit/states.dart';
import 'package:e_school/shared/components/category_card.dart';
import 'package:e_school/shared/components/drawer.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:material_color_utilities/material_color_utilities.dart';



class HomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SchoolCubit(),
      child: BlocConsumer<SchoolCubit,SchoolStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = SchoolCubit.get(context);
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index)
                {
                  cubit.changeBottomNavBar(index);
                },
                items: cubit.bottomItems,
              ),
              drawer: TheMenu(),
              body: cubit.screens[cubit.currentIndex],
            );
        },
      ),
    );
  }
}