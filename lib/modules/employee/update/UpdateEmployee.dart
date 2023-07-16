import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/employee_model.dart';
import 'package:untitled/modules/employee/update/cubit/update_employee_cubit.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/text_components.dart';

class UpdateEmployee extends StatelessWidget {
  const UpdateEmployee({Key? key}) : super(key: key);

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
      create: (context) => UpdateEmployeeCubit()..getEmployeeData(1),
      child: BlocConsumer<UpdateEmployeeCubit, UpdateEmployeeState>(
        listener: (context, state) {
          if (state is UpdateEmployeeErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content:
                Text(state.toString(),
                    style: TextStyle(color: Colors.white))));
          }
          if (state is UpdateEmployeeSuccessState) {
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
          var cubit = UpdateEmployeeCubit.get(context);
          var model = UpdateEmployeeCubit.get(context).employeeModel;
          if (model != null && model.data != null) {
            FirstnameController.text = model.data!.firstName! ;
            LastnameController.text = model.data!.lastName! ;
            addressController.text = model.data!.address! ;
            phoneNumberController.text = model.data!.phoneNumber! ;
            jobController.text=model.data!.job!;
          }
          return ConditionalBuilder(
            condition:  UpdateEmployeeCubit.get(context).employeeModel != null,
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
                      MyText(
                        name:"Update Employee Data : ",

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
                      state is! UpdateEmployeeLoadingState
                          ? defaultButton(
                          text: 'Update',
                          width: w / 5,
                          height: h / 20,
                          onPressed: () {
                            cubit.updateEmployee(
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
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}