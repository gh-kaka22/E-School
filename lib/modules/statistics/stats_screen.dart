
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:untitled/modules/statistics/cubit/stats_cubit.dart';
import 'package:untitled/modules/statistics/cubit/stats_states.dart';
import 'package:untitled/styles/colors.dart';

class StatsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => StatsCubit()..getStats(),
      child: BlocConsumer<StatsCubit, StatsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = StatsCubit.get(context);
          cubit.getDataC();
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: h,
              width: 4 / 5 * w,
              child: ConditionalBuilder(
                condition: state is! StatsLoadingState,
                builder: (context)=>Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 120,
                        ),
                        Container(
                          height: 100,
                          width: 500,
                          decoration:  BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.blue,
                                Colors.deepPurple,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 7,
                                blurRadius: 12,
                                offset: Offset(0, 8),
                              ),
                            ],
                            borderRadius:  BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Students:',
                                style: TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'Nunito',
                                    color: Colors.white
                                ),),
                              SizedBox(width: 20,),
                              Text(
                                '${cubit.students}',
                                style: TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'Nunito',
                                    color: Colors.white
                                ),),
                              SizedBox(width: 30,),
                              Container(
                                height: 50,
                                width: 50,
                                child: Image.asset('assets/icons/graduated_white.png'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 100,
                          width: 500,
                          decoration:  BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.red,
                                Colors.pink,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 7,
                                blurRadius: 12,
                                offset: Offset(0, 8),
                              ),
                            ],
                            borderRadius:  BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Teachers:',
                                style: TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'Nunito',
                                    color: Colors.white
                                ),),
                              SizedBox(width: 20,),
                              Text('${cubit.teachers}',style: TextStyle(fontSize: 50,fontFamily: 'Nunito',color: Colors.white),),
                              SizedBox(width: 30,),
                              Container(
                                height: 50,
                                width: 50,
                                child: Image.asset('assets/icons/teacher_white.png'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 100,
                          width: 500,
                          decoration:  BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.lightGreen,
                                Colors.teal,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 7,
                                blurRadius: 12,
                                offset: Offset(0, 8),
                              ),
                            ],
                            borderRadius:  BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Employees:',style: TextStyle(fontSize: 50,fontFamily: 'Nunito',color: Colors.white),),
                              SizedBox(width: 20,),
                              Text('${cubit.employees}',style: TextStyle(fontSize: 50,fontFamily: 'Nunito',color: Colors.white),),
                              SizedBox(width: 30,),
                              Container(
                                height: 50,
                                width: 50,
                                child: Image.asset('assets/icons/employees_white.png'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 100,
                          width: 500,
                          decoration:  BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.yellow,
                                Colors.orange,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 7,
                                blurRadius: 12,
                                offset: Offset(0, 8),
                              ),
                            ],
                            borderRadius:  BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Admins:',style: TextStyle(fontSize: 50,fontFamily: 'Nunito',color: Colors.white),),
                              SizedBox(width: 20,),
                              Text('${cubit.admins}',style: TextStyle(fontSize: 50,fontFamily: 'Nunito',color: Colors.white),),
                              SizedBox(width: 30,),
                              Container(
                                height: 50,
                                width: 50,
                                child: Image.asset('assets/icons/admin_white.png'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 250,),
                    Container(
                      height: 500,
                      width: 350,
                      child: SfCircularChart(
                        title: ChartTitle(
                            text: 'School Stats',
                            textStyle: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Nunito',
                                color: kDarkBlue2Color,

                            )
                        ),
                        legend:Legend(
                          isVisible:true,
                          overflowMode: LegendItemOverflowMode.wrap,
                          textStyle: TextStyle(fontSize: 20),
                        ),
                        series: <CircularSeries>[
                          DoughnutSeries<ChartData,String>(
                            dataSource: cubit.chart,
                            xValueMapper: (ChartData data,_)=>data.user,
                            yValueMapper: (ChartData data,_)=>data.number,
                            pointColorMapper: (ChartData data,_)=>data.color,
                            dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              textStyle: TextStyle(fontSize: 16,color: Colors.white),

                            ),


                          )
                        ],
                      ),
                    ),
                  ],
                ),
                fallback: (context)=>Center(child: LinearProgressIndicator()),
              ),
            ),
          );
        },
      ),
    );
  }


}
