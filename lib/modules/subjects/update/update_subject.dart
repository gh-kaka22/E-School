import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/subjects/update/cubit/update_subject_cubit.dart';
import 'package:untitled/styles/colors.dart';
import '../../../shared/components/components.dart';

class UpdateSubject extends StatelessWidget {
  const UpdateSubject({Key? key}) : super(key: key);

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
      create: (context) => UpdateSubjectCubit()..getSubjectData(2),
      child: BlocConsumer<UpdateSubjectCubit, UpdateSubjectState>(
        listener: (context, state) {
          if (state is UpdateSubjectError ) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content:
                Text(state.error, style: TextStyle(color: Colors.white))));
          }


          if (state is UpdateSubjectSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Update Successfully',
                  style: TextStyle(color: Colors.white),
                )));

            //navigateTo(context, StudentsShow());
          }
        },
        builder: (context, state) {
          var cubit = UpdateSubjectCubit.get(context);
          var model = UpdateSubjectCubit.get(context).addSubjectModel;
          if (model != null && model.data != null) {
            subjectNameController.text = model.data!.name!;
            subjectMaxMarkController.text = model.data!.maxMark!.toString();
          }
          return Scaffold(
            appBar: AppBar(),
            body: ConditionalBuilder(
              condition: UpdateSubjectCubit.get(context).addSubjectModel !=null,
              builder:(context)=> Container(

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
                            "Update Subject Data: ",
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
                        state is! UpdateSubjectLoading
                            ? defaultButton(
                            text: 'Add',
                            width: w / 5,
                            height: h / 20,
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                cubit.UpdateSubject(
                                  name: subjectNameController.text,
                                  max_mark: subjectMaxMarkController.text,

                                );
                              }
                            })
                            : Center(child: LinearProgressIndicator(
                          color: kDarkBlue2Color,)),
                      ],
                    ),
                  ),
                ),
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}



