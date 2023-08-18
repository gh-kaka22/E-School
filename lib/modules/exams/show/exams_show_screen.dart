import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:untitled/layout/eschool_cubit/home_cubit.dart';
import 'package:untitled/modules/exams/show/cubit/exams_show_cubit.dart';
import 'package:untitled/modules/exams/show/cubit/exams_show_states.dart';
import 'package:untitled/modules/students/show/cubit/show_students_cubit.dart';
import 'package:untitled/modules/students/show/cubit/show_students_states.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/search_bar.dart';
import 'package:untitled/styles/colors.dart';

class ExamsShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => ShowExamsCubit()..getClassrooms(7)..getSubjects()..getSchoolYear(),
      child: BlocConsumer<ShowExamsCubit, ShowExamsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShowExamsCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: h,
              width: 4 / 5 * w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EXAMS',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400,color: kDarkBlue2Color),
                  ),
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
                            const EdgeInsets.only(left: 80, right: 80),
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
                          child: Padding(
                            padding:
                            const EdgeInsets.only(left: 80, right: 80),
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
                          child: Padding(
                            padding:
                            const EdgeInsets.only(left: 70, right: 70),
                            child: DropdownButton<dynamic>(
                              underline: const SizedBox(),
                              value: cubit.dropDownValueSubject,
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
                                cubit.changeSubjectDropDownButton(newValue!);
                              },
                              items: cubit.menuItemsSubject,
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
                            const EdgeInsets.only(left: 80, right: 80),
                            child: DropdownButton<dynamic>(
                              underline: const SizedBox(),
                              value: cubit.dropDownValueType,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: kGold1Color,
                              ),
                              iconSize: 24,
                              elevation: 40,
                              hint: Text('Choose Type'),
                              style:
                              TextStyle(color: kGold1Color, fontSize: 16),
                              onChanged: (newValue) {
                                cubit.changeTypeDropDownButton(newValue!);
                              },
                              items: cubit.menuItemsType,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
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
                              value: cubit.dropDownValueYear,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: kGold1Color,
                              ),
                              iconSize: 24,
                              elevation: 40,
                              hint: Text('Choose Year'),
                              style:
                              TextStyle(color: kGold1Color, fontSize: 16),
                              onChanged: (newValue) {
                                cubit.changeYearDropDownButton(newValue!);
                              },
                              items: cubit.menuItemsYear,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
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
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Center(
                                child: Text('Id',
                                    style: TextStyle(overflow: TextOverflow.ellipsis)),
                              )),
                          Expanded(
                              child: Center(
                                child: Text('First Name',
                                    style: TextStyle(overflow: TextOverflow.ellipsis)),
                              )),
                          Expanded(
                            child: Center(child: Text('Last Name')),
                          ),
                          Expanded(
                              child: Center(child: Text('Grade'))
                          ),
                          Expanded(
                            child: Center(child: Text('Section')),
                          ),
                          Expanded(
                              child: Center(
                                child: Text('Subject',
                                    style: TextStyle(overflow: TextOverflow.ellipsis)),
                              )),
                          Expanded(
                              child: Center(
                                child: Text('Date',
                                    style: TextStyle(overflow: TextOverflow.ellipsis)),
                              )),
                          Expanded(
                              child: Center(
                                child: Text('Mark',
                                    style: TextStyle(overflow: TextOverflow.ellipsis)),
                              )),
                          Expanded(
                            child: defaultButton(
                              onPressed: () {
                                cubit.getStudentsMarks(cubit.dropDownValueClass,cubit.dropDownValueSection,cubit.dropDownValueSubject,cubit.dropDownValueType,cubit.dropDownValueYear);
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
                      child: ShowExamsBuilder(
                          w,
                          cubit.showExamsModel?.data,
                          context,
                          state,
                        cubit
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
