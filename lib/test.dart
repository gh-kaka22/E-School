import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/attendance/show/cubit/show_attendance_state.dart';
import 'package:untitled/shared/components/attendance.dart';
import 'package:untitled/shared/components/search_bar.dart';
import 'package:untitled/shared/components/show_admin.dart';
import 'package:untitled/shared/components/text_components.dart';

import 'modules/attendance/show/cubit/show_attendance_cubit.dart';
class Show extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double padding=MediaQuery.of(context).size.width/20;
    return BlocProvider(
      create: (BuildContext context) => ShowAttendanceCubit()..getAttenadnce(),
      child: BlocConsumer<ShowAttendanceCubit, ShowAttendanceStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShowAttendanceCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: h,
              width: 4 / 5 * w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  MyText(name: 'Admins'),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ASearchBar(

                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(

                    width: 4 / 5 * w,
                    height: 50,
                    decoration: BoxDecoration(
                        color:  Colors.white ,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                              blurRadius: 20) //blur radius of shadow
                        ]),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Center(
                                child: ShowText(name:'Id',
                                ),
                              )),
                          Expanded(
                              child: Center(
                                child: ShowText(name:'First Name',
                                ),
                              )),
                          Expanded(
                            child: Center(child: ShowText(name:'Last Name')),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: ShowAbsentBuilder(
                          w,
                          cubit.showAttendanceModel?.data,
                          context,
                          state
                      )
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
