import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_school/layout/home_layout/home_layout.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class SchoolLoginScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;


    return BlocProvider(
        create: (BuildContext context) => SchoolLoginCubit(),
        child: BlocConsumer<SchoolLoginCubit, SchoolLoginStates>(
          listener: (context, state) {
            if (state is SchoolLoginSuccessState) {
              if (state.loginModel.status == true) {
                print(state.loginModel.message);
                showToast(
                    text: state.loginModel.message,
                    state: ToastStates.SUCCESS
                );
                CacheHelper.saveData(key: 'token', value: state.loginModel.data?.token).then((value) {
                  print(state.loginModel.data?.token);
                  token= state.loginModel.data?.token;
                  navigateAndFinish(context, HomeLayout());
                });

              } else {
                print(state.loginModel.message);
                showToast(
                    text: state.loginModel.message,
                    state: ToastStates.ERROR
                );
              }
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: kDarkBlue2Color,
              body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SizedBox(
                  height: height,
                  child: Stack(
                    children: [
                      Container(
                        height: height / 2.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(250),
                            bottomRight: Radius.circular(250),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 120.0,
                            ),
                            SizedBox(
                              height: 100,
                              child: Image.asset('assets/icons/E-School.png'),
                            ),
                            SizedBox(
                              height: 70.0,
                            ),
                            Text(
                              'Login now to browse our features...',
                              style:
                              Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: SizedBox(
                          height: height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: height / 2.06,
                                margin: EdgeInsets.all(40),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 30
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(32),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 10.0,
                                      spreadRadius: 5.0,
                                      offset: Offset(0.0,0.0)
                                    ),
                                  ]
                                ),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          'LOGIN',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              ?.copyWith(color: kDarkBlue1Color),
                                        ),
                                      SizedBox(
                                        height: 30.0,
                                      ),
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
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      defaultFormField(
                                        controller: passwordController,
                                        type: TextInputType.visiblePassword,
                                        validate: (value) {
                                          if (value.isEmpty)
                                            return 'Password is too short';
                                        },
                                        label: 'Password',
                                        prefix: Icons.lock_outline,
                                        isPassword: SchoolLoginCubit.get(context).isPassword,
                                        suffix: SchoolLoginCubit.get(context).suffix,
                                        suffixPressed: () {
                                          SchoolLoginCubit.get(context).changePasswordVisibility();
                                        },
                                        onSubmit: (value) {
                                          if (formKey.currentState!.validate()) {
                                            SchoolLoginCubit.get(context).userLogin(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text);
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 40.0,
                                      ),
                                      ConditionalBuilder(
                                        condition: state is! SchoolLoginLoadingState,
                                        builder: (context) => Container(
                                          width: double.infinity,
                                          child: MaterialButton(
                                            onPressed: () {
                                              if (formKey.currentState!.validate())
                                              {
                                                SchoolLoginCubit.get(context).userLogin(
                                                        email:
                                                            emailController.text,
                                                        password:
                                                            passwordController.text
                                                );
                                              }
                                            },
                                            child: Text(
                                              'LOGIN',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            color: kDarkBlue1Color,
                                          ),
                                        ),
                                        fallback: (context) => Center(
                                            child: CircularProgressIndicator()),
                                      ),
                                    ],
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
              ),
            );
          },
        ));
  }
}
