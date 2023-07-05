import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/layout/eschool_cubit/home_cubit.dart';
import 'package:untitled/modules/exams/add/cubit/exams_add_cubit.dart';
import 'package:untitled/modules/exams/add/cubit/exams_add_states.dart';
import 'package:untitled/modules/exams/show/cubit/exams_show_cubit.dart';
import 'package:untitled/modules/exams/show/cubit/exams_show_states.dart';
import 'package:untitled/modules/students/show/cubit/show_students_cubit.dart';
import 'package:untitled/modules/students/show/cubit/show_students_states.dart';
import 'package:untitled/modules/timetable/add/cubit/add_timetable_cubit.dart';
import 'package:untitled/modules/timetable/add/cubit/add_timetable_states.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/components/search_bar.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/styles/colors.dart';

class TimetableAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => AddTimetableCubit()..getClassrooms(7)..getSubjects(),
      child: BlocConsumer<AddTimetableCubit, AddTimetableStates>(
        listener: (context, state) {
          if (state is AddTimetableSuccessState) {
            if(state.addTimetableModel.status == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content:
                  Center(
                    child: Text(
                        '${state.addTimetableModel.message}',
                        style: TextStyle(color: Colors.white)),
                  )));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                    child: Text(
                      '${state.addTimetableModel.message}',
                      style: TextStyle(color: Colors.white),
                    ),
                  )));

            }}
        },
        builder: (context, state) {
          var cubit = AddTimetableCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: h,
              width: 4 / 5 * w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(name:'Timetable'),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: DecoratedBox(
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
                          child: Center(
                            child: DropdownButton<dynamic>(
                              underline: const SizedBox(),
                              value: cubit.dropDownValueClass,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: kGold1Color,
                              ),
                              iconSize: 24,
                              elevation: 40,
                              hint: Text('Choose Class'),
                              style:
                              TextStyle(color: kGold1Color, fontSize: 16),
                              onChanged: (newValue) {
                                cubit.changeClassDropDownButton(newValue!);
                              },
                              items: cubit.menuItemsClass,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: DecoratedBox(
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
                          child: Center(
                            child: DropdownButton<dynamic>(
                              underline: const SizedBox(),
                              value: cubit.dropDownValueSection,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: kGold1Color,
                              ),
                              iconSize: 24,
                              elevation: 40,
                              hint: Text('Choose Classroom',style: TextStyle(color: kWhiteColor),),
                              style:
                              TextStyle(color: kGold1Color, fontSize: 16),
                              onChanged: (newValue) {
                                cubit.changeSectionDropDownButton(newValue!);
                              },
                              items: cubit.menuItemsSection,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: DecoratedBox(
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
                          child: Center(
                            child: DropdownButton<dynamic>(
                              underline: const SizedBox(),
                              value: cubit.dropDownValueDay,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: kGold1Color,
                              ),
                              iconSize: 24,
                              elevation: 40,
                              hint: Text('Choose Day',style: TextStyle(color: kWhiteColor),),
                              style:
                              TextStyle(color: kGold1Color, fontSize: 16),
                              onChanged: (newValue) {
                                cubit.changeDayDropDownButton(newValue!);
                              },
                              items: cubit.menuItemsDay,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 4 / 5 * w,
                    height: 350,
                    decoration: BoxDecoration(
                        color:  Colors.white ,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                              blurRadius: 20) //blur radius of shadow
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Center(
                                    child: Text('First Period:',
                                        style: TextStyle(overflow: TextOverflow.ellipsis)),
                                  )),
                              Expanded(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: kWhiteColor,
                                      ),
                                  child: Center(
                                    child: DropdownButton<dynamic>(
                                      underline: const SizedBox(),
                                      value: cubit.dropDownValueSubject1,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: kGold1Color,
                                      ),
                                      iconSize: 24,
                                      elevation: 40,
                                      hint: Text('Choose Subject'),
                                      style:
                                      TextStyle(color: kGold1Color, fontSize: 16),
                                      onChanged: (newValue) {
                                        cubit.changeSubject1DropDownButton(newValue!);
                                      },
                                      items: cubit.menuItemsSubject1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          MyDivider(),
                          Row(
                            children: [
                              Expanded(
                                  child: Center(
                                    child: Text('Second Period:',
                                        style: TextStyle(overflow: TextOverflow.ellipsis)),
                                  )),
                              Expanded(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                  ),
                                  child: Center(
                                    child: DropdownButton<dynamic>(
                                      underline: const SizedBox(),
                                      value: cubit.dropDownValueSubject2,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: kGold1Color,
                                      ),
                                      iconSize: 24,
                                      elevation: 40,
                                      hint: Text('Choose Subject'),
                                      style:
                                      TextStyle(color: kGold1Color, fontSize: 16),
                                      onChanged: (newValue) {
                                        cubit.changeSubject2DropDownButton(newValue!);
                                      },
                                      items: cubit.menuItemsSubject2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          MyDivider(),
                          Row(
                            children: [
                              Expanded(
                                  child: Center(
                                    child: Text('Third Period:',
                                        style: TextStyle(overflow: TextOverflow.ellipsis)),
                                  )),
                              Expanded(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                  ),
                                  child: Center(
                                    child: DropdownButton<dynamic>(
                                      underline: const SizedBox(),
                                      value: cubit.dropDownValueSubject3,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: kGold1Color,
                                      ),
                                      iconSize: 24,
                                      elevation: 40,
                                      hint: Text('Choose Subject'),
                                      style:
                                      TextStyle(color: kGold1Color, fontSize: 16),
                                      onChanged: (newValue) {
                                        cubit.changeSubject3DropDownButton(newValue!);
                                      },
                                      items: cubit.menuItemsSubject3,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          MyDivider(),
                          Row(
                            children: [
                              Expanded(
                                  child: Center(
                                    child: Text('Fourth Period:',
                                        style: TextStyle(overflow: TextOverflow.ellipsis)),
                                  )),
                              Expanded(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                  ),
                                  child: Center(
                                    child: DropdownButton<dynamic>(
                                      underline: const SizedBox(),
                                      value: cubit.dropDownValueSubject4,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: kGold1Color,
                                      ),
                                      iconSize: 24,
                                      elevation: 40,
                                      hint: Text('Choose Subject'),
                                      style:
                                      TextStyle(color: kGold1Color, fontSize: 16),
                                      onChanged: (newValue) {
                                        cubit.changeSubject4DropDownButton(newValue!);
                                      },
                                      items: cubit.menuItemsSubject4,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          MyDivider(),
                          Row(
                            children: [
                              Expanded(
                                  child: Center(
                                    child: Text('Fifth Period:',
                                        style: TextStyle(overflow: TextOverflow.ellipsis)),
                                  )),
                              Expanded(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                  ),
                                  child: Center(
                                    child: DropdownButton<dynamic>(
                                      underline: const SizedBox(),
                                      value: cubit.dropDownValueSubject5,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: kGold1Color,
                                      ),
                                      iconSize: 24,
                                      elevation: 40,
                                      hint: Text('Choose Subject'),
                                      style:
                                      TextStyle(color: kGold1Color, fontSize: 16),
                                      onChanged: (newValue) {
                                        cubit.changeSubject5DropDownButton(newValue!);
                                      },
                                      items: cubit.menuItemsSubject5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          MyDivider(),
                          Row(
                            children: [
                              Expanded(
                                  child: Center(
                                    child: Text('Sixth Period:',
                                        style: TextStyle(overflow: TextOverflow.ellipsis)),
                                  )),
                              Expanded(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                  ),
                                  child: Center(
                                    child: DropdownButton<dynamic>(
                                      underline: const SizedBox(),
                                      value: cubit.dropDownValueSubject6,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: kGold1Color,
                                      ),
                                      iconSize: 24,
                                      elevation: 40,
                                      hint: Text('Choose Subject'),
                                      style:
                                      TextStyle(color: kGold1Color, fontSize: 16),
                                      onChanged: (newValue) {
                                        cubit.changeSubject6DropDownButton(newValue!);
                                      },
                                      items: cubit.menuItemsSubject6,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          MyDivider(),
                          cubit.dropDownValueDay == '5'
                              ? Row(
                            children: [
                              Expanded(
                                  child: Center(
                                    child: Text('Seventh Period:',
                                        style: TextStyle(overflow: TextOverflow.ellipsis)),
                                  )),
                              Expanded(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                  ),
                                  child: Center(
                                    child: DropdownButton<dynamic>(
                                      underline: const SizedBox(),
                                      value: cubit.dropDownValueSubject7,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: kGold1Color,
                                      ),
                                      iconSize: 24,
                                      elevation: 40,
                                      hint: Text('Choose Subject'),
                                      style:
                                      TextStyle(color: kGold1Color, fontSize: 16),
                                      onChanged: (newValue) {
                                        cubit.changeSubject7DropDownButton(newValue!);
                                      },
                                      items: cubit.menuItemsSubject7,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ConditionalBuilder(
                      condition: state != AddTimetableLoadingState,
                      builder: (context)=> defaultButton(
                          text: 'Add',
                          width: w / 5,
                          height: h / 20,
                          onPressed: () {
                            cubit.AddTimetable(
                                roomNumber: cubit.dropDownValueSection,
                                grade_id: cubit.dropDownValueClass,
                                day_id: cubit.dropDownValueDay,
                                first: cubit.dropDownValueSubject1,
                                second: cubit.dropDownValueSubject2,
                                third: cubit.dropDownValueSubject3,
                                fourth: cubit.dropDownValueSubject4,
                                fifth: cubit.dropDownValueSubject5,
                                sixth: cubit.dropDownValueSubject6,
                                seventh: cubit.dropDownValueDay == '5' ? cubit.dropDownValueSubject7 : 1,
                                token: token
                            );

                          }),
                      fallback: (context)=>CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
