import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  var _title;
  var _imageUrl;
  var _bgColor;
  Widget widget;

  CategoryCard(this._title, this._imageUrl, this._bgColor, this.widget);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, widget);
      },
      child: Container(
        width: 160,
        height: 160,
        child: Stack(
          children: <Widget>[
            Card(
              shadowColor: Colors.black,
              elevation: 20.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: 110,
                height: 110,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    _title,
                    style: TextStyle(
                      color: kTitleTextColor,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 28,
              top: 15,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: _bgColor,
                  borderRadius: BorderRadius.circular(20),

                ),
                child: Image.asset(
                  _imageUrl,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
