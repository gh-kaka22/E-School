import 'package:e_school/modules/parent_profile/cubit/profile_cubit.dart';
import 'package:e_school/modules/parent_profile/cubit/profile_states.dart';
import 'package:e_school/modules/profile/cubit/profile_cubit.dart';
import 'package:e_school/modules/profile/cubit/profile_states.dart';
import 'package:e_school/shared/components/circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/colors.dart';

class ParentProfileStudent extends StatelessWidget {
  ParentProfileStudent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ParentProfileCubit()..getParentProfileData(),
      child: BlocConsumer<ParentProfileCubit, ParentProfileStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ParentProfileCubit.get(context);
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
                      image: AssetImage('assets/images/Background.jpg',),
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
                                        color: kDarkBlue2Color.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(20),
                                      ),

                                      child: Image.asset('assets/icons/teacher.png',
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
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.only(left: 5),
                                            child: Text(
                                              'Section: 7A',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.black.withOpacity(0.7),
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
                         style:TextStyle(color: Colors.purple,fontSize: 17),),
                       ],
                     ),
                      MyLine(),
                      Row(
                        children: [
                          MyCircle(),
                          Text('Details : ${cubit.profileModel?.data?.details}',
                            style:TextStyle(color: Colors.purple,fontSize: 17),),
                        ],
                      ),
                      MyLine(),
                      Row(
                        children: [
                          MyCircle(),
                          Text('Religion : ${cubit.profileModel?.data?.religion}',
                            style:TextStyle(color: Colors.purple,fontSize: 17),),
                        ],
                      ),    MyLine(),
                      Row(
                        children: [
                          MyCircle(),
                          Text('Address : ${cubit.profileModel?.data?.address}',
                            style:TextStyle(color: Colors.purple,fontSize: 17),),
                        ],
                      ),    MyLine(),
                      Row(
                        children: [
                          MyCircle(),
                          Text('Classroom : ${cubit.profileModel?.data?.classroom}',
                            style:TextStyle(color: Colors.purple,fontSize: 17),),
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


