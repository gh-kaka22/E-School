import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/about_us/update/cubit/update_school_cubit.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/styles/colors.dart';
import '../../../shared/components/components.dart';


class UpdateSchool extends StatelessWidget {
  const UpdateSchool({Key? key}) : super(key: key);

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
      create: (context) => UpdateSchoolCubit()..getSchoolData(2),
      child: BlocConsumer<UpdateSchoolCubit, UpdateSchoolState>(
        listener: (context, state) {
          if (state is UpdateSchoolError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content:
                Text(state.toString(),
                    style: TextStyle(color: Colors.white))));
          }
          if (state is UpdateSchoolSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'School Updated Successfully',
                  style: TextStyle(color: Colors.white),
                ))
            );

            //todo: Navigate to home
          }
        },
        builder: (context, state) {
          var cubit = UpdateSchoolCubit.get(context);
          var model=UpdateSchoolCubit.get(context).aboutUsModel;
          if (model != null && model.data != null) {
            nameController.text = model.data!.name!;
            addressController.text = model.data!.address!;
            phoneController.text = model.data!.phone!.toString();
            overviewController.text = model.data!.overview!;
          }
          return ConditionalBuilder(
            condition: cubit.aboutUsModel !=null,
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
                        name:"Update School Data : ",

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
                                      labeltext: 'Adrress',
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
                      state is! UpdateSchoolLoading
                          ? defaultButton(
                          text: 'Update',
                          width: w / 5,
                          height: h / 20,
                          onPressed: () {
                            cubit.UpdateSchoolData(
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

            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}



