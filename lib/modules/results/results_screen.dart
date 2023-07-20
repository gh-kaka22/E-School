import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/results/cubit/results_cubit.dart';
import 'package:untitled/modules/results/cubit/results_states.dart';
import 'package:untitled/shared/components/components.dart';

import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/styles/colors.dart';

class ResultsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double padding=MediaQuery.of(context).size.width/20;
    return BlocProvider(
      create: (BuildContext context) => ResultsCubit(),
      child: BlocConsumer<ResultsCubit, ResultsStates>(
        listener: (context, state) {
          if (state is ResultsCalcSuccessState) {
            if(state.calcModel.status == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content:
                  Center(
                    child: Text(
                        'DONE CALCULATING RESULTS...',
                        style: TextStyle(color: Colors.white)),
                  )));
            } else  {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                    child: Text(
                      'FAILED CALCULATING RESULTS...',
                      style: TextStyle(color: Colors.white),
                    ),
                  )));

            }}
          else if (state is ResultsUpgradeSuccessState) {
            if(state.upgradeModel.status == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content:
                  Center(
                    child: Text(
                        'DONE UPGRADING...',
                        style: TextStyle(color: Colors.white)),
                  )));
            } else  {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                    child: Text(
                      'FAILED UPGRADING',
                      style: TextStyle(color: Colors.white),
                    ),
                  )));

            }}
          else if (state is ResultsSuccessState) {
            if(state.rankingModel.status == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content:
                  Center(
                    child: Text(
                        'DONE SORTING',
                        style: TextStyle(color: Colors.white)),
                  )));
            } else  {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                    child: Text(
                      'FAILED SORTING',
                      style: TextStyle(color: Colors.white),
                    ),
                  )));

            }}
        },
        builder: (context, state) {
          var cubit = ResultsCubit.get(context);
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
                  MyText(name: 'Results'),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: kDarkBlue2Color,
                            border: Border.all(color: kGold1Color, width: 3),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.57),
                                  //shadow for button
                                  blurRadius: 5) //blur radius of shadow
                            ]),
                        child: Padding(
                          padding:
                             EdgeInsets.only(left: padding, right: padding),
                          child: DropdownButton<dynamic>(
                            underline: const SizedBox(),
                            value: cubit.dropDownValueClass,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: kGold1Color,
                            ),
                            iconSize: 24,
                            elevation: 40,
                            hint: Text('Choose Class',style: TextStyle(color: kGold1Color),),
                            style:
                                TextStyle(color: kGold1Color, fontSize: 16),
                            onChanged: (newValue) {
                              cubit.changeClassDropDownButton(newValue!);
                            },
                            items: cubit.menuClassItems,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: kDarkBlue2Color,
                            border: Border.all(color: kGold1Color, width: 3),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.57),
                                  //shadow for button
                                  blurRadius: 5) //blur radius of shadow
                            ]),
                        child: Padding(
                          padding:
                               EdgeInsets.only(left: padding, right: padding),
                          child: DropdownButton<dynamic>(
                            underline: const SizedBox(),
                            value: cubit.dropDownValueSchoolYear,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: kGold1Color,
                            ),
                            iconSize: 24,
                            elevation: 40,
                            hint: Text('Choose Year',style: TextStyle(color: kGold1Color),),
                            style:
                                TextStyle(color: kGold1Color, fontSize: 16),
                            onChanged: (newValue) {
                              cubit.changeSchoolYearDropDownButton(newValue!);
                            },
                            items: cubit.menuYearItems,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: MaterialButton(
                            onPressed: (){
                              cubit.calc(
                                  gradeId: cubit.dropDownValueClass,
                                  schoolYear: cubit.dropDownValueSchoolYear
                              );
                            },
                            child: Text(
                              'Calculate',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: kWhiteColor,
                                fontSize: 24,
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Visibility(
                        visible: state is ResultsCalcSuccessState ? true : false,
                        child: Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: MaterialButton(
                              onPressed: (){
                                showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Attention!'),
                                      content: SizedBox(
                                          width: 60,
                                          height: 50,
                                          child: Text('Are you sure?'),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Yes'),
                                          onPressed: () {
                                            cubit.upgrade(
                                                gradeId: cubit.dropDownValueClass,
                                                schoolYear: cubit.dropDownValueSchoolYear
                                            );
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(
                                'Upgrade',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: kWhiteColor,
                                  fontSize: 24,
                                ),
                              ),
                            )),
                      ),

                    ],
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
                                child: ShowText(name:'Rank',
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
                            child: Center(child: ShowText(name:'Year')),
                          ),
                          Expanded(
                              child: Center(
                                child: ShowText(name:'Result',
                                    ),
                              )),
                          Expanded(
                            child: defaultButton(
                              onPressed: () {
                                cubit.getStudentsRanking(
                                    gradeId: cubit.dropDownValueClass,
                                    schoolYear: cubit.dropDownValueSchoolYear
                                );

                              },
                              height: 30,
                              text: 'Refresh',
                              fontsize: 15,
                              fontWeight: FontWeight.w300,
                              buttColor:kGold1Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: RankingBuilder(
                          w,
                          cubit.rankingModel?.data,
                        context,
                        state
                          )
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
