import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_school/modules/complaints/add/cubit/complaints_cubit.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';

Widget ShowComplaintsItem(w, h, complaint, index, context) => Padding(
  padding: const EdgeInsets.all(15.0),
  child: Container(
    width: w - (w / 6),
    height: h / 10,
    decoration: BoxDecoration(
      color: complaint.status == 'pending'?
      kOrangeColor.withOpacity(0.1):
      Colors.lightGreen.withOpacity(0.1),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    child: Row(
      children: [
        Container(
          width: w / 5,
          height: h / 10,
          decoration: BoxDecoration(
            color: complaint.status == 'pending'?
            kOrangeColor:
            Colors.lightGreen
            ,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Stack(children: [
            Container(
              child: Center(
                child: Text(
                  '${complaint.status}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,

                  ),
                ),
              ),
            ),

          ]),
        ),
        Expanded(
            child: Center(
              child: Text('${complaint.description}',
                  style: TextStyle(overflow: TextOverflow.ellipsis , color: kDarkBlue2Color)),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: h/29,
              width: w/5,

              decoration: BoxDecoration(
                color: complaint.status == 'pending'?
                kOrangeColor:
                Colors.lightGreen,
                borderRadius: BorderRadius.only(topLeft:Radius.circular(15),bottomRight: Radius.circular(15)),
              ),
              child: Center(child: Text('${complaint.date}',style: TextStyle(
                fontSize: 12,
                color: Colors.white))))
          ],
        ),

      ],
    ),
  ),
);
Widget ShowComplaintsBuilder(w, h, complaints, context, state) =>
    ConditionalBuilder(
      condition: state is! ComplaintLoadingState && complaints != null,
      builder: (context) => ListView.separated(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              ShowComplaintsItem(w, h, complaints[index], index, context),
          separatorBuilder: (context, index) {
            return Center(
              child: SizedBox(),
            );
          },
          itemCount: complaints.length),

      fallback: (context) => Center(child: LinearProgressIndicator()),
    );
