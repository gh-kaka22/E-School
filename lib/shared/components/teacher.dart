import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/teachers/add/cubit/add_teacher_cubit.dart';
import 'package:untitled/modules/teachers/show/cubit/show_teachers_cubit.dart';
import 'package:untitled/modules/teachers/update/update_screen.dart';
import 'package:untitled/shared/components/components.dart';

import '../../styles/colors.dart';

Widget ShowTeachersItem(w, teacher, index, context) => Container(
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
            Expanded(child: Center(child: Text('${teacher.gradeId}'))),
            Expanded(
              child: Center(child: Text('${teacher.roomNumber}')),
            ),
            Expanded(
                child: Center(
              child: Text('${teacher.email}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
            Expanded(
              child: Center(
                child: defaultButton(
                  onPressed: () {
                    navigateTo(context, UpdateTeacher());
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

Widget ShowTeachersBuilder(w, teachers, context, state) => ConditionalBuilder(
      condition: state is! ShowTeachersLoadingState && teachers != null,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) =>
              ShowStudentsItem(w, teachers[index], index, context),
          separatorBuilder: (context, index) {
            return MyDivider();
          },
          itemCount: teachers.length),
      fallback: (context) => Center(child: LinearProgressIndicator()),
    );

Widget ShowClassRoomItem(w, classroom , cubit , controller, context, int index ) => Container(
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
              child: Text('${classroom.classroomId}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
            child: Center(
              child: Text('${classroom.roomnumber}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        // Expanded(
          // child: Center(
          //   child: Checkbox(
          //     checkColor: Colors.white,
          //     activeColor: kDarkBlue2Color,
          //     value: AddTeacherCubit.get(context).classId?.contains(classroom.classroomId),
          //     onChanged: (v) => AddTeacherCubit.get(context).changeCheck(
          //       v!,
          //       classroom.classId,
          //     ),
          //   ),
          // ),

  ]
    ),
  ),
);

Widget ShowClassRoomBuilder(w, classrooms, cubit,controllers ,context, state) =>
    ConditionalBuilder(
      condition: state is! ShowTeachersLoadingState && classrooms != null,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) =>
              ShowClassRoomItem(w, classrooms[index],cubit, controllers, context, index),
          separatorBuilder: (context, index) {
            return MyDivider();
          },
          itemCount: classrooms.length),
      fallback: (context) => Center(child: LinearProgressIndicator()),
    );
