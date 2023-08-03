import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_school/models/timetable_model.dart';
import 'package:e_school/modules/timetable_parent/cubit/parent_timetable_cubit.dart';
import 'package:e_school/modules/timetable_parent/cubit/parent_timetable_states.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/components/option_card.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParentTimetableScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ParentTimetableCubit()..getTimetableParent(day_number: 1,id:kidID),
      child: BlocConsumer<ParentTimetableCubit,ParentTimetableStates>(
          listener: (context,state){},
          builder: (context,state){
            var cubit = ParentTimetableCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text('Timetable'),
              ),
              body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        margin: EdgeInsets.all(5),
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            color: kWhiteColor,
                            //border: Border.all(color: kDarkBlue2Color, width: 3),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.3),
                                  blurRadius: 8) //blur radius of shadow
                            ]),
                        child: Center(child: Text(
                          '${kidName}\'s Timetable',
                          style: TextStyle(fontSize: 18),
                        )),
                      ),
                      SizedBox(height: 20,),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: ListView.builder(
                          itemCount: cubit.days.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index)=> GestureDetector(
                            onTap: (){
                              cubit.changeParentTimetableTabBar(index);
                              cubit.getTimetableParent( day_number: cubit.currentIndex+1,id: kidID);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: EdgeInsets.all(5),
                              width: 50,
                              height: 15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: kDarkBlue2Color, width: 1),
                                  color:
                                  cubit.currentIndex == index
                                      ? kDarkBlue2Color
                                      : kWhiteColor
                              ),
                              child: Center(
                                child: Text(
                                    cubit.days[index],
                                  style: TextStyle(
                                    color:
                                    cubit.currentIndex == index
                                        ? kWhiteColor
                                        : Colors.black

                                  ),
                                ),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Expanded(
                        child: ConditionalBuilder(
                            condition: state is ParentTimetableSuccessState,
                            builder: (context)=>timetableBuilder(cubit.periodsList,cubit.currentIndex+1,context),
                            fallback: (context)=>Center(child: CircularProgressIndicator())),
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
