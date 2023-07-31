

import 'package:e_school/modules/complaints/add/cubit/complaints_cubit.dart';
import 'package:e_school/modules/complaints/show/cubit/show_complaints_cubit.dart';
import 'package:e_school/shared/components/complaints.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowComplaints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => ShowComplaintsCubit()..getComplaints(),
      child: BlocConsumer<ShowComplaintsCubit, ShowComplaintsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Complaints'),
            ),

              body: SingleChildScrollView(
                child: Column(

                  children: [
                    
                    ShowComplaintsBuilder(
                      w,
                      h,
                      ShowComplaintsCubit
                          .get(context)

                          .showComplaintsModel
                          ?.data,
                      context,
                      state,

                    ),

                  ],
                ),
              )
          );
        },
      ),
    );
  }
}
