import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/register/register_cubit.dart';
import '../../layout/homescreen/homescreen.dart';
import '../../shared/components/components.dart';
import '../../styles/colors.dart';

class SchoolLoginScreen extends StatelessWidget {
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
                  width: 2,
                  height: h,
                  color: kDarkBlue2Color,
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
                          ...List.generate(
                            1,
                            (index) => buildFormStudents(w),
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
                                    RegisterCubit.get(context).StudentRegister();
                                }
                                )
                              : CircularProgressIndicator(),
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
