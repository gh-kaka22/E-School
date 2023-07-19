import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/subjects/add/cubit/add_subject_cubit.dart';
import 'package:untitled/modules/subjects/add/cubit/add_subject_states.dart';
import 'package:untitled/modules/teachers/add/cubit/add_teacher_cubit.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/styles/colors.dart';
import '../../../shared/components/components.dart';

class AddSubject extends StatelessWidget {
  const AddSubject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subjectNameController = TextEditingController();

    var subjectMaxMarkController = TextEditingController();

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
      create: (context) => AddSubjectCubit(),
      child: BlocConsumer<AddSubjectCubit, AddSubjectStates>(
        listener: (context, state) {
          if (state is AddSubjectSuccessState) {
            if(state.addSubjectModel.status == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content:
                  Center(
                    child: Text(
                        '${state.addSubjectModel.message}',
                        style: TextStyle(color: Colors.white)),
                  )));
            } else  {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Center(
                  child: Text(
                    '${state.addSubjectModel.message}',
                    style: TextStyle(color: Colors.white),
                  ),
                )));

          }}
        },
        builder: (context, state) {
          var cubit = AddSubjectCubit.get(context);
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
                        "Enter Subject: ",
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
                                    controller: subjectNameController,
                                    labeltext: 'Name',
                                  ),
                                ),
                                SizedBox(
                                  width: w / 30,
                                ),
                                Expanded(
                                    child: buildSForm(
                                        controller: subjectMaxMarkController,
                                        labeltext: 'Max Mark')),
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
                    state is! AddSubjectLoadingState
                        ? defaultButton(
                        text: 'Add',
                        width: w / 5,
                        height: h / 20,
                        onPressed: () {
                          cubit.AddSubject(
                            token: token,
                            name: subjectNameController.text,
                            max_mark: subjectMaxMarkController.text
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



