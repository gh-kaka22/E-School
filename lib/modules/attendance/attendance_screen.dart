import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/components/schedule_card.dart';
import '../../shared/styles/colors.dart';


class attendanceItem{
  final bool absent;
  final String type;
  final String description;
  final String month;
  final String day;
  attendanceItem(this.absent,this.type, this.description, this.month, this.day);
}



class AttendanceScreen extends StatelessWidget {
  List<attendanceItem> attendance=[
    attendanceItem(true,'Absent', 'absent', 'JAN', '11'),
    attendanceItem(true,'Absent', 'absent', 'AUG', '06'),
    attendanceItem(false,'Late', '30 min', 'JAN', '11'),
    attendanceItem(true,'Absent', 'absent', 'MAR', '24'),
    attendanceItem(false,'Late', '1 hour', 'DEC', '16'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: attendanceBuilder(attendance,context),
    );

  }
}
Widget attendanceBuilder(attendance,context) => ConditionalBuilder(
  condition: attendance.length > 0,
  builder:(context) =>
      ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context,index)=> buildAttendanceItem(attendance, index),
        separatorBuilder: (context,index)=> MyDivider(),
        itemCount: attendance.length,
      ),
  fallback: (context) =>  Container(),

);
Widget buildAttendanceItem(attendance, index) =>
  Padding(
    padding: const EdgeInsets.all(20.0),
    child:  ScheduleCard(
        '${attendance[index].type}',
        '${attendance[index].description}',
        '${attendance[index].day}',
        '${attendance[index].month}',
        attendance[index].absent ? kOrangeColor : kYellowColor,
    ),
);

