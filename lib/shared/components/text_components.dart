import 'package:flutter/cupertino.dart';
import 'package:untitled/styles/colors.dart';

// show هي للترويسة تبع الـ
Widget ShowText({
  required String name,
  Color color = kDarkBlue2Color,
  double size = 18,
  FontWeight fontWeight = FontWeight.w400,
}) =>
    Text(
      name,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          overflow: TextOverflow.ellipsis),
    );
//هي لعناوين السكرينات
Widget MyText({required String name,
  Color color = kDarkBlue2Color,
  double size = 35,
  FontWeight fontWeight = FontWeight.w400,

}) => Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "$name",
        style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
//هي للدروب داون
 DropText ({
  required String name,
  Color color = kDarkBlue2Color,
  double size = 18,
  FontWeight fontWeight = FontWeight.w400,
   double p = 50.5,

})=>Padding(
  padding:  EdgeInsets.only(left: p),
  child:   Text(
    name,
    style: TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    ),

  ),
);

