import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/attendance/show/cubit/show_attendance_cubit.dart';
import 'package:untitled/modules/attendance/show/cubit/show_attendance_state.dart';
import 'package:untitled/shared/components/attendance.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/search_bar.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/styles/colors.dart';
class ShowAttendance extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double padding=MediaQuery.of(context).size.width/20;
    return BlocProvider(
      create: (BuildContext context) => ShowAttendanceCubit()..getStudents(),
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
                  MyText(name: 'Students'),
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
                          child: Padding(
                            padding:
                            EdgeInsets.only(left: padding, right: padding),
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
                              items: cubit.menuItems,
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
                          child: Padding(
                            padding:
                            EdgeInsets.only(left: padding, right: padding),
                            child: DropdownButton<dynamic>(
                              underline: const SizedBox(),
                              value: cubit.dropDownValueSection,
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
                                cubit.changeSectionDropDownButton(newValue!);
                              },
                              items: cubit.menuItems2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SearchBar(),
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
                          Expanded(child: Center(child: ShowText(name:'Grade'))),
                          Expanded(
                            child: Center(child: ShowText(name:'Section')),
                          ),
                          Expanded(
                              child: Center(
                                child: ShowText(name:'E-Mail',
                                ),
                              )),
                          Expanded(
                              child: Center(
                                child: ShowText(name:'Show Absences',
                                ),
                              )),

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: ShowAttendanceBuilder(
                          w,
                          cubit.showStudentsModel?.data,
                          context,
                          state,
                        cubit
                      ),
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