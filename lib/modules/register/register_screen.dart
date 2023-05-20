import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/register/register_cubit.dart';
import '../../layout/homescreen/homescreen.dart';
import '../../shared/components/components.dart';
import '../../styles/colors.dart';
class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var selectReligion='Reeligion';
  
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
  List<String> YN=['Have siblings??'];

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
                                              controller: detailsController,
                                              labeltext: 'Details')),
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


                                      SizedBox(
                                        width: w / 30,
                                      ),


                                      Expanded(
                                          child: Column(
                                            children: YN
                                                .map((t) => Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 2.0,
                                                  color: kDarkBlue2Color,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(40),
                                              ),

                                                  child: CheckboxListTile(
                                              title: Text(t,style: TextStyle(
                                                color: kGold1Color,
                                                fontSize: 18,

                                              ),),

                                              value: _isChecked,
                                              onChanged: ( val) {
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
                                          )),


                                      SizedBox(
                                        width: w / 30,
                                      ),
                                      // Expanded(
                                      //   child:DropdownButton(
                                      //     items: ['Muslim','Christian']
                                      //         .map((e) => DropdownMenuItem(child: Text('$e'),
                                      //       value: e ,
                                      //     ),
                                      //     ).toList(),
                                      //     onChanged: (v){
                                      //       setState(() {
                                      //        this.selectReligion= v.toString();
                                      //       });
                                      //
                                      //
                                      //     },
                                      //     value:selectReligion,
                                      //   ),
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



// if (selectedreligion != null && selectedIcon != null)
//   Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       Text(
//           'You selected a ${selectedreligion?.label} ${selectedIcon?.label}'),
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 5),
//         child: Icon(
//           selectedIcon?.icon,
//           color: selectedreligion?.color,
//         ),
//       )
//     ],
//   )
// else
//   const Text('Please select a color and an icon.')




