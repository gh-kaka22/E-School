import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/teachers/show/cubit/show_teachers_cubit.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/teacher.dart';
import 'package:untitled/shared/components/text_components.dart';

import '../../../styles/colors.dart';

class TSearchBar extends StatelessWidget {
  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowTeachersCubit()..getTeachers(),
      child: BlocConsumer<ShowTeachersCubit, ShowTeachersState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var list= ShowTeachersCubit.get(context).search;
          double w=MediaQuery.of(context).size.width;
          double h=MediaQuery.of(context).size.height;
          return
            Material(
              child: Column(

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
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: defaultFormField(
                          controller: searchController,
                          type: TextInputType.text,
                          onChange: (value){
                            ShowTeachersCubit.get(context).getSearch(value);
                          },
                          label: 'Search For Teachers'),


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
                          Expanded(
                              child: Center(
                                child: ShowText(name:'address',
                                ),
                              )),
                          Expanded(
                              child: Center(
                                child: ShowText(name:'details',
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
                    child: SearchTeachersBuilder(
                        w,
                        ShowTeachersCubit.get(context).search,
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