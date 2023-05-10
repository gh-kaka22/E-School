import 'package:e_school/modules/exams/cubit/exams_cubit.dart';
import 'package:e_school/modules/exams/cubit/exams_states.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Subject {
  final String name;
  final double mark;
  final double total;

  Subject(this.name, this.mark, this.total);
}

List<Subject> subjects = [
  Subject('English', 39, 40),
  Subject('Arabic', 50, 60),
  Subject('Math', 55, 60),
  Subject('Science', 19.5, 40),
  Subject('Religion', 20, 20),
  Subject('S.S.', 20, 20),
  Subject('French', 13.75, 30),
  Subject('Physics', 37.25, 40),
  Subject('Chemistry', 9, 20),
  Subject('Music', 20, 20),
];

class ExamsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ExamsCubit(),
      child: BlocConsumer<ExamsCubit, ExamsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ExamsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Exams'),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
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
                      padding: const EdgeInsets.only(left: 100, right: 100),
                      child: DropdownButton<dynamic>(
                        value: cubit.dropDownValue,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: kGold1Color,
                        ),
                        iconSize: 24,
                        elevation: 40,
                        hint: Text('Choose Course'),
                        style: TextStyle(color: kGold1Color,fontSize: 16),
                        onChanged: (newValue) {
                          cubit.changeDropDownButton(newValue);
                        },
                        items: cubit.menuItems,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Card(
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
                        'Total',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: kGold1Color,
                        ),
                      )),
                    ],
                    rows: subjects.map((subject) => DataRow(
                              color: MaterialStateColor.resolveWith((states) =>
                                  subjects.indexOf(subject) % 2 == 0
                                      ? Colors.grey[50]!
                                      : Colors.grey[100]!),
                              cells: [
                                DataCell(Text(subject.name)),
                                DataCell(Text(
                                  subject.mark.toString(),
                                  style: TextStyle(
                                      color: subject.mark > subject.total / 2
                                          ? Colors.green
                                          : Colors.red),
                                )),
                                DataCell(Text(subject.total.toString())),
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
