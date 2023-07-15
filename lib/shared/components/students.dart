import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/students/update/update_students_screen.dart';
import 'package:untitled/shared/components/components.dart';

import '../../modules/students/show/cubit/show_students_states.dart';

Widget SearchStudentsItem(w, student, index, context) => Container(
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
                navigateTo(context, UpdateStudent(id:student.studentId,));
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
Widget SearchStudentsBuilder(w, searchs, context, state) => ConditionalBuilder(
  condition: state is! ShowStudentsLoadingState && searchs != null,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          SearchStudentsItem(w, searchs[index], index, context),
      separatorBuilder: (context, index) {
        return MyDivider();
      },
      itemCount: searchs.length),
  fallback: (context) => Center(child: LinearProgressIndicator()),
);
