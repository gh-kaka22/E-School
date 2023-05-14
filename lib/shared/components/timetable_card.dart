
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class TimetableItem extends StatelessWidget {
  var subject;
  var from;
  var to;
  var teacher;
  var color;
  var icon;

  TimetableItem(
      this.subject, this.from, this.to, this.teacher, this.color,this.icon);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: color.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('s'),
          ),
          title: Text(
            subject,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kTitleTextColor,
            ),
          ),
          subtitle: Text(
            teacher,
            style: TextStyle(
              color: kTitleTextColor.withOpacity(0.7),
            ),
          ),
        ),
      ),
    );
  }
}
