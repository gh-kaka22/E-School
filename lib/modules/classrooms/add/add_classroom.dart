import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/classrooms/add/cubit/add_classroom_cubit.dart';
import 'package:untitled/modules/classrooms/add/cubit/add_classroom_states.dart';
import 'package:untitled/modules/subjects/add/cubit/add_subject_cubit.dart';
import 'package:untitled/modules/subjects/add/cubit/add_subject_states.dart';
import 'package:untitled/modules/teachers/add/cubit/add_teacher_cubit.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/styles/colors.dart';
import '../../../shared/components/components.dart';

class AddClassroom extends StatelessWidget {
  const AddClassroom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var roomNumberController = TextEditingController();

    var capacityController = TextEditingController();

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
      create: (context) => AddClassroomCubit(),
      child: BlocConsumer<AddClassroomCubit, AddClassroomStates>(
        listener: (context, state) {
          if (state is AddClassroomSuccessState) {
            if(state.addClassroomModel.status ?? true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content:
                  Center(
                    child: Text(
                        '${state.addClassroomModel.message}',
                        style: TextStyle(color: Colors.white)),
                  )));
            } else  {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                    child: Text(
                      '${state.addClassroomModel.message}',
                      style: TextStyle(color: Colors.white),
                    ),
                  )));

            }}
        },
        builder: (context, state) {
          var cubit = AddClassroomCubit.get(context);
          return Container(
            width: w - (w / 5) - 5,
            decoration: BoxDecoration(
              color: Colors.white24,
            ),
            child: Padding(
              padding:  EdgeInsets.all(h/40),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enter Classroom: ",
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
                            padding:  EdgeInsets.all(h/45),
                            child: Row(
                              children: [
                                Expanded(
                                  child: buildSForm(
                                    controller: roomNumberController,
                                    labeltext: 'Room Number',
                                  ),
                                ),
                                SizedBox(
                                  width: w / 30,
                                ),
                                Expanded(
                                    child: buildSForm(
                                        controller: capacityController,
                                        labeltext: 'Capacity')),
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
                                          right: h/5.3,
                                          left: h/40,
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
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(h/45),
                          ),


                        ],
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.all(h/45),
                    ),
                    state is! AddClassroomLoadingState
                        ? defaultButton(
                        text: 'Add',
                        width: w / 5,
                        height: h / 20,
                        onPressed: () {
                          cubit.AddClassroom(
                              token: token,
                              roomNumber: roomNumberController.text,
                              capacity: capacityController.text,
                              gradeId: cubit.grade
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



