
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_school/modules/exam_schedule/cubit/exam_schedule_cubit.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  var _title;
  var _description;
  var _date;
  var _month;
  var _bgColor;

  ScheduleCard(
      this._title, this._description, this._date, this._month, this._bgColor);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: _bgColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: _bgColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _date,
                  style: TextStyle(
                    color: _bgColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _month,
                  style: TextStyle(
                    color: _bgColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          title: Text(
            _title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kTitleTextColor,
            ),
          ),
          subtitle: Text(
            _description,
            style: TextStyle(
              color: kTitleTextColor.withOpacity(0.7),
            ),
          ),
        ),
      ),
    );
  }
}



Widget ShowExamScheduleItem(w, schedule, index, context) => Container(
  height: 50,
  decoration: BoxDecoration(
      color: index % 2 == 0 ? Colors.white : Colors.grey[200]!,
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            blurRadius: 20) //blur radius of shadow
      ]),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      children: [
        Expanded(
            child: Center(
              child: Text('${schedule.typeId}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),

        Expanded(
          child: Center(child: Text('${schedule.gradeId}')),
        ),
        Expanded(
            child: Center(
              child: Text('${schedule.schoolYear}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
          child: Center(
            child: defaultButton(
              onPressed: ()  {

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        width: w/4,

                        child:Image(image: NetworkImage('${schedule.image}'),),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
                ;

              },
              height: 30,
              text: 'Show',
              fontsize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),

      ],
    ),
  ),
);
Widget ShowExamScheduleBuilder(w, schedules, context, state) => ConditionalBuilder(
  condition: state is! ShowExamScheduleLoadingState && schedules != null,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          ShowExamScheduleItem(w, schedules[index], index, context),
      separatorBuilder: (context, index) {
        return MyDivider();
      },
      itemCount: schedules.length),
  fallback: (context) => Center(child: LinearProgressIndicator()),
);