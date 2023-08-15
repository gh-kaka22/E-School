

import 'package:e_school/modules/exam_schedule/cubit/exam_schedule_cubit.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/components/option_card.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowExamSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double padding = MediaQuery.of(context).size.width / 15;
    double radius = 20;
    return BlocProvider(
      create: (BuildContext context) => ExamScheduleCubit()
        ..getExamSchedule()
        ,
      child: BlocConsumer<ExamScheduleCubit, ExamScheduleState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ExamScheduleCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Exam Schedule'),
              backgroundColor: kDarkBlue2Color,
            ),
            body: Padding(
              padding:  EdgeInsets.all(10.0),
              child: SizedBox(
                height: h,
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    state is ShowExamScheduleLoadingState?
                    Center(child: CircularProgressIndicator()):
                    Container(
                      width: w,
                      height: h/3,

                      child:Image(image: NetworkImage('${baseUrl}/ExamScheduleImages/${cubit.image}'),),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
