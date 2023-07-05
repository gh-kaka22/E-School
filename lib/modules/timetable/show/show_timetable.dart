import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';

import 'package:untitled/modules/timetable/show/cubit/show_timetable_cubit.dart';
import 'package:untitled/modules/timetable/show/cubit/show_timetable_states.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';

import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/styles/colors.dart';

class TimetableShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => ShowTimetableCubit()..getClassrooms(7),
      child: BlocConsumer<ShowTimetableCubit, ShowTimetableStates>(
        listener: (context, state) {
          if (state is ShowTimetableSuccessState) {
            if(state.showTimetableModel.status == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content:
                  Center(
                    child: Text(
                        '${state.showTimetableModel.message}',
                        style: TextStyle(color: Colors.white)),
                  )));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                    child: Text(
                      '${state.showTimetableModel.message}',
                      style: TextStyle(color: Colors.white),
                    ),
                  )));

            }}
        },
        builder: (context, state) {
          var cubit = ShowTimetableCubit.get(context);
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
                  state is ShowTimetableSuccessState ?
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
                          SizedBox(
                            height:50.0,
                            child: Row(
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
                                      child: Text('${cubit.showTimetableModel?.data.firstSubject}'),
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
                                          style: TextStyle(overflow: TextOverflow.ellipsis)),
                                    )),
                                Expanded(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: kWhiteColor,
                                    ),
                                    child: Center(
                                      child:Text('${cubit.showTimetableModel?.data.secondSubject}'),
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
                                          style: TextStyle(overflow: TextOverflow.ellipsis)),
                                    )),
                                Expanded(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: kWhiteColor,
                                    ),
                                    child: Center(
                                      child: Text('${cubit.showTimetableModel?.data.thirdSubject}'),
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
                                          style: TextStyle(overflow: TextOverflow.ellipsis)),
                                    )),
                                Expanded(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: kWhiteColor,
                                    ),
                                    child: Center(
                                      child: Text('${cubit.showTimetableModel?.data.fourthSubject}'),
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
                                          style: TextStyle(overflow: TextOverflow.ellipsis)),
                                    )),
                                Expanded(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: kWhiteColor,
                                    ),
                                    child: Center(
                                      child: Text('${cubit.showTimetableModel?.data.fifthSubject}'),
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
                                          style: TextStyle(overflow: TextOverflow.ellipsis)),
                                    )),
                                Expanded(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: kWhiteColor,
                                    ),
                                    child: Center(
                                      child: Text('${cubit.showTimetableModel?.data.sixthSubject}'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MyDivider(),
                          cubit.dropDownValueDay == '5' ?
                               SizedBox(
                            height: 40.0,
                                child: Row(
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
                                      child: Text('${cubit.showTimetableModel?.data.seventhSubject}'),
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
                  ) :
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 30,
                  ),
                  ConditionalBuilder(
                      condition: state != ShowTimetableLoadingState,
                      builder: (context)=> defaultButton(
                          text: 'Show',
                          width: w / 5,
                          height: h / 20,
                          onPressed: () {
                            cubit.ShowTimetable(
                                roomNumber: cubit.dropDownValueSection,
                                grade_id: cubit.dropDownValueClass,
                                day_id: cubit.dropDownValueDay,
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
