import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/complaint/show/cubit/complaint_cubit.dart';
import 'package:untitled/shared/components/complaints.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/text_components.dart';

class ShowComplaints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double padding = MediaQuery.of(context).size.width / 20;

    int? change;
    return BlocProvider(
      create: (BuildContext context) => ComplaintCubit()..getComplaints(),
      child: BlocConsumer<ComplaintCubit, ComplaintState>(
        listener: (context, state) {
          if(state is StatusComplaintSuccessState)
            {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content:
                  Center(
                    child: Text(
                        'Complaint is solved now !',
                        style: TextStyle(color: Colors.white)),
                  )));
            }
        },
        builder: (context, state) {
          var cubit = ComplaintCubit.get(context);
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
                  MyText(name: 'Complaints'),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 4 / 5 * w,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                              blurRadius: 20) //blur radius of shadow
                        ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Center(
                            child: ShowText(
                              name: 'Complainer',
                            ),
                          )),
                          Expanded(
                              child: Center(
                            child: ShowText(
                              name: 'Date',
                            ),
                          )),
                          Expanded(
                            child: Center(child: ShowText(name: 'Description')),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                cubit.getComplaints();
                              },
                              child: ShowText(name: 'Refresh'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: ConditionalBuilder(
                    condition: state is! ComplaintLoadingState &&
                        cubit.complaints != null,
                    builder: (context) => ListView.separated(
                        itemBuilder: (context, index) => Container(
                              width: 4 / 5 * w,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: index % 2 == 0
                                      ? Colors.white
                                      : Colors.grey[200]!,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.2),
                                        blurRadius: 20)
                                    //blur radius of shadow
                                  ]),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Center(
                                      child: Text(
                                          '${cubit.complaintModel?.data?[index].parentName}',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    )),
                                    Expanded(
                                        child: Center(
                                      child: Text(
                                          '${cubit.complaintModel?.data?[index].date}',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    )),
                                    Expanded(
                                      child: Center(
                                          child: Text(
                                              '${cubit.complaintModel?.data?[index].description}')),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: state
                                                is! StatusComplaintLoadingState
                                            ? Center(
                                                child: InkWell(
                                                  onTap: () {
                                                    cubit.solveComplaints(
                                                      ID: cubit
                                                          .complaintModel
                                                          ?.data?[index]
                                                          .complaintId,
                                                      status: '1',
                                                    );
                                                    cubit.getComplaints();

                                                  },
                                                  child: Image.asset('assets/icons/expired.png'),
                                                )
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator()),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) {
                          return MyDivider();
                        },
                        itemCount: cubit.complaints!.length),
                    fallback: (context) =>
                        Center(child: LinearProgressIndicator()),
                  )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
