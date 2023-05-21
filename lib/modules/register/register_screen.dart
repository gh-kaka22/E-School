import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/register/register_cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/components/drawer.dart';
import '../../styles/colors.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  var FnameController = TextEditingController();

  var LnameController = TextEditingController();

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
  bool _isChecked = true;
  String _currText = 'Have siblings??';
  List<String> YN = ['Have siblings??'];

  var formkey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content:
                    Text(state.error, style: TextStyle(color: Colors.white))));
          }
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Registered Successfully',
                  style: TextStyle(color: Colors.white),
                )));
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

                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset('assets/icons/E-School.png'),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(

                            children: [
                              DrawerOfDesktop(text: 'Dashboard'),
                              DrawerOfDesktop(text: 'Students'),
                              DrawerOfDesktop(text: 'Teachers'),
                              DrawerOfDesktop(text: 'Subjects'),
                              DrawerOfDesktop(text: 'Timetables'),
                              DrawerOfDesktop(text: 'News'),
                              DrawerOfDesktop(text: 'Classes'),
                              DrawerOfDesktop(text: 'Attendance'),
                              DrawerOfDesktop(text: 'Setting'),

                            ],
                          ),
                        )



                      ],
                    ),
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
                                          controller: FnameController,
                                          labeltext: 'First Name',
                                        ),
                                      ),
                                      SizedBox(
                                        width: w / 30,
                                      ),
                                      Expanded(
                                          child: buildSForm(
                                              controller: LnameController,
                                              labeltext: ' Last Name')),
                                      SizedBox(
                                        width: w / 30,
                                      ),
                                      Expanded(
                                          child: buildSForm(
                                              controller: addressController,
                                              labeltext: 'Address')),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [

                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: kDarkBlue2Color,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Center(
                                            child: DropdownButton<String>(
                                              value: cubit.dropDownValue,
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: kGold1Color,
                                              ),
                                              iconSize: 24,
                                              elevation: 40,
                                              underline: Container(),
                                              hint: Text(
                                                'Choose Religion',
                                                style: TextStyle(
                                                    color: kDarkBlue2Color,
                                                    fontSize: 16),
                                              ),
                                              onChanged: (newValue) {
                                                cubit.changeDropDownButton(
                                                    newValue!);
                                              },
                                              items: cubit.ReligionItems,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: w / 30,
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: kDarkBlue2Color,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Center(
                                            child: DropdownButton<String>(
                                              value: cubit.gender,

                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: kGold1Color,
                                              ),
                                              iconSize: 24,
                                              elevation: 40,

                                              underline: Container(),

                                              hint: Text(
                                                'Choose Gender',
                                                style: TextStyle(
                                                    color: kDarkBlue2Color,
                                                    fontSize: 16),
                                              ),
                                              //  style: ,
                                              onChanged: (ng) {
                                                cubit
                                                    .changeReligionDropDownButton(
                                                        ng!);
                                              },

                                              items: cubit.GenderItems,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: w/30,),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: kDarkBlue2Color,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(40),
                                          ),
                                          child: Center(
                                            child: DropdownButton<String>(
                                              value: cubit.grade,

                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: kGold1Color,
                                              ),
                                              iconSize: 24,
                                              elevation: 40,

                                              underline: Container(),

                                              hint: Text(
                                                'Choose Grade',
                                                style: TextStyle(
                                                    color: kDarkBlue2Color,
                                                    fontSize: 16),
                                              ),
                                              //  style: ,
                                              onChanged: (gr) {
                                                cubit
                                                    .changeGradeDropDownButton(
                                                    gr!);
                                              },

                                              items: cubit.GradeItems,
                                            ),
                                          ),
                                        ),
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
                                              controller: FatherController,
                                              labeltext: 'Father\'s Name')),
                                      SizedBox(
                                        width: w / 30,
                                      ),
                                      Expanded(
                                          child: buildSForm(
                                              controller: fatherPhoneController,
                                              labeltext:
                                                  'Father\'s Phone Number')),

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
                                              labeltext:
                                                  'First Mother\'s Name')),
                                      SizedBox(
                                        width: w / 30,
                                      ),
                                      Expanded(
                                          child: buildSForm(
                                              controller: LmotherController,
                                              labeltext:
                                                  'Last Mother\'s Name')),
                                      SizedBox(
                                        width: w / 30,
                                      ),
                                      Expanded(
                                          child: buildSForm(
                                              controller: motherPhoneController,
                                              labeltext:
                                                  'Mother\'s Phone Number')),
                                     
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: buildSForm(
                                              controller: detailsController,
                                              labeltext: 'Details')),
                                      SizedBox(
                                        width: w / 30,
                                      ),

                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 2.0,
                                              color: kDarkBlue2Color,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(40),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text("${selectedDate.toLocal()}"
                                                  .split(' ')[0]),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.white,
                                                  foregroundColor: kGold1Color,
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: Colors.white),
                                                  elevation: 0,
                                                ),
                                                onPressed: () =>
                                                    _selectDate(context),
                                                child: const Text(
                                                  'Select date of birth',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),



                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: YN
                                            .map((t) => Container(
                                              width: w / 7,
                                              child: CheckboxListTile(
                                                checkColor: Colors.white,
                                                activeColor:
                                                kDarkBlue2Color,
                                                title: Text(
                                                  t,
                                                  style: TextStyle(
                                                    color: kGold1Color,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                value: _isChecked,
                                                onChanged: (val) {
                                                  setState(() {
                                                    _isChecked = val!;
                                                    if (val == true) {
                                                      _currText = t;
                                                    }
                                                  });
                                                },
                                              ),
                                            ))
                                            .toList(),
                                      ),
                                      SizedBox(
                                        width: w / 30,
                                      ),

                                      Expanded(
                                        child: Visibility(
                                          visible: _isChecked,
                                          child: buildSForm(

                                            labeltext: 'Enter father\'s name',
                                            controller: havekidsController,


                                          ),

                                        ),
                                      ),


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
                                  onPressed: () {
                                    RegisterCubit.get(context).StudentRegister(
                                      first_name: FnameController.text,
                                      father_name: FnameController.text,
                                      last_name: LnameController.text,
                                      father_phone: fatherPhoneController.text,
                                      first_mother_name: FmotherController.text,
                                      last_mother_name: LmotherController.text,
                                      mother_phone: motherPhoneController,
                                      address: addressController.text,
                                      detailes: detailsController.text,
                                      religion: religionController.text,
                                      gender: genderController.text,
                                      grade_number: gradeController.text,
                                      have_sib: havekidsController.text,
                                    );
                                  })
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

