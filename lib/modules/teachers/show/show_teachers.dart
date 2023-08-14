import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/teachers/show/cubit/show_teachers_cubit.dart';
import 'package:untitled/modules/teachers/show/search_teacher.dart';
import 'package:untitled/modules/teachers/update/update_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/teacher.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/styles/colors.dart';
class ShowTeachers extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double padding=MediaQuery.of(context).size.width/20;
    return BlocProvider(
      create: (BuildContext context) => ShowTeachersCubit()..getTeachers(),
      child: BlocConsumer<ShowTeachersCubit, ShowTeachersState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShowTeachersCubit.get(context);
          var list= ShowTeachersCubit.get(context).search;
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
                  MyText(name: 'Teachers'),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    child: Text('Search For Teachers',style: TextStyle(
                    color: kGold1Color,


                  ),


                  ),
                    onPressed: (){
                    navigateTo(context, TSearchBar());
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kDarkBlue2Color,
                      foregroundColor: kGold1Color,
                      side: BorderSide(
                          width: 1, color: Colors.white),
                      elevation: 0,
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Container(

                    width: 4 / 5 * w,
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
                          Expanded(child: Center(child: ShowText(name:'Subject'))),
                          Expanded(
                              child: Center(
                                child: ShowText(name:'address',
                                ),
                              )),
                       Expanded(
                  child: Center(
                    child: ShowText(name:'details',
                    ),
                  )),  Expanded(
                  child: Center(
                    child: ShowText(name:'Schedule',
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
                      child: ShowTeachersBuilder(
                         w,
                          h,
                          cubit.showTeacherModel?.data,
                          context,
                          state,
                        cubit
                      )
                  ),



                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
