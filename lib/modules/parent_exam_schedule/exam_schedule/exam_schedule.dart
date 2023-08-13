import 'package:e_school/modules/parent_exam_schedule/exam_schedule/cubit/exam_schedule_cubit.dart';
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
      create: (BuildContext context) => ExamScheduleParentCubit()
        ..getExamScheduleParent()
        ,
      child: BlocConsumer<ExamScheduleParentCubit, ExamScheduleParentState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ExamScheduleParentCubit.get(context);
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                              color: kDarkBlue2Color,
                              border: Border.all(color: kGold1Color, width: 3),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.57),
                                    //shadow for button
                                    blurRadius: 5) //blur radius of shadow
                              ]),
                          child: Padding(
                            padding:  EdgeInsets.only(left: padding,right: padding),
                            child: DropdownButton<String>(
                              underline: const SizedBox(),
                              value: cubit.dropDownValueClass,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: kGold1Color,
                              ),
                              iconSize: 24,
                              elevation: 40,
                              hint: Text(
                                'Choose Class',
                                style: TextStyle(color: kGold1Color),
                              ),
                              style: TextStyle(color: kGold1Color, fontSize: 16),
                              onChanged: (newValue) {
                                cubit.changeClassDropDownButton(newValue!);
                              },
                              items: cubit.menuItemsClass,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        // defaultButton(
                        //   onPressed: ()   {
                        //     cubit
                        //         .getExamScheduleByGrade(cubit.dropDownValueType);
                        //   },
                        //   height: 30,
                        //   text: 'Refresh',
                        //   fontsize: 15,
                        //   fontWeight: FontWeight.w300,
                        //   buttColor: Colors.green,
                        // ),
                        // Expanded(
                        //   child: DecoratedBox(
                        //     decoration: BoxDecoration(
                        //         color: kDarkBlue2Color,
                        //         border: Border.all(color: kGold1Color, width: 3),
                        //         borderRadius: BorderRadius.circular(50),
                        //         boxShadow: <BoxShadow>[
                        //           BoxShadow(
                        //               color: Color.fromRGBO(0, 0, 0, 0.57),
                        //               //shadow for button
                        //               blurRadius: 5) //blur radius of shadow
                        //         ]),
                        //     child: Padding(
                        //       padding:
                        //       EdgeInsets.only(left: padding, right: padding),
                        //       child: DropdownButton<dynamic>(
                        //         underline: const SizedBox(),
                        //         value: cubit.dropDownValueType,
                        //         icon: Icon(
                        //           Icons.keyboard_arrow_down,
                        //           color: kGold1Color,
                        //         ),
                        //         iconSize: 24,
                        //         elevation: 40,
                        //         hint: Text(
                        //           'Choose Type',
                        //           style: TextStyle(color: kGold1Color),
                        //         ),
                        //         style:
                        //         TextStyle(color: kGold1Color, fontSize: 16),
                        //         onChanged: (newValue) {
                        //           cubit.changeTypeDropDownButton(newValue!);
                        //         },
                        //         items: cubit.menuItemsType,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: w,
                      height: 50,
                      decoration: BoxDecoration(
                          color: kWhiteColor,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.2),
                                blurRadius: 20) //blur radius of shadow
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [

                            Expanded(
                                child: Center(
                                  child: Text(
                                     'Type',
                                  ),
                                )),
                            Expanded(
                                child: Center(
                                  child: Text(
                                    'Grade',
                                  ),
                                )),
                            Expanded(
                              child: Center(child: Text('School Year')),
                            ),
                            Expanded(
                                child: Center(
                                  child: Text(
                                     'Show',
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    ShowExamScheduleBuilder(
                      w,
                      cubit.showExamScheduleModel?.data,
                      context,
                      state,
                    )
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
