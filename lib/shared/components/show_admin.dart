import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modules/admin/show_admins/cubit/show_admin_cubit.dart';
import 'components.dart';
Widget ShowAdminsItem(w, admin, index, context) => Container(
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
              child: Text('${admin.id}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
            child: Center(
              child: Text('${admin.firstName}',
                  style: TextStyle(overflow: TextOverflow.ellipsis)),
            )),
        Expanded(
          child: Center(child: Text('${admin.lastName}')),
        ),

      ],
    ),
  ),
);
Widget ShowAdminsBuilder(w, admins, context, state) => ConditionalBuilder(
  condition: state is! ShowAdminLoadingState && admins != null,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          ShowAdminsItem(w, admins[index], index, context),
      separatorBuilder: (context, index) {
        return MyDivider();
      },
      itemCount: admins.length),
  fallback: (context) => Center(child: LinearProgressIndicator()),
);