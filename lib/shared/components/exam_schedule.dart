import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/exams_schedule/show/cubit/show_exam_schedule_cubit.dart';
import 'package:untitled/shared/components/components.dart';

Widget ShowExamScheduleItem(w, schedule, index, context) => Container(
  width: 4 / 5 * w,
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
              child: Text('${index+1}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
            child: Center(
              child: Text('${schedule.name}',
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
                        width: w,
                        //todo: cachenetworkImage
                        child:CachedNetworkImage(
                          imageUrl: 'http://127.0.0.1:8000/ExamScheduleImages/${schedule.image}',
                          placeholder: (context,url)=>const LinearProgressIndicator(),
                          errorWidget: (context,url,error)=>Center(child: Text('Image Not Found')),
                        ),
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