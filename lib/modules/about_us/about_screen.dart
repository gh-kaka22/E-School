import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: kDarkBlue1Color
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
                            colors: [kDarkBlue1Color, kDarkBlue2Color],
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
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Damascus-Mazzeh-Near Al-Jalaa Stadium',
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
                            colors: [kDarkBlue1Color, kDarkBlue2Color],
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
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                '+963912345678',
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
                        Expanded(
                          child: Text(
                            'Our school\'s mission is to learn leadership, the common core, and relationships for life. Our mission is to provide a safe, disciplined learning environment that empowers all students to develop their full potential. We feel strongly about helping to build leaders that have the ability to succeed in whatever endeavor they undertake. Winning is not always the measure of success. Our students understand the "Win, win" philosophy and use it in their daily life.',
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
}
