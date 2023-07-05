import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/modules/attendance/add/cubit/attendance_cubit.dart';
import 'package:untitled/modules/books/show/cubit/show_files_states.dart';
import 'package:untitled/modules/classrooms/show/cubit/show_classrooms_states.dart';
import 'package:untitled/modules/exams/add/cubit/exams_add_states.dart';
import 'package:untitled/modules/exams/show/cubit/exams_show_states.dart';
import 'package:untitled/modules/notice/add/cubit/add_notice_cubit.dart';
import 'package:untitled/modules/notice/show/show_notes.dart';
import 'package:untitled/modules/schoolYears/show/cubit/show_school_year_states.dart';
import 'package:untitled/modules/students/show/cubit/show_students_states.dart';
import 'package:untitled/modules/students/update/update_students_screen.dart';
import 'package:untitled/modules/subjects/show/cubit/show_subjects_states.dart';
import 'package:untitled/shared/components/constants.dart';

import '../../styles/colors.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget defaultFormField({
   TextEditingController? controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  ValueChanged? onChange,
  VoidCallback? suffixPressed,
   FormFieldValidator? validate,
  required String label,
   IconData? prefix,
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

      fillColor: Colors.white24,
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

//Lists Items & Builders
//Students
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
                    navigateTo(context, StudentsShow());
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

//Subjects

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
                  onPressed: () {},
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

//Classrooms
Widget ShowClassroomsItem(w, classroom, index, context) => Container(
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
              child: Text('${classroom.roomNumber}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
          child: Center(child: Text('${classroom.gradeId}')),
        ),
        Expanded(
          child: Center(child: Text('${classroom.capacity}')),
        ),
        Expanded(
          child: Center(
            child: defaultButton(
              onPressed: () {},
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

//Schoolyears
Widget ShowSchoolYearsItem(w, schoolYear, index, context) => Container(
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
              child: Text('${schoolYear.id}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
            Expanded(
                child: Center(
              child: Text('${schoolYear.name}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
            Expanded(
              child: Center(
                child: defaultButton(
                  onPressed: () {},
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
Widget ShowSchoolYearsBuilder(w, schoolYears, context, state) =>
    ConditionalBuilder(
      condition: state is! ShowSchoolYearLoadingState && schoolYears != null,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) =>
              ShowSchoolYearsItem(w, schoolYears[index], index, context),
          separatorBuilder: (context, index) {
            return MyDivider();
          },
          itemCount: schoolYears.length),
      fallback: (context) => Center(child: LinearProgressIndicator()),
    );

//Files

Widget ShowFilesItem(w, file, index, context) => Container(
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
              child: Text('${file.id}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
            child: Center(
              child: Text('${file.name}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
          child: Center(
            child: defaultButton(
              onPressed: () {
                downloadFile(
                  '${file.path}',
                  file.name
                );
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.green,
                    content:
                    Center(
                      child: Text(
                          'DOWNLOADED',
                          style: TextStyle(color: Colors.white)),
                    )));

              },
              height: 30,
              text: 'Download',
              fontsize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: defaultButton(
              onPressed: () =>openFile(
                url: '${file.path}',
              ),
              height: 30,
              text: 'Open',
              fontsize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    ),
  ),
);
Widget ShowFilesBuilder(w, files, context, state) => ConditionalBuilder(
  condition: state is! ShowFilesLoadingState && files != null,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          ShowFilesItem(w, files[index], index, context),
      separatorBuilder: (context, index) {
        return MyDivider();
      },
      itemCount: files.length),
  fallback: (context) => Center(child: LinearProgressIndicator()),
);


//Exams
Widget ShowExamsItem(w, student, index, context,cubit) => Container(
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
            Expanded(child: Center(child: Text('${cubit.dropDownValueClass}'))),
            Expanded(
              child: Center(child: Text('${cubit.dropDownValueSection}')),
            ),
            Expanded(
                child: Center(
              child: Text('${student.name}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
            Expanded(
                child: Center(
                  child: Text('${student.date}',
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.grey,
                      )),
                )),
            Expanded(
                child: Center(
              child: Text('${student.mark}',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: student.mark > student.maxMark / 2
                           ? Colors.green
                           : Colors.red,
                  ),
                  )),
            ),
            Expanded(
              child: Center(
                child: defaultButton(
                  onPressed: () {
                    navigateTo(context, StudentsShow());
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
Widget ShowExamsBuilder(w, students, context, state,cubit) => ConditionalBuilder(
  condition: state is! ShowExamsLoadingState && students != null,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          ShowExamsItem(w, students[index], index, context,cubit),
      separatorBuilder: (context, index) {
        return MyDivider();
      },
      itemCount: students.length),
  fallback: (context) => Center(child: LinearProgressIndicator()),
);

Widget AddExamsItem(w, subject, student, type, year, date, index, context, controller, cubit) => Container(
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
            Expanded(child: Center(child: Text('${student.gradeId}'))
            ),
            Expanded(
              child: Center(child: Text('${student.roomNumber}')),
            ),
            Expanded(
              child: Center(child: Text('${cubit.dropDownValueSubject}')),
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

                    cubit.AddExam(
                      studentId: '${student.studentId}',
                      typeId: type,
                      subjectName: subject,
                      mark: controller.text,
                      schoolYear: year,
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
Widget AddExamsBuilder(w, subject, students, type, year, date, context, state, controllers, cubit) => ConditionalBuilder(
      condition: state is! AddExamsLoadingState && students != null,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) {
            controllers.add(TextEditingController());
            return AddExamsItem(w, subject, students[index], type, year, date,
                index, context, controllers[index], cubit);
          },
          separatorBuilder: (context, index) {
            return MyDivider();
          },
          itemCount: students.length),
      fallback: (context) => Center(child: LinearProgressIndicator()),
    );

//Attendance

Widget AddAttendanceBuilder(w, students, date, cubit ,controllers, context, state) =>
    ConditionalBuilder(
      condition: state is! AttendanceLoadingState && students != null,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) {
            return AddAttendanceItem(w, students[index],  date, cubit,controllers ,
                context,index);
          },
          separatorBuilder: (context, index) {
            return MyDivider();
          },
          itemCount: students.length),
      fallback: (context) => Center(child: LinearProgressIndicator()),
    );

Widget AddAttendanceItem(w, student,date, cubit , controller, context, int index ) => Container(
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
            child: Checkbox(
              checkColor: Colors.white,
              activeColor: kDarkBlue2Color,
              value: AttendanceCubit.get(context).idStudents.contains(student.studentId),
              onChanged: (v) => AttendanceCubit.get(context).changeCheck(
                v!,
                student.studentId,
              ),
            ),
          ),
        ),
      ],
    ),
  ),
);


///open file
Future openFile ({required String url , String? fileName})async{
  final name = fileName ?? url.split('/').last;
  final file = await downloadFile(url,name);
  if (file== null)  return;
  print('path : ${file.path}');
  OpenFile.open(file.path);
}

///download file
Future<File?> downloadFile(String url,String name)async{
  final appStorage = await getApplicationDocumentsDirectory();
  final file =File('${appStorage.path}/$name');
  try {
    final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,

        )
    );
    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    return file;
  }catch(e){
    return null;
  }
}







