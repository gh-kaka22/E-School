import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/register/register_cubit.dart';
import '../../layout/homescreen/homescreen.dart';
import '../../shared/components/components.dart';
import '../../styles/colors.dart';


class Register extends StatelessWidget {
  var FnameController = TextEditingController();
  var LnameController = TextEditingController();
  var _DateController = TextEditingController();
  var FatherController = TextEditingController();
  var fatherPhoneController = TextEditingController();
  var FmotherController = TextEditingController();
  var LmotherController = TextEditingController();
  var motherPhoneController = TextEditingController();
  var religionController = TextEditingController();
  var gradeController = TextEditingController();
  var havekidsController = TextEditingController();
  var detailsController = TextEditingController();
  var genderController = TextEditingController();
  var addressController = TextEditingController();
  var formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {

          if(state is RegisterError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text(state.error , style: TextStyle(color: Colors.white))));
          }
          if(state is RegisterSuccess){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text('Registered Successfully' , style: TextStyle(color: Colors.white),)));
          //todo: Navigate to home

          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            body: Row(
              children: [
                Container(
                  height: h,
                  width: w / 5,
                  color: Colors.white24,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Image.asset('assets/icons/E-School.png'),
                      ),
                      GridView.count(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 1,
                        // mainAxisSpacing: 10.0,
                        //crossAxisSpacing: 10.0,
                        childAspectRatio: 5,
                        children: List.generate(
                          drawer.length,
                          (index) => drawer[index],
                        ),
                      )
                    ],
                  ),
                ),

                Container(
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
                              "Enter Student Data : ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(color: kDarkBlue2Color),
                            ),
                          ),
                          // ...List.generate(
                          //   1,
                          //   (index) => buildFormStudents(w),
                          // ),
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
                                                controller: FnameController, labeltext: 'First Name',

                                            ),

                                        ),

                                        SizedBox(
                                          width: w / 30,
                                        ),
                                        Expanded(
                                            child: buildSForm(
                                                controller: LnameController, labeltext: ' Last Name')),
                                        SizedBox(
                                          width: w / 30,
                                        ),
                                        Expanded(
                                            child: buildSForm(
                                                controller: addressController, labeltext: 'Address')),
                                        // Expanded(
                                        //     child: buildSForm(
                                        //         controller: DateController, labeltext: 'Date Of Birth')),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: buildSForm(
                                                controller: FatherController, labeltext: 'Father\'s Name')),
                                        SizedBox(
                                          width: w / 30,
                                        ),
                                        Expanded(
                                            child: buildSForm(
                                                controller: fatherPhoneController,
                                                labeltext: 'Father\'s Phone Number')),
                                        SizedBox(
                                          width: w / 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: buildSForm(
                                                controller: FmotherController,
                                                labeltext: 'First Mother\'s Name')),
                                        SizedBox(
                                          width: w / 30,
                                        ),
                                        Expanded(
                                            child: buildSForm(
                                                controller: LmotherController,
                                                labeltext: 'Last Mother\'s Name')),
                                        SizedBox(
                                          width: w / 30,
                                        ),
                                        Expanded(
                                            child: buildSForm(
                                                controller: motherPhoneController,
                                                labeltext: 'Mother\'s Phone Number')),
                                        SizedBox(
                                          width: w / 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: buildSForm(
                                                controller: detailsController, labeltext: 'Details')),
                                        SizedBox(
                                          width: w / 30,
                                        ),


                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child:TextField(
                                            controller: _DateController,
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.calendar_month),
                                              labelText: "Select Date",
                                            ),
                                            onTap: ()async{
                                              DateTime? pickddate=await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2000),
                                                  lastDate:DateTime (2100),
                                              );
                                              // if(pickddate!=null);
                                              // setState(() {
                                              //   _DateController=DateFormat('yyyy-mm-dd').format(pickddate);
                                              // });
                                            },
                                          ),
                                        ),



                                          // buildSForm(controller: gradeController, labeltext: 'Grade'),


                                        SizedBox(
                                          width: w / 30,
                                        ),
                                        //
                                        Expanded(
                                            child: DropdownButton<dynamic>(
                                              value: 1,
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: kGold1Color,
                                              ),
                                              iconSize: 24,
                                              elevation: 40,
                                              hint: Text('Choose Religion'),
                                              style: TextStyle(color: kGold1Color,fontSize: 16),
                                              onChanged: (newValue) {
                                                cubit.changeDropDownButton(newValue);
                                              },
                                              items: cubit.religionitem,
                                            ),
                                        ),
                                        //  Expanded(child: buildSForm(controller: havekidsController)),
                                        SizedBox(
                                          width: w / 30,
                                        ),
                                        Expanded(
                                            child: buildSForm(
                                                controller: genderController, labeltext: 'Gender')),

                                        // SizedBox(
                                        //   height: h / 30,
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                          ),








                          Padding(
                            padding: const EdgeInsets.all(16.0),
                          ),
                          state is! RegisterLoading
                              ? defaultButton(
                                  text: 'insert',
                                  width: w / 5,
                                  height: h / 20,
                                onPressed: (){
                                    RegisterCubit.get(context).StudentRegister(

                                      first_name: FnameController.text ,
                                      father_name: FnameController.text,
                                      last_name: LnameController.text,
                                      father_phone: fatherPhoneController.text,
                                      first_mother_name:FmotherController.text,
                                      last_mother_name:LmotherController.text,
                                        mother_phone:motherPhoneController,
                                        address:addressController.text,
                                        detailes:detailsController.text,
                                        religion:religionController.text,
                                        gender:genderController.text,
                                        grade_number:gradeController.text,
                                        have_sib:havekidsController.text,

                                                                        );
                                }
                                )
                              : Center(child: CircularProgressIndicator()),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
