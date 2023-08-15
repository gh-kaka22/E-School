import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/notice/add/cubit/add_notice_cubit.dart';
import 'package:untitled/modules/notice/show/cubit/show_notice_cubit.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';
import '../../modules/notice/show/show_note.dart';
import '../../styles/colors.dart';



Widget AddNoticeItem(w, student, type, date, index, context, controller, AddNoticeCubit cubit) =>
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
            // Expanded(
            //     child: Center(
            //   child: TextFormField(
            //       controller: controller,
            //       keyboardType: TextInputType.number,
            //       validator: (value) {},
            //       decoration: InputDecoration(
            //         focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(1),
            //           borderSide: BorderSide(color: kDarkBlue2Color),
            //         ),
            //       )),
            // )),
            Expanded(
              child: Center(
                child: defaultButton(
                  onPressed: () {
                    print('lllllll ${controller.text}');
                    print(student.studentId);
                    cubit.showNotesDialog(
                      context: context,
                      studentId: student.studentId,
                      type: type,

                    );
                    // cubit.AddNotice(
                    //   studentId: '${student.studentId}',
                    //   typeId: type,
                    //   contentt: controller.text,
                    //   date: '2023-06-12',
                    // );
                  },
                  height: 30,
                  text: 'Add',
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
            return AddNoticeItem(w, students[index], type, date, index, context,
                controllers[index], cubit);
          },
          separatorBuilder: (context, index) {
            return MyDivider();
          },
          itemCount: students.length),
      fallback: (context) => Center(child: LinearProgressIndicator()),
    );


Widget ShowNotesScreenItem(w, student, index, context,ShowNoticeCubit cubit,state) => Container(
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
                navigateTo(context, ShowNotesScreen(id: student.studentId,));
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
Widget ShowNotesScreenBuilder(w, students, context, state,cubit) => ConditionalBuilder(
  condition: state is! ShowNoticeLoadingState && students != null,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          ShowNotesScreenItem(w, students[index], index, context,cubit,state),
      separatorBuilder: (context, index) {
        return MyDivider();
      },
      itemCount: students.length),
  fallback: (context) => Center(child: LinearProgressIndicator()),
);


Widget ShowNotesItem(w, note, index, context) => Container(
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
              child: Text('${note.date}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
            child: Center(
              child: Text('${note.day}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),


        Expanded(
            child: Center(
              child: Text('${note.content}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),



      ],
    ),
  ),
);
Widget ShowNotesBuilder(w, notes, context, state) => ConditionalBuilder(
  condition: state is! ShowNoticeLoadingState && notes != null,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          ShowNotesItem(w, notes[index], index, context),
      separatorBuilder: (context, index) {
        return MyDivider();
      },

      itemCount: notes.length ?? 0),
  fallback: (context) => Center(child: LinearProgressIndicator()),
);