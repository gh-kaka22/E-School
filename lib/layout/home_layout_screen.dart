import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/eschool_cubit/home_cubit.dart';
import 'package:untitled/modules/about_us/add/add_information.dart';
import 'package:untitled/modules/about_us/update/update_school.dart';
import 'package:untitled/modules/admin/admin_register/register_screen.dart';
import 'package:untitled/modules/admin/show_admins/show_admins.dart';
import 'package:untitled/modules/attendance/add/add.dart';
import 'package:untitled/modules/attendance/show/show_attendance.dart';
import 'package:untitled/modules/books/add/add_files.dart';
import 'package:untitled/modules/books/add/upload.dart';
import 'package:untitled/modules/books/show/show_files.dart';
import 'package:untitled/modules/classrooms/add/add_classroom.dart';
import 'package:untitled/modules/classrooms/show/show_classrooms.dart';
import 'package:untitled/modules/employee/add/add_employee_screen.dart';
import 'package:untitled/modules/employee/show/show_employee.dart';
import 'package:untitled/modules/exams/add/exams_add_screen.dart';
import 'package:untitled/modules/exams/show/exams_show_screen.dart';
import 'package:untitled/modules/login/login_screen.dart';
import 'package:untitled/modules/news/add/create_post.dart';
import 'package:untitled/modules/news/show/get_posts.dart';
import 'package:untitled/modules/notice/add/add_notice.dart';
import 'package:untitled/modules/notice/show/show_note.dart';
import 'package:untitled/modules/notice/show/show_notes.dart';
import 'package:untitled/modules/owner/owner_login_screen.dart';
import 'package:untitled/modules/results/results_screen.dart';
import 'package:untitled/modules/schoolYears/add/add_school_year.dart';
import 'package:untitled/modules/schoolYears/show/show_school_year.dart';
import 'package:untitled/modules/statistics/stats_screen.dart';
import 'package:untitled/modules/students/register/register_screen.dart';
import 'package:untitled/modules/students/show/search_students.dart';
import 'package:untitled/modules/students/show/show_students.dart';
import 'package:untitled/modules/subjects/add/add_subject.dart';
import 'package:untitled/modules/subjects/show/show_subjects.dart';
import 'package:untitled/modules/teachers/add/add_teacher.dart';
import 'package:untitled/modules/teachers/show/search_teacher.dart';
import 'package:untitled/modules/teachers/show/show_teachers.dart';
import 'package:untitled/modules/timetable/add/add_timetable.dart';
import 'package:untitled/modules/teachers/update/update_screen.dart';
import 'package:untitled/modules/timetable/show/show_timetable.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/search_bar.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';

import '../modules/about_us/show/show_school.dart';
import '../modules/admin/login/login_screen.dart';

import '../modules/students/update/update_students_screen.dart';
import '../shared/components/notice.dart';
import '../test.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: (){
              CacheHelper.removeData(key: 'token').then((value) {
                if(value!){
                  navigateAndFinish(context, LoginScreen());
                }
              });
            }),
            body: Row(children: [
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
                            screen: StatsScreen(),
                          ),
                            cubit.SideBarItem(
                                text: 'Admins',
                                showScreen: ShowAdmins(),
                                addScreen: RegisterAdmin()
                            ),
                            cubit.SideBarItem(
                                text: 'Employee',
                                showScreen: ShowEmployee(),
                                addScreen: AddEmployee()
                            ),
                          cubit.SideBarItem(
                              text: 'Students',
                              showScreen: StudentsShow(),
                              addScreen: StudentRegisterScreen()
                          ),
                          cubit.SideBarItem(
                              text: 'Teachers',
                              showScreen: ShowTeachers(),
                              addScreen: AddTeacher(),
                          ),
                          cubit.SideBarItem(
                              text: 'Classrooms',
                              showScreen: ClassroomsShow(),
                              addScreen: AddClassroom()
                          ),
                          cubit.SideBarItem(
                              text: 'Subjects',
                              showScreen: SubjectsShow(),
                              addScreen: AddSubject(),
                          ),
                          cubit.SideBarItem(
                              text: 'Timetables',
                              showScreen: TimetableShow(),
                              addScreen: TimetableAdd()
                          ),
                          cubit.SideBarItem(
                              text: 'Exams',
                              showScreen: ExamsShow(),
                              addScreen: ExamsAdd()
                          ),
                          cubit.SideBarItem(
                              text: 'Books',
                              showScreen: FilesShow(),
                              addScreen: AddFile()
                          ),
                          cubit.SideBarItem(
                              text: 'Attendance',
                              showScreen: ShowAttendance(),
                              addScreen: AddAttendance()
                          ),
                            cubit.SideBarItem(
                                text: 'School Year',
                                showScreen: SchoolYearShow(),
                                addScreen: AddSchoolYear()
                            ),
                          cubit.SideBarItem(
                              text: 'Posts',
                              showScreen: GetPosts(),
                              addScreen: CreatePost()
                          ),
                            cubit.SideBarItem(
                                text: 'Notice',
                                showScreen: ShowNotes(),
                                addScreen: AddNotice(),
                            ),
                            cubit.SideBarItem(
                              text: 'About Us',
                              showScreen: ShowSchool(),
                              addScreen: AddSchool(),
                            ),
                            cubit.SpecialSideBarItem(
                              text: 'Results',
                              screen: ResultsScreen(),
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
