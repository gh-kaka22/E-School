import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/styles/colors.dart';
import '../../../shared/components/components.dart';
import 'cubit/add_school_cubit.dart';

class AddSchool extends StatelessWidget {
  const AddSchool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();

    var phoneController = TextEditingController();
    var addressController=TextEditingController();
    var overviewController=TextEditingController();


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
      create: (context) => AddSchoolCubit(),
      child: BlocConsumer<AddSchoolCubit, AddSchoolState>(
        listener: (context, state) {
          if (state is AddSchoolErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content:
                Text(state.toString(),
                    style: TextStyle(color: Colors.white))));
          }
          if (state is AddSchoolSuccessgState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'School Created Successfully',
                  style: TextStyle(color: Colors.white),
                ))
            );

            //todo: Navigate to home
          }
        },
        builder: (context, state) {
          var cubit = AddSchoolCubit.get(context);
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
                    MyText(
                      name:"Enter School Data : ",

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
                                    controller: nameController,
                                    labeltext: 'School Name',
                                  ),
                                ),
                                SizedBox(
                                  width: w / 30,
                                ),
                                Expanded(
                                    child: buildSForm(
                                        controller: phoneController,
                                        labeltext: ' School Phone')),
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
                                    labeltext: 'Address',
                                  ),
                                ),
                                SizedBox(
                                  width: w / 30,
                                ),
                                Expanded(
                                    child: buildSForm(
                                        controller: overviewController,
                                        labeltext: ' OverView')),
                              ],
                            ),
                          ),



                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                    ),
                    state is! AddSchoolLoadingState
                        ? defaultButton(
                        text: 'insert',
                        width: w / 5,
                        height: h / 20,
                        onPressed: () {
                          cubit.AddInformationSchool(
                              name: nameController.text,
                              address: addressController.text,
                              phone: phoneController.text,
                              overview: overviewController.text);
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



