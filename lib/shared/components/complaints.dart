import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/complaint/show/cubit/complaint_cubit.dart';
import 'package:untitled/shared/components/components.dart';

Widget ShowComplaintsItem(
        w, h, complaint, index, context, cubit, state,change) =>
    Container(
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
              child: Text('${complaint.complaintId}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
            Expanded(
                child: Center(
              child: Text('${complaint.date}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
            Expanded(
              child: Center(child: Text('${complaint.description}')),
            ),
            Expanded(
              child: Center(
                child: state is! StatusComplaintLoadingState
                    ? Center(
                        child:
                        IconButton(
                          onPressed: () {

                            cubit.clicked;
                            cubit.solveComplaints(
                              ID: complaint.complaintId,
                              status: cubit.change,
                            );

                          },
                          icon: Icon(

                            Icons.check_circle_sharp,
                            size: 30,
                            color: cubit.change ==0 ? Colors.red : Colors.green,




                          ),
                        ),
                      )
                    : Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );

Widget ShowComplaintsBuilder(w, h, complaints, context, state, cubit,change) =>
    ConditionalBuilder(
      condition: state is! ComplaintLoadingState && complaints != null,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) => ShowComplaintsItem(
              w, h, complaints[index], index, context, cubit, state,change),
          separatorBuilder: (context, index) {
            return MyDivider();
          },
          itemCount: complaints.length),
      fallback: (context) => Center(child: LinearProgressIndicator()),
    );
