import 'package:flutter/material.dart';

import '../../styles/colors.dart';





class DrawerItems extends StatelessWidget {
  var _name;
  var _icon;

  DrawerItems(this._name, this._icon);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          _icon,
        ),
        title: Text(
          _name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: kDarkBlue2Color,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
