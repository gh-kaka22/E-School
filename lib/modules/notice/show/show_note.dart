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
  int id;
  ShowNotesScreen({ required this.id,});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double padding = MediaQuery.of(context).size.width / 20;
    return BlocProvider(
      create: (BuildContext context) => ShowNoticeCubit()..getNotes(id),
      child: BlocConsumer<ShowNoticeCubit, ShowNoticeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShowNoticeCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: h,
                width:  w,
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back),color: kDarkBlue2Color,),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyText(name: 'Show Notes Of Students'),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width:  w,
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
