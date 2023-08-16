import 'package:e_school/modules/about_us/cubit/about_us_cubit.dart';
import 'package:e_school/modules/about_us/cubit/about_us_states.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AboutUsCubit()..getSchool(),
      child: BlocConsumer<AboutUsCubit,AboutUsState>(
          listener: (context,state){},
        builder: (context,state){
          var cubit = AboutUsCubit.get(context);
          return Scaffold(
              body: Column(
                children: [
                  Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: kChatBar
                            ),

                          ),
                          Center(
                            child: Column(
                              children: [
                                SizedBox(height: 50,),
                                Container(
                                  height: 100,
                                  width:300,
                                  child: Image.asset('assets/icons/E-SchoolW.png',),
                                ),
                                SizedBox(height: 40,),
                                Text(
                                  'Your success is our success.',
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 25
                                  ),

                                )
                              ],
                            ),
                          )
                        ],
                      )
                  ),
                  //SizedBox(height: 3,),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [kChatBar, kDarkBlue2Color],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.white.withOpacity(0.001),
                                      child: Image.asset(
                                        'assets/icons/location-pin.png',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 55,
                                    ),
                                    state is  AboutUsLoadingState?
                                    CircularProgressIndicator():
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        '${cubit.aboutUsModel!.data!.address}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    )
                                  ],

                                ),
                              ),
                            ],
                          ),
                        ),
                        //SizedBox(width: 3,),
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [kChatBar, kDarkBlue2Color],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  // color: kDarkBlue1Color
                                ),
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundColor: kWhiteColor,
                                      child: Image.asset(
                                        'assets/icons/telephone.png',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 65,
                                    ),
                                    state is  AboutUsLoadingState?
                                    CircularProgressIndicator():
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Text(
                                        '${cubit.aboutUsModel!.data!.phone}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Text(
                                        '0113124454',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15
                                        ),
                                      ),
                                    ),
                                  ],

                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  //SizedBox(height: 3,),
                  Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: kDarkBlue2Color
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'About Us:',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: kWhiteColor
                                      ),
                                    ),
                                    Spacer(),
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: kWhiteColor,
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/icons/Blue-Icon.jpg',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                state is  AboutUsLoadingState?
                                CircularProgressIndicator():
                                Expanded(
                                  child: Text(
                                    '${cubit.aboutUsModel!.data!.overview}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: kWhiteColor
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            );
        }
      ),
    );
  }
}
