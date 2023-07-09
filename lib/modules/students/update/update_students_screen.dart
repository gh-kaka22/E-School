import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/students/update/cubit/update_students_cubit.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/styles/colors.dart';
class UpdateStudent extends StatelessWidget {
  const UpdateStudent({super.key});

  @override
  Widget build(BuildContext context) {
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
      create: (context) => UpdateStudentsCubit()..getStudentData(1),
      child: BlocConsumer<UpdateStudentsCubit, UpdateStudentsState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = UpdateStudentsCubit.get(context);
          var model=UpdateStudentsCubit.get(context).studentModel;
          if (model != null && model.data != null) {
            FnameController.text = model!.data!.firstName! ?? '';
            LnameController.text = model!.data!.lastName! ?? '';
            fatherPhoneController.text = model!.data!.fatherPhoneNumber! ?? '';
            motherPhoneController.text = model!.data!.motherPhoneNumber! ?? '';
            addressController.text = model!.data!.address! ?? '';
            FatherController.text = model!.data!.fatherName! ?? '';
            FmotherController.text = model!.data!.motherFirstName! ?? '';
            LmotherController.text = model!.data!.motherLastName! ?? '';
          }
          return ConditionalBuilder(
            condition: UpdateStudentsCubit.get(context).studentModel!=null,
            builder: (context)=>Container(
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
                                          labeltext: 'Address')),
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
                            if(formkey.currentState!.validate()){
                              UpdateStudentsCubit.get(context).UpdateStudentData(
                                  id: '1',
                                  firstname: FnameController.text,
                                  lastname: LnameController.text,
                                  firstFatherName: FatherController.text,
                                  firstMotherName: FmotherController.text,
                                  lastMotherName: LmotherController.text,
                                  fatherPhoneNumber:fatherPhoneController.text ,
                                  motherPhoneNumber: motherPhoneController.text,
                                  address: addressController.text,
                                  details: detailsController.text,
                                  nationalId:nationalityController.text,
                              ); }

                          })
                          : Center(child: LinearProgressIndicator(color: kDarkBlue2Color,)),

                    ],
                  ),
                ),
              ),
            ), fallback: (context)=>Center(child: CircularProgressIndicator()),

          );
        },
      ),
    );
  }
}
