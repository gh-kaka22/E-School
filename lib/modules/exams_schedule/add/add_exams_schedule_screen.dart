
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect.dart';

import 'package:untitled/modules/exams_schedule/add/cubit/add_exams_schedule_cubit.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/styles/colors.dart';

class AddExamSchedule extends StatelessWidget {
  const AddExamSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var schoolYearController = TextEditingController();
    var formkey = GlobalKey<FormState>();
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    double padding= w/60;
    return BlocProvider(
      create: (context) => AddExamsScheduleCubit(),
      child: BlocConsumer<AddExamsScheduleCubit, AddExamsScheduleState>(
        listener: (context, state) {
          if (state is AddExamsScheduleSuccessState) {
            if(state.examScheduleModel.status ?? true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content:
                  Center(
                    child: Text(
                        '${state.examScheduleModel.message}',
                        style: TextStyle(color: Colors.white)),
                  )));
            } else  {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                    child: Text(
                      '${state.examScheduleModel.message}',
                      style: TextStyle(color: Colors.white),
                    ),
                  )));

            }}
        },
        builder: (context, state) {
          var cubit = AddExamsScheduleCubit.get(context);
          return Container(
            width: w - (w / 5) - 5,
            decoration: BoxDecoration(
              color: Colors.white24,
            ),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Add Exam Schedule ",
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
                            padding: EdgeInsets.all(padding),
                            child: Row(
                              children: [
                                Expanded(
                                  child: buildSForm(
                                    controller: schoolYearController,
                                    labeltext: 'School Year',
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
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: DropdownButton<String>(
                                        value: cubit.grade,
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
                                            right: padding,
                                            left: padding,
                                          ),
                                          child: Text(
                                            'Choose Grade',
                                            style: TextStyle(
                                                color: kDarkBlue2Color,
                                                fontSize: 16),
                                          ),
                                        ),
                                        //  style: ,
                                        onChanged: (gr) {
                                          cubit.changeGradeDropDownButton(gr!);
                                        },

                                        items: cubit.GradeItems,
                                      ),
                                    ),
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
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: DropdownButton<String>(
                                        value: cubit.dropDownValueType,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: kGold1Color,
                                        ),
                                        iconSize: 24,
                                        elevation: 40,
                                        borderRadius: BorderRadius.circular(40),

                                        underline: Container(),

                                        hint: Padding(
                                          padding:  EdgeInsets.only(
                                            right: padding,
                                            left: padding,
                                          ),
                                          child: Text(
                                            'Choose Type',
                                            style: TextStyle(
                                                color: kDarkBlue2Color,
                                                fontSize: 16),
                                          ),
                                        ),
                                        //  style: ,
                                        onChanged: (newValue) {
                                          cubit.changeTypeDropDownButton(newValue!);
                                        },

                                        items: cubit.menuItemsType,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding:  EdgeInsets.all(padding),
                          // ),


                        ],
                      ),
                    ),

                    defaultButton(
                        text: 'Choose Schedule',
                        width: w / 5,
                        height: h / 20,
                        onPressed: () {
                          cubit.selectImage();
                        }),
                    SizedBox(height: 20,),
                    if (cubit.selectedFile != null)
                      Center(child: Text(cubit.fileName!)),

                    Padding(
                      padding:  EdgeInsets.all(16.0),
                    ),
                    state is! AddExamsScheduleLoadingState
                        ? defaultButton(
                        text: 'Add',
                        width: w / 5,
                        height: h / 20,
                        onPressed: () {
                          cubit.AddExamSchedule(
                            typeId: cubit.dropDownValueType,
                            schoolYear: schoolYearController.text,
                            gradeId: cubit.grade,
                            filePath: cubit.filePath,
                            fileName: cubit.fileName,

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