import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_school/language/language_constants.dart';
import 'package:e_school/modules/Timetable/timetable_screen.dart';
import 'package:e_school/modules/attendance/attendance_screen.dart';
import 'package:e_school/modules/exams/exams_screen.dart';
import 'package:e_school/modules/home_teacher/cubit/teacher_home_cubit.dart';
import 'package:e_school/modules/home_teacher/cubit/teacher_home_states.dart';
import 'package:e_school/modules/teacher/files/add/add_files.dart';
import 'package:e_school/modules/teacher/posts_teacher/add/create_post.dart';
import 'package:e_school/modules/teacher/teacher_schedule/teacher_schedule_screen.dart';

import 'package:e_school/shared/components/category_card.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/components/option_card.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TeacherHomeCubit()
        ..getTeacherHomeData()
        ..getPostsTeacher(),
      child: BlocConsumer<TeacherHomeCubit, TeacherHomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TeacherHomeCubit.get(context);
          return Scaffold(
            backgroundColor: kDarkWhiteColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Background.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3.5,
                        decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(0.6),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25, left: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 3, left: 3),
                                    child: CircleAvatar(
                                      radius: 47,
                                      backgroundColor: kYellowColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5,
                                      left: 5,
                                    ),
                                    child: CircleAvatar(
                                      radius: 45,
                                      backgroundColor: kTeal,
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/icons/teacher.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${cubit.teacherHomeModel?.data.firstName}' +
                                            ' ' +
                                            '${cubit.teacherHomeModel?.data.lastName}' ??
                                        '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    '${translation(context).subject} : ${cubit.teacherHomeModel?.data.subjectName} ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    '${translation(context).section} : ${cubit.teacherHomeModel?.data.classes[0].roomNumber ?? ''} ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  CarouselSlider(
                    items: [
                      ConditionalBuilder(
                        condition: cubit.posts != null,
                        builder: (context) => buildHomePostItem(
                            cubit.posts?[0], context, cubit, state),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      ConditionalBuilder(
                        condition: cubit.posts != null,
                        builder: (context) => buildHomePostItem(
                            cubit.posts?[1], context, cubit, state),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      ConditionalBuilder(
                        condition: cubit.posts?.length != null,
                        builder: (context) => buildHomePostItem(
                            cubit.posts?[2], context, cubit, state),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ],
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      viewportFraction: 1,
                      autoPlayAnimationDuration: Duration(
                        seconds: 1,
                      ),
                      autoPlayCurve: Curves.decelerate,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        OptionCard(translation(context).schedule, translation(context).t1, 'assets/icons/schedule.png', kTeal,TeacherSchedule()),
                        SizedBox(
                          height: 30,
                        ),
                        OptionCard(translation(context).files, translation(context).t2, 'assets/icons/folders.png', kTeal,AddFile()),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
