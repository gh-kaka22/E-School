import 'package:flutter/cupertino.dart';
import 'package:untitled/styles/colors.dart';


Widget ShowText({
  required String name,
  Color color=kDarkBlue2Color,
  double size=18,
  FontWeight fontWeight=FontWeight.w400,
})=> Text(name,
  style: TextStyle(
    color: color,
    fontSize: size,
    fontWeight: fontWeight,
      overflow: TextOverflow.ellipsis
  ),


);