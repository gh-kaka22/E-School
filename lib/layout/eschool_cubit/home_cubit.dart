import 'package:bloc/bloc.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/modules/dashboard/dashboard.dart';
import 'package:untitled/modules/statistics/stats_screen.dart';
import 'package:untitled/modules/students/register/register_screen.dart';
import 'package:untitled/styles/colors.dart';
part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  Widget currentScreen = StatsScreen();

  //void changeScreen(Widget screen)
  //{
  //currentScreen= screen;
  //emit(HomeChangeScreenState());
  //}

  Widget SideBarItem({
    required String text,
    required Widget showScreen,
    required Widget addScreen,
    double fontsize = 23,
    FontWeight fontWeight = FontWeight.w400,
    Color color = kGold1Color,
    Color iconcolor = kDarkBlue2Color,
  }) =>
      Card(
        elevation: 5,
        child: ExpansionTile(
          title: Text(
            text,
            style: TextStyle(
                color: kDarkBlue2Color,
                fontSize: fontsize,
                fontWeight: fontWeight),
          ),
          collapsedIconColor: iconcolor,
          iconColor: color,
          childrenPadding: EdgeInsets.only(
            left: 20,
          ),
          children: [
            ListTile(
              title: Text('Show'),
              onTap: () {
                currentScreen = showScreen;
                emit(HomeChangeScreenState());
              },
            ),
            ListTile(
              title: Text('Add'),
              onTap: () {
                currentScreen = addScreen;
                emit(HomeChangeScreenState());
              },
            ),
          ],
        ),
      );

  Widget SpecialSideBarItem({
    required String text,
    required Widget screen,
    double fontsize = 23,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      Card(
        elevation: 5,
        child: InkWell(
          onTap: () {
            currentScreen = screen;
            emit(HomeChangeScreenState());
          },
          child: ListTile(
            title: Text(
              text,
              style: TextStyle(
                  color: kDarkBlue2Color,
                  fontSize: fontsize,
                  fontWeight: fontWeight),
            ),
          ),
        ),
      );
}
