import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/notice/add/cubit/add_notice_cubit.dart';
import 'package:untitled/modules/notice/add/cubit/add_notice_cubit.dart';
import 'package:untitled/modules/notice/add/cubit/add_notice_cubit.dart';
import 'package:untitled/modules/notice/add/cubit/add_notice_cubit.dart';

import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/notice.dart';

import 'package:untitled/styles/colors.dart';

import 'cubit/add_notice_cubit.dart';

class AddNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (BuildContext context) => AddNoticeCubit()..getStudents(),
      //..getClassrooms()..getSubjects()..getSchoolYear(),
      child: BlocConsumer<AddNoticeCubit, AddNoticeState>(
        listener: (context, state) {
          if (state is AddNoticeModelState) {
            if(state.noticeModel.status ?? true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content:
                  Center(
                    child: Text(
                        '${state.noticeModel.message}',
                        style: TextStyle(color: Colors.white)),
                  )));
            } else  {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                    child: Text(
                      '${state.noticeModel.message}',
                      style: TextStyle(color: Colors.white),
                    ),
                  )));

            }}
        },
        builder: (context, state) {
          var cubit = AddNoticeCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: h,
              width: 4 / 5 * w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EXAMS',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: DecoratedBox(
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
                          // child: Padding(
                          //   padding:
                          //   const EdgeInsets.only(left: 80, right: 80),
                          //   child: DropdownButton<dynamic>(
                          //     underline: const SizedBox(),
                          //     value: cubit.dropDownValueClass,
                          //     icon: Icon(
                          //       Icons.keyboard_arrow_down,
                          //       color: kGold1Color,
                          //     ),
                          //     iconSize: 24,
                          //     elevation: 40,
                          //     hint: Text('Choose Class'),
                          //     style:
                          //     TextStyle(color: kGold1Color, fontSize: 16),
                          //     onChanged: (newValue) {
                          //       cubit.changeClassDropDownButton(newValue!);
                          //     },
                          //     items: cubit.menuItemsClass,
                          //   ),
                          // ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: DecoratedBox(
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
                             const EdgeInsets.only(left: 80, right: 80),
                             child: DropdownButton<dynamic>(
                               underline: const SizedBox(),
                               value: cubit.dropDownValueSection,
                               icon: Icon(
                                 Icons.keyboard_arrow_down,
                                 color: kGold1Color,
                               ),
                               iconSize: 24,
                               elevation: 40,
                               hint: Text('Choose Class'),
                               style:
                             TextStyle(color: kGold1Color, fontSize: 16),
                             onChanged: (newValue) {
                                 cubit.changeSectionDropDownButton(newValue!);
                              },
                               items: cubit.menuItemsSection,
                             ),
                           ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: kGold1Color,
                            side: BorderSide(
                                width: 1, color: Colors.white),
                            elevation: 0,
                          ),
                          onPressed: () =>
                              cubit.selectedDate,
                          child: const Text(
                            'Select date ',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Center(
                                child: Text('Id',
                                    style: TextStyle(overflow: TextOverflow.ellipsis)),
                              )),
                          Expanded(
                              child: Center(
                                child: Text('First Name',
                                    style: TextStyle(overflow: TextOverflow.ellipsis)),
                              )),
                          Expanded(
                            child: Center(child: Text('Last Name')),
                          ),
                          Expanded(child: Center(child: Text('Grade'))),
                          Expanded(
                            child: Center(child: Text('Section')),
                          ),
                          Expanded(
                              child: Center(
                                child: Text('Notice',
                                    style: TextStyle(overflow: TextOverflow.ellipsis)),
                              )),
                          Expanded(
                            child: defaultButton(
                              onPressed: () {
                                cubit.getStudentByGrade(cubit.dropDownValueClass);
                              },
                              height: 30,
                              text: 'Refresh',
                              fontsize: 15,
                              fontWeight: FontWeight.w300,
                              buttColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: AddNoticeBuilder(
                          w,
                          cubit.noticeModel?.data,
                          cubit.selectedDate,
                          cubit.dropDownValueType,
                          context,
                          state,
                          cubit.controllers,
                          cubit
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
