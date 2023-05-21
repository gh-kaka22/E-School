import 'package:flutter/material.dart';
import 'package:untitled/styles/colors.dart';
Widget DrawerOfDesktop ( {
 required String text,
  double fontsize = 23,
  FontWeight fontWeight = FontWeight.w400,
 Color color=kGold1Color,
 Color iconcolor=kDarkBlue2Color,
})=>  Card(
 elevation: 5,
  child:   ExpansionTile(title: Text(text,style: TextStyle(color: kDarkBlue2Color,fontSize: fontsize,fontWeight: fontWeight),

  ),
  
  collapsedIconColor: iconcolor ,
  
  iconColor: color,

  childrenPadding: EdgeInsets.only(left: 20,),
  
  children: [
  
  ListTile(
  
  title: Text('Add'),
  
  
  
  
  
  onTap: (){},
  
  ),
  
  ListTile(
  
  title: Text('Delete'),
  
  onTap: (){},
  
  ),
  
  ListTile(
  
  title: Text('Show'),
  
  onTap: (){},
  
  )
  
  ],
  
  
  
  ),
);
