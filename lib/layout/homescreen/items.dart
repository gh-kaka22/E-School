import 'package:flutter/material.dart';

import '../../styles/colors.dart';



class Items extends StatelessWidget {
  var _title;

  var _bgColor;

  Items(this._title, this._bgColor);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: <Widget>[
          Card(
            shadowColor: Colors.black,
            elevation: 10.0,


            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children:[
                Opacity(opacity: 0.7,child:  Container(
                  height:   (MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width / 5)/6,
                  width:  (MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width / 5)/4,

                  decoration: BoxDecoration(
                    color: _bgColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: kGold1Color,
                        blurRadius: 5.0,
                        offset: Offset(0.5, 0.5),

                      ),

                    ],
                  ),


                ),),


    ],
            ),
          ),
        ],
      ),
    );
  }
}
//  Opacity(opacity: 0.7,child: Container(
//                   width:  (MediaQuery.of(context).size.width -
//                       MediaQuery.of(context).size.width / 5)/4,
//                   height:( (MediaQuery.of(context).size.width -
//                       MediaQuery.of(context).size.width / 5)/28) ,
//                   child: Center(
//                     child: Text(_title,
//                     style: TextStyle(
//                       fontSize: 30,
//                     ),
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                     color: kGold1Color,
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                 ),),