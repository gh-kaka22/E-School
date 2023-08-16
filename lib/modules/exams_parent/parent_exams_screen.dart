import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_school/language/language_constants.dart';
import 'package:e_school/modules/exams_parent/cubit/parent_exams_cubit.dart';
import 'package:e_school/modules/exams_parent/cubit/parent_exams_states.dart';

import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParentExamsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ParentExamsCubit()..getStudentMarksParent('1', '2022/2023',kidID),
      child: BlocConsumer<ParentExamsCubit, ParentExamsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ParentExamsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(translation(context).marks),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                              underline: SizedBox(),
                              value: cubit.dropDownValueType,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: kGold1Color,
                              ),
                              iconSize: 24,
                              elevation: 40,
                              hint: Text('Choose Course'),
                              style: TextStyle(color: kGold1Color,fontSize: 16),
                              onChanged: (newValue) {
                                cubit.changeTypeDropDownButton(newValue);
                                cubit.getStudentMarksParent(cubit.dropDownValueType, cubit.dropDownValueYear,kidID);
                              },
                              items: cubit.menuItemsType,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                              underline: SizedBox(),
                              value: cubit.dropDownValueYear,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: kGold1Color,
                              ),
                              iconSize: 24,
                              elevation: 40,
                              hint: Text('Choose Year'),
                              style: TextStyle(color: kGold1Color,fontSize: 16),
                              onChanged: (newValue) {
                                cubit.changeYearDropDownButton(newValue);
                                cubit.getStudentMarksParent(cubit.dropDownValueType, cubit.dropDownValueYear,kidID);

                              },
                              items: cubit.menuItemsYear,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                ConditionalBuilder(
                    condition: cubit.subjects != null,
                    builder: (context)=>Card(
                      elevation: 10.0,
                      shadowColor: Colors.grey[400],
                      child: DataTable(
                        columnSpacing: 70.0,
                        dataRowHeight: 50.0,
                        headingRowHeight: 50.0,
                        columns: [
                          DataColumn(
                            label: Text(
                              'Subject',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: kGold1Color,
                              ),
                            ),
                          ),
                          DataColumn(
                              label: Text(
                                'Mark',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: kGold1Color,
                                ),
                              )),
                          DataColumn(
                              label: Text(
                                'Max',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: kGold1Color,
                                ),
                              )),
                        ],
                        rows: cubit.subjects!.map((subject) => DataRow(
                          color: MaterialStateColor.resolveWith((states) =>
                          cubit.subjects!.indexOf(subject) % 2 == 0
                              ? Colors.grey[50]!
                              : Colors.grey[100]!),
                          cells: [
                            DataCell(Text(subject.name)),
                            DataCell(Text(
                              subject.mark.toString(),
                              style: TextStyle(
                                  color: subject.mark > subject.maxMark / 2
                                      ? Colors.green
                                      : Colors.red),
                            )),
                            DataCell(Text(subject.maxMark.toString())),
                          ],
                        ))
                            .toList(),
                      ),
                    ) ,
                    fallback: (context)=>Expanded(child: Center(child: CircularProgressIndicator()))
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
