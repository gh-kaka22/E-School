import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_school/chatgpt/chat.dart';
import 'package:e_school/modules/Timetable/timetable_screen.dart';
import 'package:e_school/modules/attendance/attendance_screen.dart';
import 'package:e_school/modules/exams/exams_screen.dart';
import 'package:e_school/modules/home/cubit/home_cubit.dart';
import 'package:e_school/modules/home/cubit/home_states.dart';
import 'package:e_school/shared/components/category_card.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=> HomeCubit()..getHomeData()..getPosts(),
            child: BlocConsumer<HomeCubit,HomeStates>(
              listener: (context,state){},
              builder: (context,state){
                var cubit = HomeCubit.get(context);
                return Scaffold(
                  backgroundColor: kDarkWhiteColor,
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                            children:[
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
                                    color: kDarkBlue3Color.withOpacity(0.6),
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
                                              backgroundColor: Colors.cyan,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 3, left: 3),
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
                                                backgroundColor: kWhiteColor,
                                                child: ClipOval(
                                                  child: Image.asset(
                                                    cubit.homeModel?.data.genderId == 0 ?
                                                    'assets/icons/graduating-student-g.png':
                                                    'assets/icons/graduating-student-b.png',
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
                                              '${cubit.homeModel?.data.firstName}'+' '+'${cubit.homeModel?.data.lastName}' ?? '',
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
                                              'Grade : ${cubit.homeModel?.data.gradeId ?? ''} ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              'Section : ${cubit.homeModel?.data.classroom ?? ''} ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                              Positioned(
                                  top: 40,
                                  right: 20,
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          navigateTo(context, ChatPage());
                                        },
                                        child: Container(
                                          width: 45,
                                          height: 45,
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundColor: kWhiteColor,
                                            child: ClipOval(
                                              child: Image.asset(
                                                'assets/images/robot.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text('Assistant',style: TextStyle(color: kWhiteColor),),
                                    ],
                                  )
                              ),

                            ]),
                        SizedBox(
                          height: 20,
                        ),
                        CarouselSlider(
                          items: [
                            ConditionalBuilder(
                              condition: cubit.posts != null ,
                              builder:(context) => buildHomePostItem(cubit.posts?[0], context, cubit,state),
                              fallback:(context) => Center(child: CircularProgressIndicator()),
                            ),
                            ConditionalBuilder(
                              condition: cubit.posts != null ,
                              builder:(context) => buildHomePostItem(cubit.posts?[1], context, cubit,state),
                              fallback:(context) => Center(child: CircularProgressIndicator()),
                            ),
                            ConditionalBuilder(
                              condition: cubit.posts != null ,
                              builder:(context) =>buildHomePostItem(cubit.posts?[2], context, cubit,state),
                              fallback:(context) => Center(child: CircularProgressIndicator()),
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
                          padding: const EdgeInsets.only(left: 20, right: 20,),
                          child: GridView.count(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            mainAxisSpacing: 20.0,
                            crossAxisSpacing: 20.0,
                            children: List.generate(
                              6,
                                  (index) => cubit.categories[index],
                            ),
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
