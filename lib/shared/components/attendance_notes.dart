import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_school/modules/attendance/cubit/attendance_cubit.dart';
import 'package:e_school/modules/notes/cubit/notes_cubit.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components.dart';

///Attendance
Widget ShowAttendanceItem(w, h, absence, index, context) => Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: w - (w / 6),
        height: h / 13,
        decoration: BoxDecoration(
            color: kDarkBlue2Color.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        child: Row(
          children: [
            Container(
              width: w / 6,
              height: h / 10,
              decoration: BoxDecoration(
                color: kDarkBlue2Color,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Stack(children: [
                Container(
                  child: Center(
                    child: Text(
                      '${absence.day.substring(0, 3).toUpperCase()}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,

                      ),
                    ),
                  ),
                ),

              ]),
            ),
            Expanded(
                child: Center(
                 child: Text('${absence.date}',
                  style: TextStyle(overflow: TextOverflow.ellipsis , color: kDarkBlue2Color)),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon( Icons.date_range_rounded, color: kGold1Color,)),

          ],
        ),
      ),
    );
Widget ShowAttendanceBuilder(w, h, absences, context, state) =>
    ConditionalBuilder(
      condition: state is! AttendanceLoadingState && absences != null,
      builder: (context) => ListView.separated(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              ShowAttendanceItem(w, h, absences[index], index, context),
          separatorBuilder: (context, index) {
            return Center(
              child: SizedBox(),
            );
          },
          itemCount: absences.length),

      fallback: (context) => Center(child: LinearProgressIndicator()),
    );

///Notes
Widget ShowNotesItem(w, h, note, index, context) => Padding(
  padding: const EdgeInsets.all(15.0),
  child:   Container(

        width: w - (w / 6),

        height: h / 6,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

            color: Colors.grey[300],

            boxShadow: <BoxShadow>[

              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.5), blurRadius: 10)

            ]),

        child: Stack(

          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(

                  width: w / 3,

                  height: h / 20,

                  decoration: BoxDecoration(

                    color: kDarkBlue2Color,

                    borderRadius: BorderRadius.only(

                        bottomRight: Radius.circular(20),

                        topRight: Radius.circular(20)),

                  ),

                  child: Center(

                    child: Text(

                      'Sunday',

                      style: TextStyle(

                        fontSize: 15,

                        fontWeight: FontWeight.w500,

                        color: Colors.white,

                      ),

                    ),

                  ),

                ),
              ],
            ),

            Expanded(

                child: Center(

              child: Text(

                '${note.content}',

                style: TextStyle(

                  overflow: TextOverflow.ellipsis,

                  fontSize: 20,

                  fontWeight: FontWeight.w500,

                ),

              ),

            )),

            Padding(
              padding:  EdgeInsets.only(left: w-(w/3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(

                    width: w / 3,

                    height: h / 20,

                    decoration: BoxDecoration(

                      color: kDarkBlue2Color,

                      borderRadius: BorderRadius.only(

                          bottomLeft: Radius.circular(20),

                          topLeft: Radius.circular(20)),

                    ),

                    child: Center(

                      child: Text(

                        '${note.date}',

                        style: TextStyle(

                          fontSize: 13,

                          fontWeight: FontWeight.w500,

                          color: Colors.white,

                        ),

                      ),

                    ),

                  ),
                ],
              ),
            ),

          ],

        ),

      ),
);
Widget ShowNotesBuilder(w, h, notes, context, state) => ConditionalBuilder(
      condition: state is! NotesLoadingState && notes != null,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) =>
              ShowNotesItem(w, h, notes[index], index, context),
          separatorBuilder: (context, index) {
            return SizedBox();
          },
          itemCount: notes.length),
      fallback: (context) => Center(child: LinearProgressIndicator()),
    );
