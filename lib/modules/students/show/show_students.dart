import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/students/show/cubit/show_students_cubit.dart';
import 'package:untitled/modules/students/show/cubit/show_students_states.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/styles/colors.dart';
class StudentsShow extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return BlocProvider(
        create: (BuildContext context) => ShowStudentsCubit(),
        child: BlocConsumer<ShowStudentsCubit,ShowStudentsStates>(
          listener: (context,state){},
        builder: (context,state){
            var cubit = ShowStudentsCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: h,
                width: 4/5 * w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Students',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
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
                              padding: const EdgeInsets.only(left: 100, right: 100),
                              child: DropdownButton<dynamic>(
                                value: cubit.dropDownValueClass,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: kGold1Color,
                                ),
                                iconSize: 24,
                                elevation: 40,
                                hint: Text('Choose Class'),
                                style: TextStyle(color: kGold1Color,fontSize: 16),
                                onChanged: (newValue) {
                                  cubit.changeClassDropDownButton(newValue!);
                                },
                                items: cubit.menuItems,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Center(
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
                              padding: const EdgeInsets.only(left: 100, right: 100),
                              child: DropdownButton<dynamic>(
                                value: cubit.dropDownValueSection,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: kGold1Color,
                                ),
                                iconSize: 24,
                                elevation: 40,
                                hint: Text('Choose Class'),
                                style: TextStyle(color: kGold1Color,fontSize: 16),
                                onChanged: (newValue) {
                                  cubit.changeSectionDropDownButton(newValue!);
                                },
                                items: cubit.menuItems2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context,index)=>ShowStudentItem(),
                          separatorBuilder: (context,index){
                            return Divider(color: kDarkBlue2Color,height: 2,thickness: 2,);
                          },
                          itemCount: 7),
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
