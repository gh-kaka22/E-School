import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/notice/add/cubit/add_notice_cubit.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';

import '../../styles/colors.dart';

Widget AddNoticeItem(w, student, date, index, context, controller, cubit,type) =>
    Container(
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
                  child: TextFormField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      validator: (value) {},
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                          borderSide: BorderSide(color: kDarkBlue2Color),
                        ),
                      )),
                )),
            Expanded(
              child: Center(
                child: defaultButton(
                  onPressed: () {
                    print(controller.text);
                    print(student.studentId);
                    cubit.AddNotice(
                      studentId: '${student.studentId}',
                      content: controller.text,
                      type:type,
                      date: '2023-06-12',
                      token: token,
                    );
                  },
                  height: 30,
                  text: 'Send',
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



Widget AddNoticeBuilder(w, students, type, date, context, state, controllers, cubit) =>
    ConditionalBuilder(
      condition: state is! AddNoticeLoadingState && students != null,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) {
            controllers.add(TextEditingController());
            return AddNoticeItem(w, students[index], type, date,
                index, context, controllers[index], cubit);
          },
          separatorBuilder: (context, index) {
            return MyDivider();
          },
          itemCount: students.length),
      fallback: (context) => Center(child: LinearProgressIndicator()),
    );