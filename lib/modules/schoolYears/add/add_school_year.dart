import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/schoolYears/add/cubit/add_school_year_cubit.dart';
import 'package:untitled/modules/schoolYears/add/cubit/add_school_year_states.dart';
import 'package:untitled/modules/subjects/add/cubit/add_subject_cubit.dart';
import 'package:untitled/modules/subjects/add/cubit/add_subject_states.dart';
import 'package:untitled/modules/teachers/add/cubit/add_teacher_cubit.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/styles/colors.dart';
import '../../../shared/components/components.dart';

class AddSchoolYear extends StatelessWidget {
  const AddSchoolYear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var schoolYearNameController = TextEditingController();


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
      create: (context) => AddSchoolYearCubit(),
      child: BlocConsumer<AddSchoolYearCubit, AddSchoolYearStates>(
        listener: (context, state) {
          if (state is AddSchoolYearSuccessState) {
            if(state.addSchoolYearModel.status == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content:
                  Center(
                    child: Text(
                        '${state.addSchoolYearModel.message}',
                        style: TextStyle(color: Colors.white)),
                  )));
            } else  {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Center(
                  child: Text(
                    '${state.addSchoolYearModel.message}',
                    style: TextStyle(color: Colors.white),
                  ),
                )));

          }}
        },
        builder: (context, state) {
          var cubit = AddSchoolYearCubit.get(context);
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
                        "Enter School Year: ",
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
                            child: Center(
                              child: buildSForm(
                                controller: schoolYearNameController,
                                labeltext: 'Name',
                              ),
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
                    state is! AddSchoolYearLoadingState
                        ? defaultButton(
                        text: 'Add',
                        width: w / 5,
                        height: h / 20,
                        onPressed: () {
                          cubit.AddSchoolYear(
                            token: token,
                            name: schoolYearNameController.text,
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



