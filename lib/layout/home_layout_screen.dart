import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/eschool_cubit/home_cubit.dart';
import 'package:untitled/modules/books/add/add_books.dart';
import 'package:untitled/modules/dashboard/dashboard.dart';
import 'package:untitled/modules/exams/add/exams_add_screen.dart';
import 'package:untitled/modules/exams/show/exams_show_screen.dart';
import 'package:untitled/modules/students/register/register_screen.dart';
import 'package:untitled/modules/students/show/show_students.dart';



class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            body: Row(
              children: [
              Container(
              height: h,
              width: w / 5,
              color: Colors.white24,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset('assets/icons/E-School.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          cubit.SpecialSideBarItem(
                              text: 'Dashboard',
                            screen: MainScreen(),
                          ),
                          cubit.SideBarItem(
                              text: 'Students',
                              showScreen: StudentsShow(),
                              addScreen: StudentRegisterScreen()
                          ),
                          cubit.SideBarItem(
                              text: 'Teachers',
                              showScreen: StudentsShow(),
                              addScreen: StudentRegisterScreen()
                          ),
                          cubit.SideBarItem(
                              text: 'Classes',
                              showScreen: StudentsShow(),
                              addScreen: StudentRegisterScreen()
                          ),
                          cubit.SideBarItem(
                              text: 'Subjects',
                              showScreen: FileUpload(),
                              addScreen: StudentRegisterScreen()
                          ),
                          cubit.SideBarItem(
                              text: 'Timetables',
                              showScreen: StudentsShow(),
                              addScreen: StudentRegisterScreen()
                          ),
                          cubit.SideBarItem(
                              text: 'Exams',
                              showScreen: ExamsShow(),
                              addScreen: ExamsAdd()
                          ),
                          cubit.SideBarItem(
                              text: 'Attendance',
                              showScreen: StudentsShow(),
                              addScreen: StudentRegisterScreen()
                          ),
                          cubit.SideBarItem(
                              text: 'News',
                              showScreen: StudentsShow(),
                              addScreen: StudentRegisterScreen()
                          ),
                          cubit.SpecialSideBarItem(
                            text: 'Settings',
                            screen: StudentsShow(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
                Expanded(child: cubit.currentScreen)
              ]
            ),
          );
        },
      ),
    );
  }
}
