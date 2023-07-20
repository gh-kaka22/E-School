import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/attendance/show/cubit/show_attendance_cubit.dart';
import 'package:untitled/modules/attendance/show/cubit/show_attendance_state.dart';
import 'package:untitled/styles/colors.dart';
import 'components.dart';


Widget ShowAttendanceItem(w,h,padding,radius, student, index, context,ShowAttendanceCubit cubit,state) => Container(
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
              child: Text('${student.studentId}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
            child: Center(
              child: Text('${student.firstName}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
          child: Center(child: Text('${student.lastName}')),
        ),
        Expanded(child: Center(child: Text('${student.gradeId}'))),
        Expanded(
          child: Center(child: Text('${student.roomNumber}')),
        ),
        Expanded(
            child: Center(
              child: Text('${student.email}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
          child: Center(
            child: defaultButton(
              onPressed: () async {
             await cubit.getAttenadnce(student.studentId);
             showDialog<Future<void>>(
               context: context,
               builder: (BuildContext context) {
                 return AlertDialog(
                   title: Text('${student.firstName + ' ' + student.lastName}',style: TextStyle(
                     color: kDarkBlue2Color,
                     fontSize: 20,

                   ),
                   ),
                   content: Container(
                     width: w/4,

                     child: ConditionalBuilder(
                       condition: cubit.absence != null && state is! ShowAttendanceLoadingState,
                       builder: (context) => ListView.separated(
                         physics: BouncingScrollPhysics(),
                         shrinkWrap: true,
                         itemCount: cubit.absence!.length,
                         separatorBuilder: (BuildContext context, int index) => Center(child: Container(height:1,width: w/5,color: kDarkBlue2Color,)),
                         itemBuilder: (BuildContext context, int index) {
                           return  Padding(
                             padding: EdgeInsets.all(padding),
                             child: Container(
                               width: w/4,
                               height: h / 18,
                               decoration: BoxDecoration(
                                   color: Colors.grey[300],
                                   borderRadius: BorderRadius.all(Radius.circular(radius)),
                                  ),
                               child: Row(
                                 children: [
                                   Container(
                                     width: w / 20,
                                     height: h / 18,
                                     decoration: BoxDecoration(
                                       color: kDarkBlue2Color,
                                       borderRadius: BorderRadius.all(Radius.circular(radius)),

                                     ),
                                     child: Center(child: Text('${cubit.absence?[index].day.substring(0, 3)}',style: TextStyle(
                                       color: kDarkWhiteColor,
                                       fontSize: 20,

                                     ),)),

                                   ),
                                   Expanded(
                                       child: Center(
                                         child: Text('${cubit.absence?[index].date}',
                                             style: TextStyle(overflow: TextOverflow.ellipsis , color: kDarkBlue2Color,fontSize: 20)),
                                       )),

                                 ],
                               ),
                             ),
                           );
                         },
                       ),
                       fallback: (context) => Center(child: Text('<< No Absence >>')),
                     ),
                   ),
                   actions: <Widget>[
                     TextButton(
                       child: Text('OK'),
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
              text: 'Show',
              fontsize: 15,
              buttColor: kGold1Color,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),


      ],
    ),
  ),
);
Widget ShowAttendanceBuilder(w,h,padding,radius, students, context, state,cubit) => ConditionalBuilder(
  condition: state is! ShowAttendanceLoadingState && students != null,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          ShowAttendanceItem(w,h,padding,radius,students[index], index, context,cubit,state),
      separatorBuilder: (context, index) {
        return MyDivider();
      },
      itemCount: students.length),
  fallback: (context) => Center(child: LinearProgressIndicator()),
);

