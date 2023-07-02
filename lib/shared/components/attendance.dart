import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/attendance/show/cubit/show_attendance_cubit.dart';
import 'package:untitled/modules/attendance/show/cubit/show_attendance_state.dart';
import 'package:untitled/styles/colors.dart';

import 'components.dart';


Widget ShowAttendanceItem(w, student, index, context,ShowAttendanceCubit cubit,state) => Container(
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
              onPressed: () {
               cubit.showAttendanceDialog;

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


Widget ShowAttendanceBuilder(w, students, context, state,cubit) => ConditionalBuilder(
  condition: state is! ShowAttendanceLoadingState && students != null,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          ShowAttendanceItem(w, students[index], index, context,cubit,state),
      separatorBuilder: (context, index) {
        return MyDivider();
      },
      itemCount: students.length),
  fallback: (context) => Center(child: LinearProgressIndicator()),
);


Widget ShowAbsentItem(w, absent, index, context) => Container(
  width: w/5,
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
              child: Text('${absent.id}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
            child: Center(
              child: Text('${absent.date}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),



      ],
    ),
  ),
);
Widget ShowAbsentBuilder(w, absence, context, state) => ConditionalBuilder(
  condition: state is! ShowAttendanceLoadingState && absence != null,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          ShowAbsentItem(w, absence[index], index, context),
      separatorBuilder: (context, index) {
        return MyDivider();
      },
      itemCount: absence.length),
  fallback: (context) => Center(child: LinearProgressIndicator()),
);