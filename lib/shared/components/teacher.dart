import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/teachers/add/cubit/add_teacher_cubit.dart';
import 'package:untitled/modules/teachers/show/cubit/show_teachers_cubit.dart';
import 'package:untitled/modules/teachers/update/update_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/text_components.dart';

import '../../styles/colors.dart';

Widget ShowTeachersItem(w,h, teacher, index, context, cubit) => Container(
      width: 4 / 5 * w,
      height: 50,
      decoration: BoxDecoration(
          color: index % 2 == 0 ? Colors.white : Colors.grey[200]!,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.2),
                blurRadius: 20) //blur radius of shadow
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
                child: Center(
              child: Text('${teacher.teacherId}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
            Expanded(
                child: Center(
              child: Text('${teacher.firstName}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
            Expanded(
              child: Center(child: Text('${teacher.lastName}')),
            ),
            Expanded(
              child: Center(child: Text('${teacher.subjectName}')),
            ),
            Expanded(child: Center(child: Text('${teacher.address}'))),
            Expanded(
              child: Center(child: Text('${teacher.details}')),
            ),
            Expanded(
              child: Center(
                child: defaultButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Choose Day',
                            style: TextStyle(
                              color: kDarkBlue2Color,
                              fontSize: 25,
                            ),
                          ),
                          content: Container(
                            width: w / 4,
                            height: h/2.3,
                            child: Expanded(
                              child: Column(
                                children: [

                                  TextButton(
                                      onPressed: () async {
                                        await cubit.getSchedule(
                                            teacher.teacherId, 1);
                                        Future.delayed(Duration(seconds: 1));
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Center(
                                                  child: Text( '${teacher.firstName}'+ ' ' + '${teacher.lastName}',style: TextStyle(
                                                    color: kDarkBlue2Color,
                                                    fontSize: 20,
                                                  ),),
                                                ),

                                                content: Scheduale(w,h,context,cubit),

                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text('OK',style: TextStyle(color: kDarkBlue2Color),),


                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },


                                                  ),
                                                ],
                                              );
                                            });
                                      },

                                     child: Text('Sunday',style: TextStyle(color: SundayColor,fontSize: Dayfontsize),),

                                  ),
                                  SizedBox(height: h/25,),
                                  TextButton(
                                      onPressed: () async {
                                        await cubit.getSchedule(
                                            teacher.teacherId, 2);
                                        Future.delayed(Duration(seconds: 1));
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text( '${teacher.firstName}'+ ' ' + '${teacher.lastName}',style: TextStyle(
                                                  color: kDarkBlue2Color,
                                                  fontSize: 20,
                                                ),),
                                                content: Scheduale(w,h,context,cubit),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text('OK'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child: Text('Monday',style: TextStyle(color: MonColor,fontSize: Dayfontsize),),

                                  ),
                                  SizedBox(height: h/25,),
                                  TextButton(
                                      onPressed: () async {
                                        await cubit.getSchedule(
                                            teacher.teacherId, 3);
                                        Future.delayed(Duration(seconds: 1));
                                        showDialog(

                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text( '${teacher.firstName}'+ ' ' + '${teacher.lastName}',style: TextStyle(
                                                  color: kDarkBlue2Color,
                                                  fontSize: 20,
                                                ),),
                                                content: Scheduale(w,h,context,cubit),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text('OK'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child:Text ('Tuesday',style: TextStyle(color: TueColor,fontSize: Dayfontsize),),
                                  ),
                                  SizedBox(height: h/25,),
                                  TextButton(
                                      onPressed: () async {
                                        await cubit.getSchedule(
                                            teacher.teacherId, 4);
                                        Future.delayed(Duration(seconds: 1));
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text( '${teacher.firstName}'+ ' ' + '${teacher.lastName}',style: TextStyle(
                                                  color: kDarkBlue2Color,
                                                  fontSize: 20,
                                                ),),
                                                content: Scheduale(w,h,context,cubit),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text('OK'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child:Text( 'Wednesday',style: TextStyle(color: WedColor,fontSize: Dayfontsize),),
                                  ),
                                  SizedBox(height: h/25,),
                                  TextButton(
                                      onPressed: () async {
                                        await cubit.getSchedule(
                                            teacher.teacherId, 5);
                                        Future.delayed(Duration(seconds: 1));
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text( '${teacher.firstName}'+ ' ' + '${teacher.lastName}',style: TextStyle(
                                                  color: kDarkBlue2Color,
                                                  fontSize: 20,
                                                ),),
                                                content: Center(child: THUScheduale(w,h,context,cubit)),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text('OK'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child: Text('Thursday',style: TextStyle(color: thuColor,fontSize: Dayfontsize),),

                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK',style: TextStyle(color: kDarkBlue2Color),),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                    ;
                  },
                  height: 30,
                  text: 'Show ',
                  fontsize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: defaultButton(
                  onPressed: () {
                    navigateTo(
                        context,
                        UpdateTeacher(
                          id: teacher.teacherId,
                        ));
                  },
                  height: 30,
                  text: 'Edit',
                  fontsize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
Widget ShowTeachersBuilder(w,h, teachers, context, state, cubit) =>
    ConditionalBuilder(
      condition: state is! ShowTeachersLoadingState && teachers != null,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) =>
              ShowTeachersItem(w,h, teachers[index], index, context, cubit),
          separatorBuilder: (context, index) {
            return MyDivider();
          },
          itemCount: teachers.length),
      fallback: (context) => Center(child: LinearProgressIndicator()),
    );

/////////////////////////////////////////////////////////////////////////////////////////////
Widget SearchTeachersItem(w, teacher, index, context) => Container(
      width: 4 / 5 * w,
      height: 50,
      decoration: BoxDecoration(
          color: index % 2 == 0 ? Colors.white : Colors.grey[200]!,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.2),
                blurRadius: 20) //blur radius of shadow
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
                child: Center(
              child: Text('${teacher.teacherId}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
            Expanded(
                child: Center(
              child: Text('${teacher.firstName}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
            Expanded(
              child: Center(child: Text('${teacher.lastName}')),
            ),

            Expanded(child: Center(child: Text('${teacher.address}'))),
            Expanded(
              child: Center(child: Text('${teacher.details}')),
            ),
            Expanded(
              child: Center(
                child: defaultButton(
                  onPressed: () {
                    navigateTo(
                        context,
                        UpdateTeacher(
                          id: teacher.teacherId,
                        ));
                  },
                  height: 30,
                  text: 'Edit',
                  fontsize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),

          ],
        ),
      ),
    );
Widget SearchTeachersBuilder(w, searchs, context, state) => ConditionalBuilder(
      condition: state is! ShowTeachersLoadingState && searchs != null,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) => SearchTeachersItem(
                w,
                searchs[index],
                index,
                context,
              ),
          separatorBuilder: (context, index) {
            return MyDivider();
          },
          itemCount: searchs.length),
      fallback: (context) => Center(child: LinearProgressIndicator()),
    );

//////////////////////////////////////////////////////////////////////////////
Widget Scheduale(w, h, context, cubit) => Container(
  width: w/4,
  height: (h/1.3),


  child: Column(
    children: [
SizedBox(height: h/14,),
      Container(
        height: 50.0,
        color: kDarkBlue2Color,
        child: Row(
          children: [
            Expanded(
                child: Center(
                  child: Text('Period:',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,color: kDarkWhiteColor)),
                )),
            Expanded(

                child: Center(
                  child: Text(
                      'Section', style: TextStyle(
                      overflow: TextOverflow.ellipsis,color: kDarkWhiteColor)),
                ),
              ),

          ],
        ),
      ),
      MyDivider(),
      SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Expanded(
                child: Center(
                  child: Text('First Period:',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis)),
                )),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Center(
                  child: Text(
                      '${cubit.teachercShedule?.data?.firstPeriod}'),
                ),
              ),
            ),
          ],
        ),
      ),
      MyDivider(),
      SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Expanded(
                child: Center(
                  child: Text('Second Period:',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis)),
                )),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Center(
                  child: Text(
                      '${cubit.teachercShedule?.data?.secondPeriod}'),
                ),
              ),
            ),
          ],
        ),
      ),
      MyDivider(),
      SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Expanded(
                child: Center(
                  child: Text('Third Period:',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis)),
                )),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Center(
                  child: Text(
                      '${cubit.teachercShedule?.data?.thirdPeriod}'),
                ),
              ),
            ),
          ],
        ),
      ),
      MyDivider(),
      SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Expanded(
                child: Center(
                  child: Text('Fourth Period:',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis)),
                )),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Center(
                  child: Text(
                      '${cubit.teachercShedule?.data?.forthPeriod}'),
                ),
              ),
            ),
          ],
        ),
      ),
      MyDivider(),
      SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Expanded(
                child: Center(
                  child: Text('Fifth Period:',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis)),
                )),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Center(
                  child: Text(
                      '${cubit.teachercShedule?.data?.fifthPeriod}'),
                ),
              ),
            ),
          ],
        ),
      ),
      MyDivider(),
      SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Expanded(
                child: Center(
                  child: Text('Sixth Period:',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis)),
                )),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Center(
                  child: Text(
                      '${cubit.teachercShedule?.data?.sixthPeriod}'),
                ),
              ),
            ),
          ],
        ),
      ),

    ],
  ),
);


/////////////////////////////////////////////////////////////////////////////
Widget THUScheduale(w, h, context, cubit) => Container(
  width: w/4,
  height: (h/1.3),


  child: Column(
    children: [
      SizedBox(height: h/14,),
      Container(
        height: 50.0,
        color: kDarkBlue2Color,
        child: Row(
          children: [
            Expanded(
                child: Center(
                  child: Text('Period:',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,color: kDarkWhiteColor)),
                )),
            Expanded(

              child: Center(
                child: Text(
                    'Section', style: TextStyle(
                    overflow: TextOverflow.ellipsis,color: kDarkWhiteColor)),
              ),
            ),

          ],
        ),
      ),
      MyDivider(),
      SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Expanded(
                child: Center(
                  child: Text('First Period:',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis)),
                )),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Center(
                  child: Text(
                      '${cubit.teachercShedule?.data?.firstPeriod}'),
                ),
              ),
            ),
          ],
        ),
      ),
      MyDivider(),
      SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Expanded(
                child: Center(
                  child: Text('Second Period:',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis)),
                )),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Center(
                  child: Text(
                      '${cubit.teachercShedule?.data?.secondPeriod}'),
                ),
              ),
            ),
          ],
        ),
      ),
      MyDivider(),
      SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Expanded(
                child: Center(
                  child: Text('Third Period:',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis)),
                )),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Center(
                  child: Text(
                      '${cubit.teachercShedule?.data?.thirdPeriod}'),
                ),
              ),
            ),
          ],
        ),
      ),
      MyDivider(),
      SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Expanded(
                child: Center(
                  child: Text('Fourth Period:',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis)),
                )),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Center(
                  child: Text(
                      '${cubit.teachercShedule?.data?.forthPeriod}'),
                ),
              ),
            ),
          ],
        ),
      ),
      MyDivider(),
      SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Expanded(
                child: Center(
                  child: Text('Fifth Period:',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis)),
                )),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Center(
                  child: Text(
                      '${cubit.teachercShedule?.data?.fifthPeriod}'),
                ),
              ),
            ),
          ],
        ),
      ),
      MyDivider(),
      SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Expanded(
                child: Center(
                  child: Text('Sixth Period:',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis)),
                )),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Center(
                  child: Text(
                      '${cubit.teachercShedule?.data?.sixthPeriod}'),
                ),
              ),
            ),
          ],
        ),
      ),
      MyDivider(),
      SizedBox(
        height: 40.0,
        child: Row(
          children: [
            Expanded(
                child: Center(
                  child: Text('Seventh Period:',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis)),
                )),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                ),
                child: Center(
                  child: Text(
                      '${cubit.teachercShedule?.data?.seventhPeriod}'),
                ),
              ),
            ),
          ],
        ),
      ),

    ],
  ),
);

