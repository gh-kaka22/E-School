import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/employee/add/add_employee_screen.dart';
import 'package:untitled/modules/employee/show/cubit/show_employee_cubit.dart';

import '../../modules/admin/show_admins/cubit/show_admin_cubit.dart';
import 'components.dart';
Widget ShowEmployeeItem(w, employee, index, context) => Container(
  width: 4 / 5 * w,
  height: 50,
  decoration: BoxDecoration(
      color: index % 2 == 0 ? Colors.white : Colors.grey[200]!,
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            blurRadius: 20) //blur radius of shadow
      ]),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      children: [
        Expanded(
            child: Center(
              child: Text('${employee.employeeId}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
            child: Center(
              child: Text('${employee.firstName}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
          child: Center(child: Text('${employee.lastName}')),
        ),
 Expanded(
            child: Center(
              child: Text('${employee.job}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
          child: Center(child: Text('${employee.address}')),
        ),
        Expanded(
          child: Center(child: Text('${employee.phoneNumber}')),
        ),
        Expanded(
          child: Center(
            child: defaultButton(
              onPressed: () {
                navigateTo(context,AddEmployee());
              },
              height: 30,
              text: 'Edit',
              fontsize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),

      ],
    ),
  ),
);
Widget ShowEmployeeBuilder(w, employes, context, state) => ConditionalBuilder(
  condition: state is! ShowEmployeeLoadingState && employes != null,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          ShowEmployeeItem(w, employes[index], index, context),
      separatorBuilder: (context, index) {
        return MyDivider();
      },
      itemCount: employes.length),
  fallback: (context) => Center(child: LinearProgressIndicator()),
);