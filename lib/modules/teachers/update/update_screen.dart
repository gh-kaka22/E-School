import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:untitled/styles/colors.dart';
import '../../../shared/components/components.dart';
import 'cubit/update_teacher_cubit.dart';

class UpdateTeacher extends StatelessWidget {
  var TFirstnameController = TextEditingController();

  var TLastnameController = TextEditingController();

  var TphoneNumberController = TextEditingController();

  var TaddressController = TextEditingController();
  List<dynamic> selectedItem=[];
  UpdateTeacher({super.key, required id});

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double borderwidth = 1;
    double padding = w / 20;
    return BlocProvider(
      create: (context) => UpdateTeacherCubit()..getTeacherData(1)..getClassrooms(),
      child: BlocConsumer<UpdateTeacherCubit, UpdateTeacherState>(
        listener: (context, state) {
          if (state is UpdateTeacherDataError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content:
                    Text(state.error, style: TextStyle(color: Colors.white))));
          }
          if (state is UpdateTeacherDataSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Update Successfully',
                  style: TextStyle(color: Colors.white),
                )));

            //navigateTo(context, ShowTeachers());
          }
        },
        builder: (context, state) {
          var cubit = UpdateTeacherCubit.get(context);
          var model = UpdateTeacherCubit.get(context).updateTeacherModel;
          if (model != null && model.data != null) {
            TFirstnameController.text = model.data!.firstName!;
            TLastnameController.text = model.data!.lastName!;
            TphoneNumberController.text = model.data!.phoneNumber!;
            TaddressController.text = model.data!.address!;
          }
          return ConditionalBuilder(
            condition: UpdateTeacherCubit.get(context).updateTeacherModel != null,
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
                          "Update Teacher Data : ",
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
                                          controller: TphoneNumberController,
                                          labeltext: 'Phone Number')),
                                  SizedBox(
                                    width: w / 30,
                                  ),
                                  Expanded(
                                      child: buildSForm(
                                          controller: TaddressController,
                                          labeltext: 'Address')),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: MultiSelectDialogField(
                                      items: cubit.items,
                                      dialogWidth: w/3,
                                      title: Text("CLASSROOMS"),
                                      selectedColor: kGold1Color,
                                      decoration: BoxDecoration(
                                        color: null,
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                        border: Border.all(
                                          color: kDarkBlue2Color,
                                          width: 1,
                                        ),
                                      ),
                                      buttonIcon: Icon(
                                        Icons.class_outlined,
                                        color: kGold1Color,
                                      ),
                                      buttonText: Text(
                                        "Choose Classrooms:",
                                        style: TextStyle(
                                          color: kGold1Color,
                                          fontSize: 16,
                                        ),
                                      ),

                                      onConfirm: (results) {
                                        selectedItem = results;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: w / 30,
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: kDarkBlue2Color,
                                          width: borderwidth,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: DropdownButton<dynamic>(
                                          value: cubit.dropDownValueSubject,
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: kGold1Color,
                                          ),
                                          iconSize: 24,
                                          elevation: 40,
                                          borderRadius: BorderRadius.circular(40),
                                          underline: Container(),
                                          hint: Padding(
                                            padding: EdgeInsets.only(
                                                left: padding, right: padding),
                                            child: Text(
                                              cubit.updateTeacherModel!.data!.subjectId.toString(),
                                              style: TextStyle(
                                                  color: kDarkBlue2Color,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          onChanged: (newValue) {
                                            cubit.changeSubjectDropDownButton(newValue!);
                                          },
                                          items: cubit.menuItemsSubject,
                                        ),
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
                      state is! UpdateTeacherDataLoading
                          ? defaultButton(
                              text: 'Update',
                              width: w / 5,
                              height: h / 20,
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  cubit.UpdateTeacherData(
                                    firstname: TFirstnameController.text,
                                    lastname: TLastnameController.text,
                                    phonenumber: TphoneNumberController.text,
                                    address: TaddressController.text,
                                    subject: cubit.subjectId.toString(),
                                    classroom: selectedItem,
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
