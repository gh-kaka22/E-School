import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/styles/colors.dart';
import '../students/register/register_screen.dart';
import 'cubit/login_owner_cubit.dart';
import 'cubit/login_owner_state.dart';

class OwnerLogin extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => OwnerLoginCubit(),
      child: BlocConsumer<OwnerLoginCubit, OwnerLoginStates>(
        listener: (context, state) {
          if (state is OwnerLoginSuccessState) {
            if (state.owner.status == true) {
              print(state.owner.status);
              print( '${state.owner.data!.accessToken}');
              Fluttertoast.showToast(
                msg: '$state.adminModel.message',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16,
              );

            } else {
              print(state.owner.message);
              Fluttertoast.showToast(
                msg: '$state.adminModel.message',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: kDarkBlue2Color,
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Background.jpg'),
                        fit: BoxFit.cover,
                      )
                  ),
                ),
                Container(
                  color: kDarkBlue2Color.withOpacity(0.8),


                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(40),
                    width: w / 3.5,
                    height: h - (h / 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/E-School.png'),
                          SizedBox(
                            height: 20,
                          ),
                          Form(
                            key: formkey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                defaultFormField(
                                  controller: emailController,
                                  type: TextInputType.emailAddress,
                                  validate: (value) {
                                    if (value.isEmpty)
                                      return 'Please Enter Email Address';
                                  },
                                  label: 'Email Address',
                                  prefix: Icons.email_outlined,
                                ),
                                SizedBox(height: h / 20),
                                defaultFormField(
                                  controller: passwordController,
                                  type: TextInputType.visiblePassword,
                                  validate: (value) {
                                    if (value.isEmpty)
                                      return 'Password is too short';
                                  },
                                  label: 'Password',
                                  prefix: Icons.lock_outline,
                                  suffix: Icons.visibility,
                                  isPassword:
                                  OwnerLoginCubit.get(context).ispassword,
                                  suffixPressed: () {
                                    OwnerLoginCubit.get(context)
                                        .changepasswordvisibility();
                                  },
                                  onSubmit: (value) {
                                    if (formkey.currentState!.validate()) {
                                      OwnerLoginCubit.get(context).ownerLogin(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }
                                  },
                                ),
                                SizedBox(height: h / 20),
                                state is! OwnerLoginLoadingState
                                    ? defaultButton(
                                  onPressed: () {
                                    if (formkey.currentState!
                                        .validate()) {
                                      OwnerLoginCubit.get(context)
                                          .ownerLogin(
                                          email: emailController.text,
                                          password: passwordController
                                              .text);
                                      // navigateTo(context,
                                      //     StudentRegisterScreen());
                                    }
                                  },
                                  text: 'LogIn',
                                  width: w / 5,
                                  height: h / 20,
                                )
                                    : Center(
                                    child: CircularProgressIndicator()),
                              ],
                            ),
                          ),
                        ],
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
