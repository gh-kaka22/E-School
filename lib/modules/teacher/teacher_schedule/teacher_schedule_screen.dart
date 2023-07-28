import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_school/modules/teacher/teacher_schedule/cubit/schedule_cubit.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';

class TeacherSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (BuildContext context) => ScheduleCubit(),
      child: BlocConsumer<ScheduleCubit, ScheduleState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ScheduleCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Timetable'),
            ),
            body: Column(
              children: [
                Container(
                  height: h / 10,
                  decoration: BoxDecoration(
                      color: kDarkBlue2Color,
                      border: Border.all(color: kGold1Color, width: 3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.57),
                            //shadow for button
                            blurRadius: 5) //blur radius of shadow
                      ]),
                  child: Center(
                    child: DropdownButton<dynamic>(
                      underline: Container(),
                      value: cubit.dropDownValueDay,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: kGold1Color,
                      ),
                      iconSize: 24,
                      elevation: 40,
                      hint: Text(
                        'Choose Day',
                        style: TextStyle(color: kWhiteColor),
                      ),
                      style: TextStyle(color: kDarkBlue2Color, fontSize: 16),
                      onChanged: (newValue) {
                       cubit.changeDayDropDownButton(newValue!);
                        cubit.getSchedule(cubit.dropDownValueDay);
                      },
                      items: cubit.menuItemsDay,
                    ),
                  ),
                ),
                SizedBox(
                  height: h / 10,
                ),
                state is ScheduleSuccessState
                    ? SizedBox(
                        // height: h,
                        // width: w,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 4 / 5 * w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.2),
                                          blurRadius:
                                              20) //blur radius of shadow
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: kDarkBlue2Color,
                                          border: Border.all(
                                              color: kGold1Color, width: 3),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Center(
                                              child: Text('Period',
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: kDarkWhiteColor)),
                                            )),
                                            Expanded(
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: kDarkBlue2Color,
                                                ),
                                                child: Center(
                                                  child: Text('Section',
                                                      style: TextStyle(
                                                          color:
                                                              kDarkWhiteColor)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      MyDivider(),
                                      SizedBox(
                                        height: 50.0,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Center(
                                              child: Text('First Period:',
                                                  style: TextStyle(
                                                      overflow: TextOverflow
                                                          .ellipsis)),
                                            )),
                                            Expanded(
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: kWhiteColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                      '${cubit.teachercShedule?.data?.firstPeriod}'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      MyDivider(),
                                      SizedBox(
                                        height: 50.0,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Center(
                                              child: Text('Second Period:',
                                                  style: TextStyle(
                                                      overflow: TextOverflow
                                                          .ellipsis)),
                                            )),
                                            Expanded(
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: kWhiteColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                      '${cubit.teachercShedule?.data?.secondPeriod}'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      MyDivider(),
                                      SizedBox(
                                        height: 50.0,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Center(
                                              child: Text('Third Period:',
                                                  style: TextStyle(
                                                      overflow: TextOverflow
                                                          .ellipsis)),
                                            )),
                                            Expanded(
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: kWhiteColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                      '${cubit.teachercShedule?.data?.thirdPeriod}'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      MyDivider(),
                                      SizedBox(
                                        height: 50.0,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Center(
                                              child: Text('Fourth Period:',
                                                  style: TextStyle(
                                                      overflow: TextOverflow
                                                          .ellipsis)),
                                            )),
                                            Expanded(
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: kWhiteColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                      '${cubit.teachercShedule?.data?.forthPeriod}'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      MyDivider(),
                                      SizedBox(
                                        height: 50.0,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Center(
                                              child: Text('Fifth Period:',
                                                  style: TextStyle(
                                                      overflow: TextOverflow
                                                          .ellipsis)),
                                            )),
                                            Expanded(
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: kWhiteColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                      '${cubit.teachercShedule?.data?.fifthPeriod}'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      MyDivider(),
                                      SizedBox(
                                        height: 50.0,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Center(
                                              child: Text('Sixth Period:',
                                                  style: TextStyle(
                                                      overflow: TextOverflow
                                                          .ellipsis)),
                                            )),
                                            Expanded(
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: kWhiteColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                      '${cubit.teachercShedule?.data?.sixthPeriod}'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      MyDivider(),
                                      cubit.dropDownValueDay == '5'
                                          ? SizedBox(
                                              height: 40.0,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      child: Center(
                                                    child: Text(
                                                        'Seventh Period:',
                                                        style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis)),
                                                  )),
                                                  Expanded(
                                                    child: DecoratedBox(
                                                      decoration: BoxDecoration(
                                                        color: kWhiteColor,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                            '${cubit.teachercShedule?.data?.seventhPeriod}'),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Center(
                        child: Container(
                        child: Text(
                          '',
                          style: TextStyle(
                            color: kDarkBlue2Color,
                            fontSize: 20,
                          ),
                        ),
                      )),
                SizedBox(
                  height: h / 10,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
