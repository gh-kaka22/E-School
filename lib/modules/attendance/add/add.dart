import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/attendance/add/cubit/attendance_cubit.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/search_bar.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/styles/colors.dart';

class AddAttendance extends StatelessWidget {
  const AddAttendance({Key? key}) : super(key: key);

  @override

  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return BlocProvider(
  create: (context) => AttendanceCubit(),
  child: BlocConsumer<AttendanceCubit, AttendanceState>(
  listener: (context, state) {

  },
  builder: (context, state) {
    var cubit = AttendanceCubit.get(context);
    return Column(
      children: [
        SizedBox(height:h/25 ,),
        MyText(name: 'Attendance'),
        SizedBox(height:h/20 ,),
       Padding(
         padding: const EdgeInsets.only(left:30),
         child: Row(
           children: [
             Expanded(
               child: DecoratedBox(

                 decoration: BoxDecoration(
                     color: Colors.white70,
                     border: Border.all(color: kDarkBlue2Color, width: 3),
                     borderRadius: BorderRadius.circular(50),
                     boxShadow: <BoxShadow>[
                       BoxShadow(
                           color: Color.fromRGBO(0, 0, 0, 0.2),
                           //shadow for button
                           blurRadius: 5) //blur radius of shadow
                     ]),
                 child: DropdownButton<dynamic>(
                   underline: const SizedBox(),
                   value: cubit.dropDownValueClass,
                   icon: Icon(
                     Icons.keyboard_arrow_down,
                     color: kGold1Color,
                   ),
                   iconSize: 24,
                   elevation: 40,
                   borderRadius: BorderRadius.circular(50),
                   hint: Text('Choose Class'),
                   style:
                   TextStyle(color: kGold1Color, fontSize: 16),
                   onChanged: (newValue) {
                     cubit.changeClassDropDownButton(newValue!);
                   },
                   items: cubit.menuItems,
                 ),
               ),
             ),
             SizedBox(
               width: 20,
             ),
             Expanded(
               child: DecoratedBox(
                 decoration: BoxDecoration(
                     color: Colors.white70,
                     border: Border.all(color: kDarkBlue2Color, width: 3),
                     borderRadius: BorderRadius.circular(50),
                     boxShadow: <BoxShadow>[
                       BoxShadow(
                           color: Color.fromRGBO(0, 0, 0, 0.2),
                           //shadow for button
                           blurRadius: 5) //blur radius of shadow
                     ]),
                 child: DropdownButton<dynamic>(
                   underline: const SizedBox(),
                   value: cubit.dropDownValueSection,
                   icon: Icon(
                     Icons.keyboard_arrow_down,
                     color: kGold1Color,
                   ),
                   iconSize: 24,
                   elevation: 40,
                   borderRadius: BorderRadius.circular(50),
                   hint: Text('Choose Class'),
                   style:
                   TextStyle(color: kGold1Color, fontSize: 16),
                   onChanged: (newValue) {
                     cubit.changeSectionDropDownButton(newValue!);
                   },
                   items: cubit.menuItems2,
                 ),
               ),
             ),
             SizedBox(
               width: 20,
             ),
             SearchBar(),
           ],
         ),
       ),
        SizedBox(height: h/25,),
    Container(

      height: h/15,
      width: 4 / 5 * w - (w/30),

      decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: kDarkBlue2Color, width: 3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.2),
                //shadow for button
                blurRadius: 5) //blur radius of shadow
          ]
           ),
      child: Row(
        children: [
          Expanded(
              child: Center(
                child: ShowText(name: 'Id',

              ),),),
          Expanded(
              child: Center(
                child: ShowText(name:'First Name',)
                ,)
            ,),

          Expanded(
            child: Center(child: ShowText(name:'Last Name')),
          ),
          Expanded(child: Center(child: ShowText(name:'Grade'))),
          Expanded(
            child: Center(child: ShowText(name:'Section')),
          ),
          Expanded(
              child: Center(
                child: ShowText(name:'E-Mail',
                    )),
              ),
          Expanded(
            child: ShowText(name:'Absent??'),
          ),

        ],
      ),
    ),
        SizedBox(height: h/20,),
        Expanded(
            child: ShowStudentsBuilder(
                w,
                cubit.attendanceModel?.data,
                context,
                state
            )
        )

      ],
    );
  },
),
);
  }
}
