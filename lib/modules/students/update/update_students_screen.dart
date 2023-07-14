import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/students/show/show_students.dart';
import 'package:untitled/modules/students/update/cubit/update_students_cubit.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/styles/colors.dart';

class UpdateStudent extends StatelessWidget {
  var FnameController = TextEditingController();

  var LnameController = TextEditingController();

  var FatherController = TextEditingController();

  var fatherPhoneController = TextEditingController();

  var FmotherController = TextEditingController();

  var LmotherController = TextEditingController();

  var motherPhoneController = TextEditingController();

  var detailsController = TextEditingController();

  var addressController = TextEditingController();
  var nationalityController = TextEditingController();
  UpdateStudent({super.key, required id});

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double padding=MediaQuery.of(context).size.width/20;
    double borderwidth = 1;

    return BlocProvider(
      create: (context) => UpdateStudentsCubit()..getStudentData(1),
      child: BlocConsumer<UpdateStudentsCubit, UpdateStudentsState>(
        listener: (context, state) {
          if (state is UpdateStudentsError)
          {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content:
                Text(state.error, style: TextStyle(color: Colors.white))));

          }

          if (state is UpdateStudentsSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Update Successfully',
                  style: TextStyle(color: Colors.white),
                )));

            navigateTo(context, StudentsShow());
          }
        },
        builder: (context, state) {
          var cubit = UpdateStudentsCubit.get(context);
          var model = UpdateStudentsCubit.get(context).updateStudentModel;
          if (model != null && model.data != null) {
            FnameController.text = model.data!.firstName!;
            LnameController.text = model.data!.lastName!;
            fatherPhoneController.text = model.data!.fatherPhoneNumber!;
            motherPhoneController.text = model.data!.motherPhoneNumber!;
            addressController.text = model.data!.address!;
            detailsController.text = model.data!.details!;
            FatherController.text = model.data!.fatherFirstName!;
            FmotherController.text = model.data!.motherFirstName!;
            LmotherController.text = model.data!.motherLastName!;
            nationalityController.text=model.data!.nationalId!;
          }
          return ConditionalBuilder(
            condition: UpdateStudentsCubit.get(context).updateStudentModel != null,
            builder: (context) => Container(
              width: w - (w / 5) - 5,
              decoration: BoxDecoration(
                color: Colors.white24,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Update Student Data : ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: kDarkBlue2Color),
                        ),
                      ),
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            SizedBox(height: h/8),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: buildSForm(
                                      controller: FnameController,
                                      labeltext: 'First Name',
                                    ),
                                  ),
                                  SizedBox(
                                    width: w / 30,
                                  ),
                                  Expanded(
                                      child: buildSForm(
                                          controller: LnameController,
                                          labeltext: ' Last Name')),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: buildSForm(
                                      controller: addressController,
                                      labeltext: 'Address',
                                    ),
                                  ),
                                  SizedBox(
                                    width: w / 30,
                                  ),
                                  Expanded(
                                      child: buildSForm(
                                          controller: detailsController,
                                          labeltext: ' Details')),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: buildSForm(
                                      controller: FatherController,
                                      labeltext: 'First Father Name',
                                    ),
                                  ),
                                  SizedBox(
                                    width: w / 30,
                                  ),
                                  Expanded(
                                      child: buildSForm(
                                          controller: fatherPhoneController,
                                          labeltext: ' Father Phone Number')),
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
                                          labeltext: 'First Mother Name')),
                                  SizedBox(
                                    width: w / 30,
                                  ),
                                  Expanded(
                                      child: buildSForm(
                                          controller: LmotherController,
                                          labeltext: 'Last Mother Name')),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: buildSForm(
                                          controller: motherPhoneController,
                                          labeltext: 'Mother Phone Number')),
                                  SizedBox(
                                    width: w / 30,
                                  ),
                                  Expanded(
                                      child: buildSForm(
                                          controller: nationalityController,
                                          labeltext: 'National Number')),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(16.0),
                            //   child: Row(
                            //     children: [
                            //       Expanded(
                            //         child: Container(
                            //           decoration: BoxDecoration(
                            //             border: Border.all(
                            //               color: kDarkBlue2Color,
                            //               width: borderwidth,
                            //             ),
                            //             borderRadius: BorderRadius.circular(20),
                            //           ),
                            //           child: DropdownButton<String>(
                            //             value: cubit.updateStudentModel!.data!.religion,
                            //             icon: Icon(
                            //               Icons.keyboard_arrow_down,
                            //               color: kGold1Color,
                            //             ),
                            //             iconSize: 24,
                            //             elevation: 40,
                            //             borderRadius: BorderRadius.circular(40),
                            //             underline: Container(),
                            //             hint: Padding(
                            //               padding:
                            //               EdgeInsets.only(left: padding,right: padding),
                            //               child: Text(
                            //                 'Choose Religion',
                            //                 style: TextStyle(
                            //                     color: kDarkBlue2Color,
                            //                     fontSize: 16),
                            //               ),
                            //             ),
                            //             onChanged: (newValue) {
                            //               cubit.changeDropDownButton(newValue!);
                            //             },
                            //             items: cubit.ReligionItems,
                            //           ),
                            //         ),
                            //       ),
                            //       SizedBox(
                            //         width: w / 30,
                            //       ),
                            //       Expanded(
                            //         child: Container(
                            //           decoration: BoxDecoration(
                            //             border: Border.all(
                            //               color: kDarkBlue2Color,
                            //               width: borderwidth,
                            //             ),
                            //             borderRadius: BorderRadius.circular(20),
                            //           ),
                            //           child: DropdownButton<String>(
                            //
                            //             value: cubit.updateStudentModel!.data!.gradeId.toString(),
                            //
                            //             icon: Icon(
                            //               Icons.keyboard_arrow_down,
                            //               color: kGold1Color,
                            //             ),
                            //             iconSize: 24,
                            //             elevation: 40,
                            //             borderRadius: BorderRadius.circular(40),
                            //
                            //             underline: Container(),
                            //
                            //             hint: Padding(
                            //               padding:  EdgeInsets.only(
                            //                 right: padding,
                            //                 left: padding,
                            //               ),
                            //               child: Text(
                            //                 'Choose Grade',
                            //                 style: TextStyle(
                            //                     color: kDarkBlue2Color,
                            //                     fontSize: 16),
                            //               ),
                            //             ),
                            //             //  style: ,
                            //             onChanged: (gr) {
                            //               cubit.changeGradeDropDownButton(gr!);
                            //             },
                            //
                            //             items: cubit.GradeItems,
                            //           ),
                            //         ),
                            //       ),
                            //
                            //     ],
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: buildSForm(
                                          controller: addressController,
                                          labeltext: 'Address')),
                                  SizedBox(
                                    width: w / 30,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: borderwidth,
                                          color: kDarkBlue2Color,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text("${cubit.updateStudentModel!.data!.dateOfBirth}"
                                              .split(' ')[0],

                                          ),

                                          SizedBox(
                                            width: 20,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white54.withOpacity(0.1),
                                              foregroundColor: kGold1Color,
                                              side: BorderSide(
                                                  width: 1, color: Colors.white),
                                              elevation: 0,
                                            ),
                                            onPressed: () =>
                                                cubit.selectDate(context),
                                            child: const Text(
                                              'Select date of birth',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                      ),
                      state is! UpdateStudentsLoading
                          ? defaultButton(
                              text: 'Update',
                              width: w / 5,
                              height: h / 20,
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                 cubit.UpdateStudentData(
                                    firstname: FnameController.text,
                                    lastname: LnameController.text,
                                    firstFatherName: FatherController.text,
                                    firstMotherName: FmotherController.text,
                                    lastMotherName: LmotherController.text,
                                    fatherPhoneNumber: fatherPhoneController.text,
                                    motherPhoneNumber: motherPhoneController.text,
                                    address: addressController.text,
                                    details: detailsController.text,
                                    nationalId: nationalityController.text,
                                  );
                                }
                              })
                          : Center(
                              child: LinearProgressIndicator(
                              color: kDarkBlue2Color,
                            )),
                    ],
                  ),
                ),
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
