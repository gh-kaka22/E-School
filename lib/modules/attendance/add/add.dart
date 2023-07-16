import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/attendance/add/cubit/attendance_cubit.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/search_bar.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/styles/colors.dart';

class AddAttendance extends StatelessWidget {
  const AddAttendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double padding=MediaQuery.of(context).size.width/20;
    return BlocProvider(
      create: (context) => AttendanceCubit()..getStudents(),
      child: BlocConsumer<AttendanceCubit, AttendanceState>(
        listener: (context, state) {
          if (state is AttendanceSuccessState) {
            if (state.attendanceModel.status ?? true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content: Center(
                    child: Text('${state.attendanceModel.message}',
                        style: TextStyle(color: Colors.white)),
                  )));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                    child: Text(
                      '${state.attendanceModel.message}',
                      style: TextStyle(color: Colors.white),
                    ),
                  )));
            }
          }
        },
        builder: (context, state) {
          var cubit = AttendanceCubit.get(context);
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
                  MyText(name: 'Attendance'),
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
                              hint: Text('Choose Class',style: TextStyle(color: kGold1Color),),
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
                              hint: Text('Choose Class',style: TextStyle(color: kGold1Color),),
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
                            child: defaultButton(
                              onPressed: () {
                                cubit.getStudentsByGrade(cubit.dropDownValueClass);
                              },
                              height: 30,
                              text: 'Refresh',
                              fontsize: 15,
                              fontWeight: FontWeight.w300,
                              buttColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: AddAttendanceBuilder(
                          w,
                          cubit.addExamsModel?.data,
                          cubit.selectedDate,
                          cubit.checkbox,
                          cubit.idStudents,
                          context,
                          state
                      )
                  )
                ],
              ),
            ),
          );
          //   Column(
          //   children: [
          //     SizedBox(
          //       height: h / 25,
          //     ),
          //     MyText(name: 'Attendance:'),
          //     SizedBox(
          //       height: h / 20,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 30),
          //       child: Row(
          //         children: [
          //           Expanded(
          //             child: DecoratedBox(
          //               decoration: BoxDecoration(
          //                   color: Colors.white70,
          //                   border:
          //                       Border.all(color: kDarkBlue2Color, width: 3),
          //                   borderRadius: BorderRadius.circular(50),
          //                   boxShadow: <BoxShadow>[
          //                     BoxShadow(
          //                         color: Color.fromRGBO(0, 0, 0, 0.2),
          //                         //shadow for button
          //                         blurRadius: 5) //blur radius of shadow
          //                   ]),
          //               child: DropdownButton<dynamic>(
          //                 underline: const SizedBox(),
          //                 value: cubit.dropDownValueClass,
          //                 icon: Icon(
          //                   Icons.keyboard_arrow_down,
          //                   color: kGold1Color,
          //                 ),
          //                 iconSize: 24,
          //                 elevation: 40,
          //                 borderRadius: BorderRadius.circular(50),
          //                 hint: Text('     Choose Class'),
          //                 style: TextStyle(color: kGold1Color, fontSize: 16),
          //                 onChanged: (newValue) {
          //                   cubit.changeClassDropDownButton(newValue!);
          //                 },
          //                 items: cubit.menuItemsClass,
          //               ),
          //             ),
          //           ),
          //           SizedBox(
          //             width: 20,
          //           ),
          //           Expanded(
          //             child: ElevatedButton(
          //               style: ElevatedButton.styleFrom(
          //                 backgroundColor: Colors.white,
          //                 foregroundColor: kGold1Color,
          //                 side: BorderSide(width: 1, color: Colors.white),
          //                 elevation: 0,
          //               ),
          //               onPressed: () => cubit.selectDate(context),
          //               child: const Text(
          //                 'Select date ',
          //                 style: TextStyle(
          //                   fontWeight: FontWeight.w400,
          //                 ),
          //               ),
          //             ),
          //           ),
          //           SizedBox(
          //             width: 20,
          //           ),
          //           Expanded(
          //             child: DecoratedBox(
          //               decoration: BoxDecoration(
          //                   color: Colors.white70,
          //                   border:
          //                       Border.all(color: kDarkBlue2Color, width: 3),
          //                   borderRadius: BorderRadius.circular(50),
          //                   boxShadow: <BoxShadow>[
          //                     BoxShadow(
          //                         color: Color.fromRGBO(0, 0, 0, 0.2),
          //                         //shadow for button
          //                         blurRadius: 5) //blur radius of shadow
          //                   ]),
          //               child: DropdownButton<dynamic>(
          //                 underline: const SizedBox(),
          //                 value: cubit.dropDownValueSection,
          //                 icon: Icon(
          //                   Icons.keyboard_arrow_down,
          //                   color: kGold1Color,
          //                 ),
          //                 iconSize: 24,
          //                 elevation: 40,
          //                 borderRadius: BorderRadius.circular(50),
          //                 hint: Text('         Choose Class'),
          //                 style: TextStyle(color: kGold1Color, fontSize: 16),
          //                 onChanged: (newValue) {
          //                   cubit.changeSectionDropDownButton(newValue!);
          //                 },
          //                 items: cubit.menuItemsSection,
          //               ),
          //             ),
          //           ),
          //           SizedBox(
          //             width: 20,
          //           ),
          //           SearchBar(),
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: h / 25,
          //     ),
          //     Container(
          //       height: 50,
          //       width: 4 / 5 * w ,
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           border: Border.all(color: kDarkBlue2Color, width: 3),
          //           // borderRadius: BorderRadius.circular(20),
          //           boxShadow: <BoxShadow>[
          //             BoxShadow(
          //                 color: Color.fromRGBO(0, 0, 0, 0.2),
          //                 //shadow for button
          //                 blurRadius: 20) //blur radius of shadow
          //           ]),
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 10),
          //         child: Row(
          //           children: [
          //             Expanded(
          //               child: Center(
          //                 child: ShowText(
          //                   name: 'Id',
          //                 ),
          //               ),
          //             ),
          //             Expanded(
          //               child: Center(
          //                 child: ShowText(
          //                   name: 'First Name',
          //                 ),
          //               ),
          //             ),
          //             Expanded(
          //               child: Center(child: ShowText(name: 'Last Name')),
          //             ),
          //             Expanded(child: Center(child: ShowText(name: 'Grade'))),
          //             Expanded(
          //               child: Center(child: ShowText(name: 'Section')),
          //             ),
          //             Expanded(
          //               child: Center(
          //                   child: ShowText(
          //                 name: 'E-Mail',
          //               )),
          //             ),
          //             Expanded(
          //               child: ShowText(name: 'Absent??'),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       height: h / 20,
          //     ),
          //     Expanded(
          //         child: AddAttendanceBuilder(
          //       w,
          //       cubit.addExamsModel?.data,
          //       cubit.selectedDate,
          //           cubit.checkbox,
          //           cubit.idStudents,
          //           context,
          //           state,
          //
          //
          //     )),
          //
          //     state is! AttendanceLoadingState
          //         ? defaultButton(
          //         text: 'Send',
          //         width: w / 5,
          //         height: h / 20,
          //         onPressed: () {
          //           AttendanceCubit.get(context).AddAbsence(
          //               students_id: cubit.idStudents,
          //               date: cubit.selectedDate.toString());
          //         })
          //         : Center(child: CircularProgressIndicator()),
          //   ],
          // );
        },
      ),
    );
  }
}
