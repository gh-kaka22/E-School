import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_school/modules/attendance/cubit/attendance_cubit.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/attendance_notes.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => AttendanceCubit()..getAbsences(),
      child: BlocConsumer<AttendanceCubit, AttendanceState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            // appBar: AppBar(
            //   title: Text('Your Absences'),
            // ),

            body: Column(

              children: [

                Stack(
                  children:[
                    Container(
                      width: w,
                      height: h/3,
                      decoration: BoxDecoration(
                        color: kDarkBlue2Color,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30),),
                      ),
                      child: Text("Absences"),
                    ),


                    Padding(
                      padding:  EdgeInsets.only(top: h/6,left: w/10,right: w/10),
                      child: Center(
                        child: Container(
                          width: w-(w/10),
                          height: h-(h/4),
                          decoration: BoxDecoration(
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.3), blurRadius: 20)
                              ]
                          ),

                          child:ShowAttendanceBuilder(
                            w,
                            h,
                            AttendanceCubit
                                .get(context)

                                .showAbsencesModel
                                ?.data,
                            context,
                            state,

                          ) ,

                        ),
                      ),
                    ),
                    Center(child: Container(
                        width: w/2,
                        height: h/5,

                        child: Center(child: Text('Absences',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.white),)))),
                  ]
                ),
              ],
            )
          );
        },
      ),
    );
  }
}
