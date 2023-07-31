import 'package:e_school/modules/complaints/add/cubit/complaints_cubit.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintsScreen extends StatelessWidget {

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var descriptionController = TextEditingController();


    return BlocProvider(
      create: (context) => ComplaintsCubit(),
      child: BlocConsumer<ComplaintsCubit, ComplaintsState>(
        listener: (context, state) {
          if (state is ComplaintSuccessState) {
            if (state.complaintModel.status == true) {
              print(state.complaintModel.message);
              showToast(
                  text: state.complaintModel.message,
                  state: ToastStates.SUCCESS);
            } else {
              print(state.complaintModel.message);
              showToast(
                  text: state.complaintModel.message, state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          var cubit = ComplaintsCubit.get(context);
          return Scaffold(

            appBar: AppBar(
              title: Text('have Any Note?'),
            ),
            body: Stack(
              children: [
                Container(
                  height: h,
                  width: w,
                  child: Image(image: AssetImage('assets/images/complaint.jpg'),
                  fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: h,
                  width: w,
                  color:kWhiteColor.withOpacity(0.9) ,
                  ),
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Form(
                              key: formkey,
                              child: TextFormField(
                                controller: descriptionController,
                                decoration: InputDecoration(
                                  fillColor: Colors.white24,
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: kDarkBlue2Color,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: kGold1Color),
                                  ),
                                  label: Text('Your Note'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),),
                            state is! ComplaintLoadingState
                                ? Center(
                              child: SizedBox(
                                width: w / 4,
                                height: h / 20,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      kDarkBlue2Color, //background color of button
                                      side: BorderSide(
                                          width: w / 4,
                                          color:
                                          kGold2Color), //border width and color
                                      elevation: 3, //elevation of button
                                      shape: RoundedRectangleBorder(
                                        //to set border radius to button
                                          borderRadius: BorderRadius.circular(5)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Text('Send'),
                                        SizedBox(
                                          width: w / 50,
                                        ),
                                        Icon(Icons.send),
                                      ],
                                    ),
                                    onPressed: () {
                                      cubit.addComplaint(
                                        description: descriptionController.text,
                                      );

                                    }),
                              ),
                            )
                                : Center(child: CircularProgressIndicator()),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
