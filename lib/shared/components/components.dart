import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modules/register/register_cubit.dart';
import '../../styles/colors.dart';

Widget defaultButton({
  required double width,
  required void Function() onPressed,
  required double height,
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
  double borderwidth = 2,
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
        borderRadius: BorderRadius.circular(50),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: borderwidth,
          color: bordercolor,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: borderwidth,
          color: bordercolor,
        ),
        borderRadius: BorderRadius.circular(50),
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

      return null;
    },
  );
}
