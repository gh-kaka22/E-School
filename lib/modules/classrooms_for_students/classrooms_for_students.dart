
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/classrooms_for_students/cubit/classrooms_for_student_cubit.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/styles/colors.dart';
class ClassroomForStudnt extends StatelessWidget {
  ClassroomForStudnt({super.key});

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double padding = MediaQuery.of(context).size.width / 20;
    double borderwidth = 1;
    var studentID = TextEditingController();
    var ClassID = TextEditingController();
    return BlocProvider(
      create: (context) => ClassroomsForStudentCubit(),

      child: BlocConsumer<ClassroomsForStudentCubit, ClassroomsForStudentState>(
        listener: (context, state) {
          if (state is ClassroomsForStudentErrorState ) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content:
                Text(state.error, style: TextStyle(color: Colors.white))));
          }


          if (state is ClassroomsForStudentSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Created Successfully',
                  style: TextStyle(color: Colors.white),
                )));

            //navigateTo(context, StudentsShow());
          }
        },
        builder: (context, state) {
          var cubit = ClassroomsForStudentCubit.get(context);

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
                        "Add To Classroom: ",
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
                                    controller: studentID,
                                    labeltext: 'Student ID',
                                  ),
                                ),
                                SizedBox(
                                  width: w / 30,
                                ),
                                Expanded(
                                    child: buildSForm(
                                        controller: ClassID,
                                        labeltext: 'RoomNumber')),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                          ),


                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                    ),
                    state is! ClassroomsForStudentLoadingState
                        ? defaultButton(
                        text: 'Add',
                        width: w / 5,
                        height: h / 20,
                        onPressed: () {
                          cubit.UpdateClass(
                             student_id: studentID.text,
                            classroom_id: ClassID.text,
                          );
                        })
                        : Center(child: CircularProgressIndicator()),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                    ),
                    state is! EditClassroomsForStudentLoadingState
                        ? defaultButton(
                        text: 'Edit',
                        width: w / 5,
                        height: h / 20,
                        buttColor: Colors.orangeAccent,
                        onPressed: () {
                          cubit.EditClass(
                            student_id: studentID.text,
                            classroom_id: ClassID.text,
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
