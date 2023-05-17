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
  FontWeight fontWeight = FontWeight.w500,
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

Widget buildFormStudents(double w)  {
  var FnameController = TextEditingController();
  var LnameController = TextEditingController();
  var DateController = TextEditingController();
  var FatherController = TextEditingController();
  var fatherPhoneController = TextEditingController();
  var FmotherController = TextEditingController();
  var LmotherController = TextEditingController();
  var motherPhoneController = TextEditingController();
  var religionController = TextEditingController();
  var gradeController = TextEditingController();
  var havekidsController = TextEditingController();
  var detailsController = TextEditingController();
  var genderController = TextEditingController();
  var addressController = TextEditingController();


  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
                child: buildSForm(
                    controller: FnameController, labeltext: 'First Name')),

            SizedBox(
              width: w / 30,
            ),
            Expanded(
                child: buildSForm(
                    controller: LnameController, labeltext: ' Last Name')),
            SizedBox(
              width: w / 30,
            ),
            Expanded(
                child: buildSForm(
                    controller: addressController, labeltext: 'Address')),
            // Expanded(
            //     child: buildSForm(
            //         controller: DateController, labeltext: 'Date Of Birth')),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
                child: buildSForm(
                    controller: FatherController, labeltext: 'Father\'s Name')),
            SizedBox(
              width: w / 30,
            ),
            Expanded(
                child: buildSForm(
                    controller: fatherPhoneController,
                    labeltext: 'Father\'s Phone Number')),
            SizedBox(
              width: w / 30,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
                child: buildSForm(
                    controller: FmotherController,
                    labeltext: 'First Mother\'s Name')),
            SizedBox(
              width: w / 30,
            ),
            Expanded(
                child: buildSForm(
                    controller: LmotherController,
                    labeltext: 'Last Mother\'s Name')),
            SizedBox(
              width: w / 30,
            ),
            Expanded(
                child: buildSForm(
                    controller: motherPhoneController,
                    labeltext: 'Mother\'s Phone Number')),
            SizedBox(
              width: w / 30,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
                child: buildSForm(
                    controller: detailsController, labeltext: 'Details')),
            SizedBox(
              width: w / 30,
            ),

            // SizedBox(
            //   width: w / 30,
            // ),

            // SizedBox(
            //   height: h / 30,
            // ),
          ],
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Row(
      //     children: [
      //       Expanded(
      //         child:CheckboxListTile(
      //           title: Text('Religion'),
      //           value: _ischecked,
      //           onChanged: (bool? newValue{
      //
      //           }),
      //         ),
      //
      //         // buildSForm(controller: gradeController, labeltext: 'Grade'),
      //       ),
      //
      //       SizedBox(
      //         width: w / 30,
      //       ),
      //       //
      //       Expanded(
      //           child: buildSForm(
      //               controller: religionController, labeltext: 'Religion')),
      //       //  Expanded(child: buildSForm(controller: havekidsController)),
      //       SizedBox(
      //         width: w / 30,
      //       ),
      //       Expanded(
      //           child: buildSForm(
      //               controller: genderController, labeltext: 'Gender')),
      //
      //       // SizedBox(
      //       //   height: h / 30,
      //       // ),
      //     ],
      //   ),
      // ),30
    ],
  );
}

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
          fontWeight: FontWeight.w600,
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
