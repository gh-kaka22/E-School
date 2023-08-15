import 'package:e_school/modules/profile/cubit/profile_cubit.dart';
import 'package:e_school/modules/profile/cubit/profile_states.dart';
import 'package:e_school/shared/components/circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/colors.dart';

class ProfileStudent extends StatelessWidget {
  ProfileStudent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProfileCubit()..getProfileData(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ProfileCubit.get(context);
            double h=MediaQuery.of(context).size.height;
            List item = [
              {
                "desc": "E-Mail :",
                "text": "${cubit.profileModel?.data?.email}",
              },
              {
                "desc": "Grade :",
                "text": "${cubit.profileModel?.data?.grade_id}",
              },
              {
                "desc": "Classroom :",
                "text": "${cubit.profileModel?.data?.classroom}",
              },
              {
                "desc": "Date of Birth :",
                "text": "${cubit.profileModel?.data?.date_of_birth}",
              },
              {
                "desc": "Father Name :",
                "text": "${cubit.profileModel?.data?.father_first_name}",
              },
              {
                "desc": "Mother Name :",
                "text": "${cubit.profileModel?.data?.mother_first_name}",
              },
              {
                "desc": "Religion :",
                "text": "${cubit.profileModel?.data?.religion}",
              },
              {
                "desc": "Address :",
                "text": "${cubit.profileModel?.data?.address}",
              },
            ];
            return Scaffold(
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/BackgroundP.jpg',),
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.19,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(33),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Container(
                                width: double.infinity,
                                child: Row(
                                  children: <Widget>[

                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: kDarkBlue3Color.withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(20),
                                      ),

                                      child: Image.asset('assets/icons/graduating-student-b.png',
                                        alignment: Alignment.topLeft,
                                        fit: BoxFit.cover,



                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            ' ${cubit.profileModel?.data?.first_name}  ${cubit.profileModel?.data?.last_name}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: kTitleTextColor,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text(
                                              'Section: ${cubit.profileModel?.data?.classroom}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: kTitleTextColor.withOpacity(0.7),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 50,

                      ),
                     Row(
                       children: [
                         MyCircle(),
                         Text('Email : ${cubit.profileModel?.data?.email}',
                         style:TextStyle(color: kDarkBlue2Color,fontSize: 17),),
                       ],
                     ),
                      MyLine(),
                      Row(
                        children: [
                          MyCircle(),
                          Text('Details : ${cubit.profileModel?.data?.details}',
                            style:TextStyle(color: kDarkBlue2Color,fontSize: 17),),
                        ],
                      ),
                      MyLine(),
                      Row(
                        children: [
                          MyCircle(),
                          Text('Religion : ${cubit.profileModel?.data?.religion}',
                            style:TextStyle(color: kDarkBlue2Color,fontSize: 17),),
                        ],
                      ),    MyLine(),
                      Row(
                        children: [
                          MyCircle(),
                          Text('Address : ${cubit.profileModel?.data?.address}',
                            style:TextStyle(color: kDarkBlue2Color,fontSize: 17),),
                        ],
                      ),    MyLine(),
                      Row(
                        children: [
                          MyCircle(),
                          Text('Classroom : ${cubit.profileModel?.data?.classroom}',
                            style:TextStyle(color: kDarkBlue2Color,fontSize: 17),),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

//import 'package:e_school/modules/profile/cubit/profile_cubit.dart';
// import 'package:e_school/modules/profile/cubit/profile_states.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../shared/styles/colors.dart';
//
//
// class ProfileStudent extends StatelessWidget {
//
//   ProfileStudent({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(create: (BuildContext context)=>ProfileCubit()..getProfileData(),
//     child: BlocConsumer<ProfileCubit,ProfileStates>(
//         listener: (context, state){},
//       builder: (context,state){
//           var cubit = ProfileCubit.get(context);
//           List item = [
//             {
//               "desc":"E-Mail :",
//               "text": "${cubit.profileModel?.data?.email}",
//             },
//             {
//               "desc":"Grade :",
//               "text": "${cubit.profileModel?.data?.grade_id}",
//             },
//             {
//               "desc":"Classroom :",
//               "text": "${cubit.profileModel?.data?.classroom}",
//             },
//             {
//               "desc":"Date of Birth :",
//               "text": "${cubit.profileModel?.data?.date_of_birth}",
//             },
//             {
//               "desc":"Father Name :",
//               "text": "${cubit.profileModel?.data?.father_first_name}",
//             },
//             {
//               "desc":"Mother Name :",
//               "text": "${cubit.profileModel?.data?.mother_first_name}",
//             },
//             {
//               "desc":"Religion :",
//               "text": "${cubit.profileModel?.data?.religion}",
//             },
//             {
//               "desc":"Address :" ,
//               "text": "${cubit.profileModel?.data?.address}",
//             },
//           ];
//           return Scaffold(
//             body: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     height: 250,
//                     child: Stack(children: [
//                       Container(),
//                       ClipPath(
//                         clipper: Myclip(),
//                         child: Container(
//                           height: 250,
//                           color:kDarkBlue2Color,
//                         ),
//                       ),
//                       SafeArea(
//                           child: IconButton(
//                             onPressed: () {},
//                             icon: Padding(
//                               padding: const EdgeInsets.only(top: 10, left: 10),
//                               child: Icon(
//                                 Icons.arrow_back,
//                                 size: 30,
//                               ),
//                             ),
//                           )),
//                       Align(
//                         alignment: Alignment(0, 0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 top: 70,
//                               ),
//                               child: CircleAvatar(
//                                 radius: 50,
//                                 backgroundImage: AssetImage(
//                                   cubit.profileModel?.data?.gender_id == 0 ?
//                                   'assets/icons/graduating-student-g.png':
//                                   'assets/icons/graduating-student-b.png',
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               '${cubit.profileModel?.data?.first_name} ${cubit.profileModel?.data?.last_name}',
//                               style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ]),
//                   ),
//                   ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) => Card(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 25,
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(item[index]['desc'],
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w500,
//                                 color: kDarkBlue2Color,
//                               ),
//
//                             ),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             Expanded(
//                               child: Text(
//                                 item[index]['text'],
//                                 overflow: TextOverflow.ellipsis,
//
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.black,
//                                 ),
//
//
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       shadowColor: Colors.indigoAccent,
//                     ),
//                     itemCount: item.length,
//                     shrinkWrap: true,
//                     padding: EdgeInsets.all(15),
//                   )
//                 ],
//               ),
//             ),
//           );
//       },
//     ),
//     );
//   }
// }
//
// class Myclip extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height - 160);
//     path.lineTo(0, size.height);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper oldClipper) {
//     return true;
//   }
// }
