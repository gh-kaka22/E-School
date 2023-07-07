import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:untitled/models/classroom_model.dart';
import 'package:untitled/modules/teachers/add/cubit/add_teacher_cubit.dart';
import 'package:untitled/shared/components/teacher.dart';
import 'package:untitled/styles/colors.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/text_components.dart';

class AddTeacher extends StatelessWidget {
  const AddTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var TFirstnameController = TextEditingController();
    var TLastnameController = TextEditingController();
    var TphoneNumberController = TextEditingController();
    var TUphoneNumberController = TextEditingController();
    var TaddressController = TextEditingController();
    var formkey = GlobalKey<FormState>();
    List<dynamic> selectedItem=[];

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double borderwidth = 1;
    double padding = w / 20;

    return BlocProvider(
      create: (context) => AddTeacherCubit()..getClassrooms()..getSubjects(),
      child: BlocConsumer<AddTeacherCubit, AddTeacherState>(
        listener: (context, state) {

          if (state is AddTeacherError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.toString(),
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
                                        controller: TaddressController,
                                        labeltext: 'Address')),
                                SizedBox(
                                  width: w / 30,
                                ),
                                Expanded(
                                    child: buildSForm(
                                        controller: TphoneNumberController,
                                        labeltext: ' Phone Number')),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: buildSForm(
                                        controller: TUphoneNumberController,
                                        labeltext: ' Urgent Phone Number')),
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
                                            'Choose Subject',
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
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: Container(
                                width: w/3,
                                color: Colors.white24,
                                child: MultiSelectDialogField(
                                  items: cubit.items,
                                  dialogWidth: w/3,
                                  title: Text("CLASSROOMS"),
                                  selectedColor: kGold1Color,
                                  decoration: BoxDecoration(
                                    color: null,
                                    borderRadius: BorderRadius.all(Radius.circular(40)),
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
                            ),
                          )





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
                                subjectId: '1',
                                classrooms: selectedItem.toString(),
                                urgent_phone_number: TUphoneNumberController.text,
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
