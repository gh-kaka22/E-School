import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/students/show/cubit/show_students_cubit.dart';
import 'package:untitled/modules/students/show/cubit/show_students_states.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/students.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/styles/colors.dart';

class StudentsSearchBar extends StatelessWidget {
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowStudentsCubit()..getStudents(),
      child: BlocConsumer<ShowStudentsCubit, ShowStudentsStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var list= ShowStudentsCubit.get(context).search;
          double w=MediaQuery.of(context).size.width;
          double h=MediaQuery.of(context).size.height;
          return
            Scaffold(
              body: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back),color: kDarkBlue2Color,),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: w/40,left: w/40),
                    child: Container(
                      height:50 ,
                      width: MediaQuery.of(context).size.width/5,
                      // padding: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: kSearchBackgroundColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: defaultFormField(
                          controller: searchController,
                          type: TextInputType.text,
                          onChange: (value){
                            ShowStudentsCubit.get(context).getSearch(value);
                          },
                          label: 'Search For Students'),


                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(

                    width: w,
                    height: 50,
                    decoration: BoxDecoration(
                        color:  Colors.white ,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                              blurRadius: 20) //blur radius of shadow
                        ]),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Center(
                                child: ShowText(name:'Id',
                                ),
                              )),
                          Expanded(
                              child: Center(
                                child: ShowText(name:'First Name',
                                ),
                              )),
                          Expanded(
                            child: Center(child: ShowText(name:'Last Name')),
                          ),
                          Expanded(child: Center(child: ShowText(name:'Grade'))),
                          Expanded(
                              child: Center(
                                child: ShowText(name:'Section',
                                ),
                              )),

                          Expanded(
                              child: Center(
                                child: ShowText(name:'Edit',
                                ),
                              )),


                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SearchStudentsBuilder(
                        w,
                        ShowStudentsCubit.get(context).search,
                        context,
                        state),
                  ),
                ],

              ),
            );
        },
      ),
    );
  }
}