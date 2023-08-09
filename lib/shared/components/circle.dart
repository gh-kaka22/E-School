import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget MyCircle({
  Color color = kDarkBlue2Color,
}) =>
    Padding(
      padding: EdgeInsets.only(left: 30, right: 15),
      child: CircleAvatar(
        radius: 10,
        backgroundColor: color,
        child: Center(
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 5,
              backgroundColor: color,
            ),
          ),
        ),
      ),
    );

Widget MyLine({
  Color lineColor = kDarkBlue2Color,
}) =>
    Padding(
      padding: EdgeInsets.only(left: 38.0),
      child: Container(
        width: 5,
        height: 70,
        color: lineColor.withOpacity(0.3),
      ),
    );
