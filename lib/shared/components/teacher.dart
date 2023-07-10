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
              child: Text('${teacher.userId}',
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
              child: Center(child: Text('${teacher.email}')),
            ),
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

