import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';

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
      if (text.length < 2) {
        return 'It is too short';
      }
      return null;
    },
  );
}
