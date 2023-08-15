import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/modules/attendance/add/cubit/attendance_cubit.dart';
import 'package:untitled/modules/books/show/cubit/show_books_states.dart';
import 'package:untitled/modules/classrooms/show/cubit/show_classrooms_states.dart';
import 'package:untitled/modules/exams/add/cubit/exams_add_states.dart';
import 'package:untitled/modules/exams/show/cubit/exams_show_states.dart';
import 'package:untitled/modules/files/show/cubit/show_files_states.dart';
import 'package:untitled/modules/news/show/cubit/get_posts_states.dart';
import 'package:untitled/modules/results/cubit/results_states.dart';
import 'package:untitled/modules/schoolYears/show/cubit/show_school_year_states.dart';
import 'package:untitled/modules/students/show/cubit/show_students_cubit.dart';
import 'package:untitled/modules/students/show/cubit/show_students_states.dart';
import 'package:untitled/modules/students/show/show_students.dart';
import 'package:untitled/modules/students/update/cubit/update_students_cubit.dart';
import 'package:untitled/modules/students/update/update_students_screen.dart';
import 'package:untitled/modules/subjects/show/cubit/show_subjects_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:url_launcher/url_launcher.dart';

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
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
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

      if (text.length > 500) {
        return 'It is too long';
      }
      if (text.length < 1) {
        return 'It is too short';
      }
      return null;
    },
  );
}

TextFormField buildPostForm({
  Color bordercolor = kDarkBlue2Color,
  Color font = kGold1Color,
  required String labeltext,
  Type? type,
  required TextEditingController controller,
  double borderwidth = 1,
}) {
  return TextFormField(
    maxLines: 6,

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
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: kGold1Color),
      ),
      label: Center(

        child: AutoSizeText(
          labeltext,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: font,
          ),
        ),
      ),
    ),
    controller: controller,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (String? text) {
      if (text == null || text == " " || text.isEmpty) {
        return 'Can\'t be empty';
      }

      if (text.length > 500) {
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


////

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (Route<dynamic> route) => false,
);

////


//Lists Items & Builders
//Students
Widget ShowStudentsItem(w,h,padding,radius, student, index, context,ShowStudentsCubit cubit,state) => Container(
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
                     await cubit.getResultStudent(student.studentId);
                     Future.delayed(Duration(seconds: 1), () {
                    showDialog<Future<void>> (
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
                              condition: cubit.results != null && state is! ShowResultLoadingState,
                              builder: (context) => ListView.separated(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: cubit.results!.length,
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
                                            child: Center(child: Text('${cubit.results?[index].result}',style: TextStyle(
                                              color: kDarkWhiteColor,
                                              fontSize: 20,

                                            ),)),

                                          ),
                                          Expanded(
                                              child: Center(
                                                child: Text('${cubit.results?[index].schoolYear}',
                                                    style: TextStyle(overflow: TextOverflow.ellipsis , color: kDarkBlue2Color,fontSize: 20)),
                                              )),

                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              fallback: (context) => Center(child: Text('<< No Result >>')),
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
                     });

                  },
                  height: 30,
                  text: 'Result',
                  fontsize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: defaultButton(
                  onPressed: () {

                    navigateTo(context, UpdateStudent(id:student.studentId,grade: student.gradeId,),);
                        cubit.getStudentData(student.studentId);





                    print(student.studentId);
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
Widget ShowStudentsBuilder(w,h,padding,radius, students, context, state,cubit) => ConditionalBuilder(
  condition: state is! ShowStudentsLoadingState && students != null,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          ShowStudentsItem(w,h,padding,radius, students[index], index, context,cubit,state),
      separatorBuilder: (context, index) {
        return MyDivider();
      },
      itemCount: students.length),
  fallback: (context) => Center(child: LinearProgressIndicator()),
);

//Ranking
Widget RankingItem(w, student, index, context) => Container(
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
              child: Medal(index+1),
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
          child: Center(child: Text('${student.schoolyear}')),
        ),
        Expanded(
            child: Center(
              child: Text('${student.result *100 /1000} %',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        student.result>700?
        Expanded(
          child: Center(
            child:Icon(Icons.check_circle,color: Colors.lightGreen,)
          ),
        ):
        Expanded(
          child: Center(
              child:Icon(Icons.highlight_remove,color: Colors.red,)
          ),
        )
      ],
    ),
  ),
);
Widget RankingBuilder(w, students, context, state) => ConditionalBuilder(
  condition: state is! ResultsLoadingState && students != null,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          RankingItem(w, students[index], index, context),
      separatorBuilder: (context, index) {
        return MyDivider();
      },
      itemCount: students.length),
  fallback: (context) => Center(child: SizedBox()),
);
Widget? Medal(index){
  if(index == 1){
    return Container(
      height: 50,
      width: 50,
      child: Image.asset('assets/icons/medalG.png'),
    );
  }else if(index == 2){
    return Container(
      height: 50,
      width: 50,
      child: Image.asset('assets/icons/medalS.png'),
    );
  } else if(index == 3){
    return Container(
      height: 50,
      width: 50,
      child: Image.asset('assets/icons/medalB.png'),
    );
  } else return Text('${index}',
      style: TextStyle(fontWeight: FontWeight.bold));

}

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

//Books
Widget ShowBooksItem(w, book, index, context,cubit) => Container(
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
              child: Text('${book.id}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
            child: Center(
              child: Text('${book.name}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
            child: Center(
              child: Text('${book.url}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )
        ),
        Expanded(
          child: Center(
            child: defaultButton(
              onPressed: () {
                launchUrl(
                  Uri.parse(book.url),
                  mode: LaunchMode.externalApplication
                );
              },
              height: 30,
              text: 'Open',
              fontsize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: InkWell(
              onTap: (){
                cubit.deleteBook(book.id);
                cubit.getBooksByGrade(book.gradeId);
              },
                child: Icon(Icons.delete_outline,color: Colors.red,))
          ),
        ),
      ],
    ),
  ),
);
Widget ShowBooksBuilder(w, books, context, state,cubit) => ConditionalBuilder(
  condition: state is! ShowBooksLoadingState && books != null,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          ShowBooksItem(w, books[index], index, context,cubit),
      separatorBuilder: (context, index) {
        return MyDivider();
      },
      itemCount: books.length),
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
                    print(date);
                    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
                    print(formattedDate);

                    cubit.AddExam(
                      studentId: '${student.studentId}',
                      typeId: type,
                      subjectName: subject,
                      mark: controller.text,
                      schoolYear: year,
                      date: formattedDate,
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
          child: Center(child: Text('${student.roomNumber}')),
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

///POSTS
AssetImage commentImage(role){
  if(role == 0 || role == 1)
  {
    return AssetImage('assets/icons/Blue-Icon.jpg');
  } else if(role == 2){
    return AssetImage('assets/icons/graduating-student-b.png');
  } else if(role==4){
    return AssetImage('assets/icons/teacher.png');
  }else{
    return AssetImage('assets/icons/parents (1).png');
  }
}
Widget buildPostItem(post,context,cubit,state) => Card(
  clipBehavior: Clip.antiAliasWithSaveLayer,
  elevation: 7.0,
  margin: EdgeInsets.symmetric(horizontal: 8.0),
  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: commentImage(post.role)
            ),
            SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${post.publisher}',
                        style: TextStyle(
                            height: 1.3
                        ),
                      ),
                      SizedBox(width: 8.0,),
                      post.publisher=='E-School' ?
                      Icon(Icons.verified,color: Colors.lightBlue,size: 16,):
                      SizedBox(width: 1.0,),
                    ],
                  ),
                  Text(
                      '${post.date}',
                      style:Theme.of(context).textTheme.bodySmall!.copyWith(height: 1.3)
                  ),
                ],
              ),
            ),
                Expanded(
                  child: Row(
                    children: [
                      Spacer(),
                      InkWell(
                        onTap: (){
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(''),
                                content: SizedBox(
                                    width: 40,
                                    height: 80,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 10,),
                                        post.isMine ?
                                        InkWell(
                                            onTap:(){
                                              var editedPostController = TextEditingController(text: '${post.body}');
                                              showDialog<void>(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text('Edit Post:'),
                                                    content: SizedBox(
                                                      width: double.maxFinite,
                                                      child: defaultFormField(
                                                          type: TextInputType.text,
                                                          label: 'type here',
                                                          controller: editedPostController
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        child: Text('OK'),
                                                        onPressed: () {
                                                          cubit.editPost(
                                                              postId : post.postId,
                                                              body : editedPostController.text,
                                                              token : token
                                                          );
                                                          cubit.getPosts();
                                                          Navigator.of(context).pop();
                                                          Navigator.of(context).pop();
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Text('Edit Post',style: TextStyle(color: Colors.orange),)):
                                        SizedBox(),
                                        SizedBox(height: 20,),
                                        InkWell(
                                            onTap:(){
                                              showDialog<void>(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text('Are You Sure'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        child: Text('Delete'),
                                                        onPressed: () {
                                                          cubit.deletePost(post.postId);
                                                          cubit.getPosts();
                                                          Navigator.of(context).pop();
                                                          Navigator.of(context).pop();
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: Text('Cancel'),
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Text('Delete Post',style: TextStyle(color: Colors.red))),
                                      ],
                                    )
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                              'assets/icons/dots.png'
                          ),
                        ),
                      )
                    ],
                  ),
                )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 15.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        Text(
          '${post.body}',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.3,fontSize: 14,fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap:(){
                    cubit.getLikes(post.postId);
                    Future.delayed(Duration(seconds: 1), () {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('People who liked this'),
                            content: SizedBox(
                              width: double.maxFinite,
                              child: ConditionalBuilder(
                                condition: cubit.likes != null ,
                                builder: (context) => ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: cubit.likes.length,
                                  separatorBuilder: (BuildContext context, int index) => Divider(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListTile(
                                      leading: CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: kWhiteColor,
                                        backgroundImage: commentImage(cubit.likes[index].role),
                                      ),
                                      title: Text(cubit.likes[index].publisher),
                                      trailing: Icon(
                                        Icons.thumb_up,
                                        size: 16.0,
                                        color: Colors.blue,
                                      ),
                                    );
                                  },
                                ),
                                fallback: (context) => Center(child: Text('No likes yet...')),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  cubit.likes = null;
                                },
                              ),
                            ],
                          );
                        },
                      );
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.thumb_up_outlined,
                          size: 16.0,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          '${post.likesCount} likes',
                          style: Theme.of(context).textTheme.bodySmall,

                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap:() async{
                    await cubit.getComments(post.postId);
                    Future.delayed(Duration(seconds: 1), () {
                      showDialog<Future<void>>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Latest Comments'),
                            content: SizedBox(
                              width: double.maxFinite,
                              child: ConditionalBuilder(
                                condition: cubit.comments != null ,
                                builder: (context) => ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: cubit.comments.length,
                                  separatorBuilder: (BuildContext context, int index) => SizedBox(height: 20,),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius: BorderRadius.circular(10.0), // set the radius of the corners
                                          border: Border.all(
                                            color: Colors.grey[300]!, // set the color of the border
                                            width: 1.0, // set the width of the border
                                          ),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: Color.fromRGBO(0, 0, 0, 0.2),
                                                blurRadius: 5) //blur radius of shadow
                                          ]
                                      ),
                                      child: ListTile(
                                          leading: CircleAvatar(
                                            radius: 20.0,
                                            backgroundColor: kWhiteColor,
                                            backgroundImage: commentImage(cubit.comments[index].role),
                                          ),
                                          title: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(cubit.comments[index].publisher,),
                                              Text(cubit.comments[index].body,style: TextStyle(fontSize: 13),),
                                            ],
                                          ),
                                          subtitle: Text(
                                              '${cubit.comments[index].date}',
                                              style:Theme.of(context).textTheme.bodySmall!.copyWith(height: 1.3)
                                          ),
                                          trailing:
                                          cubit.comments[index].isMine== true ?
                                          IconButton(
                                              onPressed: (){
                                                showDialog<void>(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text('What do you want to do'),
                                                      content: SizedBox(
                                                          width: 40,
                                                          height: 80,
                                                          child: Column(
                                                            children: [
                                                              SizedBox(height: 10,),
                                                              InkWell(
                                                                  onTap:(){
                                                                    var editedCommentController = TextEditingController(text: '${cubit.comments[index].body}');
                                                                    showDialog<void>(
                                                                      context: context,
                                                                      builder: (BuildContext context) {
                                                                        return AlertDialog(
                                                                          title: Text('Edit Comment:'),
                                                                          content: SizedBox(
                                                                            width: double.maxFinite,
                                                                            child: defaultFormField(
                                                                                type: TextInputType.text,
                                                                                label: 'type here',
                                                                                controller: editedCommentController
                                                                            ),
                                                                          ),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              child: Text('OK'),
                                                                              onPressed: () {
                                                                                cubit.editComment(
                                                                                    postId : post.postId,
                                                                                    commentId : cubit.comments[index].id,
                                                                                    body : editedCommentController.text,
                                                                                    token : token
                                                                                );
                                                                                //cubit.getComments(post.postId);
                                                                                Navigator.of(context).pop();
                                                                                Navigator.of(context).pop();
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Text('Edit Comment',style: TextStyle(color: Colors.orange),)),
                                                              SizedBox(height: 20,),
                                                              InkWell(
                                                                  onTap:(){
                                                                    showDialog<void>(
                                                                      context: context,
                                                                      builder: (BuildContext context) {
                                                                        return AlertDialog(
                                                                          title: Text('Are You Sure'),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              child: Text('Delete'),
                                                                              onPressed: () {
                                                                                cubit.deleteComment(cubit.comments[index].id);
                                                                                cubit.getComments(post.postId);
                                                                                post.comentsCount = post.comentsCount - 1;
                                                                                Navigator.of(context).pop();
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                            ),
                                                                            TextButton(
                                                                              child: Text('Cancel'),
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Text('Delete Comment',style: TextStyle(color: Colors.red))),
                                                            ],
                                                          )
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: Text('Cancel'),
                                                          onPressed: () {
                                                            Navigator.of(context).pop();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              icon: Icon(Icons.edit,color: kGold1Color,)
                                          ) :
                                          SizedBox()
                                      ),
                                    );
                                  },
                                ),
                                fallback: (context) => Center(child: Text('No comments yet...')),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  cubit.comments = null;
                                },
                              ),
                            ],
                          );
                        },
                      );
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.chat_outlined,
                          size: 16.0,
                          color: kGold1Color,
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          '${post.comentsCount} comments',
                          style: Theme.of(context).textTheme.bodySmall,

                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(bottom: 10.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap:(){
                  var commentController = TextEditingController();
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Write a comment'),
                        content: SizedBox(
                          width: double.maxFinite,
                          child: defaultFormField(
                              type: TextInputType.text,
                              label: 'type here',
                            controller: commentController
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              cubit.sendComment(
                                postId : post.postId,
                                body : commentController.text,
                                token : token
                              );
                              post.comentsCount = post.comentsCount + 1;
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );

                },
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/icons/Blue-Icon.jpg'),
                    ),
                    SizedBox(width: 15,),
                    Text(
                        'write a comment...',
                        style:Theme.of(context).textTheme.bodySmall
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap:(){
                if(post.isLiked==false) {
                  print(post.postId);
                  cubit.Like(post.postId);
                  post.likesCount = post.likesCount + 1;
                  post.isLiked = !post.isLiked;
                }else
                {
                  print(post.postId);
                  cubit.Like(post.postId);
                  post.likesCount = post.likesCount - 1;
                  post.isLiked = !post.isLiked;
                }

              },
              child: Row(
                children: [
                  post.isLiked == false ?
                  Icon(
                    Icons.thumb_up_outlined,
                    size: 16.0,
                    color: Colors.blue,
                  ) :
                  Icon(
                    Icons.thumb_up,
                    size: 16.0,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 5.0,),
                  Text(
                    'Like',
                    style: Theme.of(context).textTheme.bodySmall,

                  )
                ],
              ),
            ),
          ],
        ),


      ],
    ),
  ),
);
Widget PostsBuilder(posts,cubit, context, state) => ConditionalBuilder(
  condition: state is! GetPostsLoadingState && posts != null,
  builder: (context) => ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>
          buildPostItem(posts[index],context,cubit,state),
      separatorBuilder: (context,index) => SizedBox(height: 8,),
      itemCount: posts.length),
  fallback: (context) => Center(child: CircularProgressIndicator()),
);







