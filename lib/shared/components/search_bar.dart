
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/styles/colors.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/3,
      height: 50,
      child: Row(
        children: <Widget>[
          Container(
            height:50 ,
            width: MediaQuery.of(context).size.width/5,
            padding: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: kSearchBackgroundColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'Search for students...',
                ),
              ),
            ),
          ),
          MaterialButton(
            height: 50,
            onPressed: () {
            },
            color: kGold1Color,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
