import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/employee/add/cubit/add_employee_cubit.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/text_components.dart';

class AddEmployee extends StatelessWidget {
 const AddEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var FirstnameController = TextEditingController();
    var LastnameController = TextEditingController();
    var addressController=TextEditingController();
    var phoneNumberController=TextEditingController();
    var jobController=TextEditingController();


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
      create: (context) => AddEmployeeCubit(),
      child: BlocConsumer<AddEmployeeCubit, AddEmployeeState>(
        listener: (context, state) {
          if (state is AddEmployeeErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content:
                Text(state.toString(),
                    style: TextStyle(color: Colors.white))));
          }
          if (state is AddEmployeeSuccessgState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Registered Successfully',
                  style: TextStyle(color: Colors.white),
                ))
            );
            //todo: Navigate to home
          }
        },
        builder: (context, state) {
          var cubit = AddEmployeeCubit.get(context);
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
                      name:"Enter Employee Data : ",

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
                                    controller: FirstnameController,
                                    labeltext: 'First Name',
                                  ),
                                ),
                                SizedBox(
                                  width: w / 30,
                                ),
                                Expanded(
                                    child: buildSForm(
                                        controller: LastnameController,
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
                                    controller: phoneNumberController,
                                    labeltext: 'phone Number',
                                  ),
                                ),
                                SizedBox(
                                  width: w / 30,
                                ),
                                Expanded(
                                    child: buildSForm(
                                        controller: addressController,
                                        labeltext: ' Address')),
                                SizedBox(
                                  width: w / 30,
                                ),
                                Expanded(
                                    child: buildSForm(
                                        controller: jobController,
                                        labeltext: ' Job Name')),
                              ],
                            ),
                          ),



                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                    ),
                    state is! AddEmployeeLoadingState
                        ? defaultButton(
                        text: 'insert',
                        width: w / 5,
                        height: h / 20,
                        onPressed: () {
                          cubit.addEmployee(
                            fname: FirstnameController.text,
                            lname: LastnameController.text,
                            address: addressController.text,
                            phoneNumber: phoneNumberController.text,
                            job: jobController.text,
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