import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/teachers/add/cubit/add_teacher_cubit.dart';
import 'package:untitled/styles/colors.dart';
import '../../../shared/components/components.dart';

class AddTeacher extends StatelessWidget {
  const AddTeacher({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      var TFirstnameController = TextEditingController();

      var TLastnameController = TextEditingController();

      var TphoneNumberController = TextEditingController();

      var TaddressController = TextEditingController();



      var TeacherDetailesController = TextEditingController();



      var formkey = GlobalKey<FormState>();
      double w = MediaQuery
          .of(context)
          .size
          .width;
      double h = MediaQuery
          .of(context)
          .size
          .height;
      return BlocProvider(
        create: (context) => AddTeacherCubit(),
        child: BlocConsumer<AddTeacherCubit, AddTeacherState>(
          listener: (context, state) {
            if (state is AddTeacherError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content:
                  Text(state.toString(),
                      style: TextStyle(color: Colors.white))));
            }
            if (state is AddTeacherSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    'Registered Successfully',
                    style: TextStyle(color: Colors.white),
                  )));
              //todo: Navigate to home
            }
          },
          builder: (context, state) {
            var cubit = AddTeacherCubit.get(context);
            return Container(
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
                          "Enter Teacher Data : ",
                          style: Theme
                              .of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: kDarkBlue2Color),
                        ),
                      ),
                      Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: buildSForm(
                                      controller: TFirstnameController,
                                      labeltext: 'First Name',
                                    ),
                                  ),
                                  SizedBox(
                                    width: w / 30,
                                  ),
                                  Expanded(
                                      child: buildSForm(
                                          controller: TLastnameController,
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
                                          controller: TaddressController,
                                          labeltext: 'Address')),
                                  SizedBox(
                                    width: w / 30,
                                  ),
                                  Expanded(
                                      child: buildSForm(
                                          controller:TeacherDetailesController ,
                                          labeltext: ' Details')),
                                  // SizedBox(
                                  //   width: w / 30,
                                  // ),
                               //todo: dropdown for sub and multi select for section
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                      ),
                      state is! AddTeacherLoading
                          ? defaultButton(
                          text: 'insert',
                          width: w / 5,
                          height: h / 20,
                          onPressed: () {
                            cubit.AddTeacher(
                              first_name: TFirstnameController.text,
                              last_name: TLastnameController.text,
                              phone_number: TphoneNumberController.text,
                              address: TaddressController.text,
                              subject: 1,
                              details: TeacherDetailesController.text,
                            );
                          })
                          : Center(child: CircularProgressIndicator()),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }


