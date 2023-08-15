import 'package:e_school/modules/teacher/profie_teacher/cubit/profile_teacher_cubit.dart';
import 'package:e_school/shared/components/circle.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileTeacher extends StatelessWidget {
  ProfileTeacher({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProfileTeacherCubit()..getTeacherProfile(),
      child: BlocConsumer<ProfileTeacherCubit, ProfileTeacherState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ProfileTeacherCubit.get(context);
            double h=MediaQuery.of(context).size.height;
            List item = [
              {
                "desc": "E-Mail :",
                "text": "${cubit.profileTeacher?.data?.email}",
              },
              {
                "desc": "Classrooms :",
                "text": "${cubit.profileTeacher?.data?.classrooms}",
              },
              {
                "desc": "Address :",
                "text": "${cubit.profileTeacher?.data?.address}",
              },
              {
                "desc": "Subject",
                "text": "${cubit.profileTeacher?.data?.subjectName}",
              },
              {
                "desc": "Phone Number",
                "text": "${cubit.profileTeacher?.data?.phoneNumber}",
              },

            ];
            return Scaffold(
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/BackgroundT.jpg',),
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
                                        color: Colors.teal.withOpacity(0.3),
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
                                            ' ${cubit.profileTeacher?.data?.firstName}  ${cubit.profileTeacher?.data?.lastName}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.teal,
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
                                                color: Colors.teal.withOpacity(0.7),
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
                          MyCircle(color: Colors.teal),
                          Text('Email : ${cubit.profileTeacher?.data?.email}',
                            style:TextStyle(color: Colors.teal,fontSize: 17),),
                        ],
                      ),
                      MyLine(lineColor: Colors.teal.withOpacity(0.5),),
                      Row(
                        children: [
                          MyCircle(color: Colors.teal),
                          Text('Details : ${cubit.profileTeacher?.data?.details}',
                            style:TextStyle(color: Colors.teal,fontSize: 17),),
                        ],
                      ),
                      MyLine(lineColor: Colors.teal.withOpacity(0.5),),
                      Row(
                        children: [
                          MyCircle(color: Colors.teal),
                          Text('Address : ${cubit.profileTeacher?.data?.address}',
                            style:TextStyle(color: Colors.teal,fontSize: 17),),
                        ],
                      ),
                      MyLine(lineColor: Colors.teal.withOpacity(0.5),),
                      Row(
                        children: [
                          MyCircle(color: Colors.teal),
                          Text('Phone Number : ${cubit.profileTeacher?.data?.phoneNumber}',
                            style:TextStyle(color: Colors.teal,fontSize: 17),),
                        ],
                      ),
                      MyLine(lineColor: Colors.teal.withOpacity(0.5),),
                      Row(
                        children: [
                          MyCircle(color: Colors.teal),
                          Text('Classroom : ${cubit.profileTeacher?.data?.classrooms}',
                            style:TextStyle(color: Colors.teal,fontSize: 17),),
                        ],
                      ),
                      MyLine(lineColor: Colors.teal.withOpacity(0.5),),
                      Row(
                        children: [
                          MyCircle(color: Colors.teal),
                          Text('Subject : ${cubit.profileTeacher?.data?.subjectName}',
                            style:TextStyle(color: Colors.teal,fontSize: 17),),
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


