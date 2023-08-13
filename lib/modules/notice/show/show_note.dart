import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/notice/show/cubit/show_notice_cubit.dart';
import 'package:untitled/modules/students/show/cubit/show_students_cubit.dart';
import 'package:untitled/modules/students/show/cubit/show_students_states.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/notice.dart';
import 'package:untitled/shared/components/search_bar.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/styles/colors.dart';

class ShowNotesScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double padding = MediaQuery.of(context).size.width / 20;
    return BlocProvider(
      create: (BuildContext context) => ShowNoticeCubit()..getNotes(1),
      child: BlocConsumer<ShowNoticeCubit, ShowNoticeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShowNoticeCubit.get(context);
          return Material(
            child: Padding(
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
                    MyText(name: 'Show Notes Of Students'),
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
                              child: Center(child: ShowText(name: 'Date')),
                            ),
                            Expanded(
                              child: Center(child: ShowText(name: 'Day')),
                            ),
                            Expanded(
                              child: Center(child: ShowText(name: 'Note')),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: ShowNotesBuilder(
                            w, cubit.showNotesModel?.data, context, state))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
