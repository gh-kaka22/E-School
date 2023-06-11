import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/attendance/add/cubit/attendance_cubit.dart';
import 'package:untitled/modules/classrooms/show/cubit/show_classrooms_states.dart';
import 'package:untitled/modules/exams/add/cubit/exams_add_states.dart';
import 'package:untitled/modules/exams/show/cubit/exams_show_states.dart';
import 'package:untitled/modules/students/show/cubit/show_students_states.dart';
import 'package:untitled/modules/students/update/update_students_screen.dart';
import 'package:untitled/modules/subjects/show/cubit/show_subjects_states.dart';

import '../../styles/colors.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  ValueChanged? onChange,
  VoidCallback? suffixPressed,
  required FormFieldValidator validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
}) =>
    TextFormField(
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        validator: validate,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: kDarkBlue2Color),
          prefixIcon: Icon(
            prefix,
            color: kDarkBlue2Color,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffix,
                    color: kDarkBlue2Color,
                  ))
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: kDarkBlue2Color),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: kGold1Color),
          ),
        ));

Widget defaultButton({
  double width = 100,
  required void Function() onPressed,
  double height = 20,
  Color buttColor = kDarkBlue2Color,
  Color colortext = Colors.white,
  double fontsize = 23,
  FontWeight fontWeight = FontWeight.w400,
  required String text,
}) =>
    Center(
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: buttColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: MaterialButton(
            onPressed: onPressed,
            child: Text(
              text.toUpperCase(),
              style: TextStyle(
                fontWeight: fontWeight,
                color: colortext,
                fontSize: fontsize,
              ),
            ),
          )),
    );

TextFormField buildSForm({
  Color bordercolor = kDarkBlue2Color,
  Color font = kGold1Color,
  required String labeltext,
  required TextEditingController controller,
  double borderwidth = 1,
}) {
  return TextFormField(
    decoration: InputDecoration(
      enabled: true,
      filled: true,
      fillColor: Colors.white30,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: borderwidth,
          color: bordercolor,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: borderwidth,
          color: bordercolor,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: borderwidth,
          color: bordercolor,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      label: AutoSizeText(
        labeltext,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: font,
        ),
      ),
    ),
    controller: controller,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (String? text) {
      if (text == null || text == " " || text.isEmpty) {
        return 'Can\'t be empty';
      }

      if (text.length > 40) {
        return 'It is too long';
      }
      if (text.length < 2) {
        return 'It is too short';
      }
      return null;
    },
  );
}

Widget MyDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 2.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey,
      ),
    );

Widget ShowStudentsItem(w, student, index, context) => Container(
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
              child: Center(child: Text('${student.gradeId}')),
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
                    navigateTo(context, StudentUpdateScreen());
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

Widget ShowSubjectsItem(w, subject, index, context) => Container(
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
              child: Text('${subject.subjectId}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
            child: Center(
              child: Text('${subject.name}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
          child: Center(child: Text('${subject.max_mark}')),
        ),
        Expanded(
          child: Center(
            child: defaultButton(
              onPressed: () {

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

Widget ShowExamsItem(w, student, index, context) => Container(
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
              child: Center(child: Text('${student.gradeId}')),
            ),
            Expanded(
                child: Center(
              child: Text('Math',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
            Expanded(
                child: Center(
              child: Text('${35}',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.green,
                  )),
            )),
            Expanded(
              child: Center(
                child: defaultButton(
                  onPressed: () {
                    navigateTo(context, StudentUpdateScreen());
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

Widget AddExamsItem(w, student, index, context, controller) => Container(
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
              child: Center(child: Text('${student.gradeId}')),
            ),
            Expanded(
                child: Center(
              child: Text('Math',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
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
                    navigateTo(context, StudentUpdateScreen());
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

Widget ShowStudentsBuilder(w, students, context, state) => ConditionalBuilder(
      condition: state is! ShowStudentsLoadingState && students != null,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) =>
              ShowStudentsItem(w, students[index], index, context),
          separatorBuilder: (context, index) {
            return MyDivider();
          },
          itemCount: students.length),
      fallback: (context) => Center(child: LinearProgressIndicator()),
    );

Widget ShowStudentsAttendanceItem(w, student, index, context) => Container(
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
          child: Center(child: Text('${student.gradeId}')),
        ),
        Expanded(
            child: Center(
              child: Text('${student.email}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
          child: Center(
            child: CheckboxListTile(
              checkColor: Colors.white,
              activeColor: kDarkBlue2Color,
              value: AttendanceCubit.get(context).checkbox,
              onChanged: AttendanceCubit.get(context).changeCheck,
            ),
          ),
        ),
      ],
    ),
  ),
);
Widget ShowSubjectsBuilder(w, subjects, context, state) => ConditionalBuilder(
  condition: state is! ShowSubjectsLoadingState && subjects != null,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          ShowSubjectsItem(w, subjects[index], index, context),
      separatorBuilder: (context, index) {
        return MyDivider();
      },
      itemCount: subjects.length),
  fallback: (context) => Center(child: LinearProgressIndicator()),
);

Widget ShowClassroomsBuilder(w, classrooms, context, state) => ConditionalBuilder(
  condition: state is! ShowClassroomsLoadingState && classrooms != null,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          ShowClassroomsItem(w, classrooms[index], index, context),
      separatorBuilder: (context, index) {
        return MyDivider();
      },
      itemCount: classrooms.length),
  fallback: (context) => Center(child: LinearProgressIndicator()),
);

Widget ShowExamsBuilder(w, students, context, state) => ConditionalBuilder(
      condition: state is! ShowExamsLoadingState && students != null,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) =>
              ShowExamsItem(w, students[index], index, context),
          separatorBuilder: (context, index) {
            return MyDivider();
          },
          itemCount: students.length),
      fallback: (context) => Center(child: LinearProgressIndicator()),
    );

Widget AddExamsBuilder(w, students, context, state, controllers) =>
    ConditionalBuilder(
      condition: state is! AddExamsLoadingState && students != null,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) {
            controllers.add(TextEditingController());
            return AddExamsItem(
                w, students[index], index, context, controllers[index]);
          },
          separatorBuilder: (context, index) {
            return MyDivider();
          },
          itemCount: students.length),
      fallback: (context) => Center(child: LinearProgressIndicator()),
    );

