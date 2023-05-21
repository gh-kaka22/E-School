import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import 'draweritems.dart';
import 'items.dart';


List<DrawerItems> drawer = [
  DrawerItems('Dashboard', Icons.home),
  DrawerItems('Students', Icons.pedal_bike_sharp),
  DrawerItems('Teachers', Icons.person),
  DrawerItems('Subjects', Icons.backpack_rounded),
  DrawerItems('Classes', Icons.account_balance),
  DrawerItems('Books', Icons.book_outlined),
  DrawerItems('Timetables', Icons.timelapse),
  DrawerItems('Attendance', Icons.attach_file_outlined),
  DrawerItems('News', Icons.newspaper),
  DrawerItems('Setting', Icons.settings),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kDarkBlue2Color,
      ),
      body: Stack(
        children: [
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 5,
                color: Colors.white24,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Image.asset('assets/icons/E-School.png'),
                    ),
                    GridView.count(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 1,
                      // mainAxisSpacing: 10.0,
                      //crossAxisSpacing: 10.0,
                      childAspectRatio: 5,
                      children: List.generate(
                        drawer.length,
                        (index) => drawer[index],
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
// SingleChildScrollView(
//   child: Container(
//     height: MediaQuery.of(context).size.height,
//     width: MediaQuery.of(context).size.width -
//         MediaQuery.of(context).size.width / 5,
//     color: Colors.white24,
//     // child: GridView.count(
//     //   physics: BouncingScrollPhysics(),
//     //   shrinkWrap: true,
//     //   crossAxisCount: 10,
//     //   // mainAxisSpacing: 30.0,
//     //   //crossAxisSpacing: 30.0,
//     //   children: List.generate(
//     //     items.length,
//     //     (index) => items[index],
//     //   ),
//     // ),
//   ),
// ),
// List<Items> items = [
//   Items('Attendance', kDarkBlue2Color),
//   Items('Exams', kDarkBlue2Color),
//   Items('Schedule', kDarkBlue2Color),
//   Items('Library', kDarkBlue2Color),
//   Items('Discipline', kDarkBlue2Color),
//   Items('Education', kDarkBlue2Color),
//   Items('Attendance', kDarkBlue2Color),
//   Items('Exams', kDarkBlue2Color),
//   Items('Schedule', kDarkBlue2Color),
//   Items('Library', kDarkBlue2Color),
//   Items('Discipline', kDarkBlue2Color),
//   Items('Education', kDarkBlue2Color),
//   Items('Attendance', kDarkBlue2Color),
//   Items('Exams', kDarkBlue2Color),
//   Items('Schedule', kDarkBlue2Color),
//   Items('Library', kDarkBlue2Color),
//   Items('Discipline', kDarkBlue2Color),
//   Items('Education', kDarkBlue2Color),
//   Items('Attendance', kDarkBlue2Color),
//   Items('Exams', kDarkBlue2Color),
//   Items('Schedule', kDarkBlue2Color),
//   Items('Library', kDarkBlue2Color),
//   Items('Discipline', kDarkBlue2Color),
//   Items('Education', kDarkBlue2Color),
//   Items('Attendance', kDarkBlue2Color),
//   Items('Exams', kDarkBlue2Color),
//   Items('Schedule', kDarkBlue2Color),
//   Items('Library', kDarkBlue2Color),
//   Items('Discipline', kDarkBlue2Color),
//   Items('Education', kDarkBlue2Color),
//   Items('Attendance', kDarkBlue2Color),
//   Items('Exams', kDarkBlue2Color),
//   Items('Schedule', kDarkBlue2Color),
//   Items('Library', kDarkBlue2Color),
//   Items('Discipline', kDarkBlue2Color),
//   Items('Education', kDarkBlue2Color),
//   Items('Attendance', kDarkBlue2Color),
//   Items('Exams', kDarkBlue2Color),
//   Items('Schedule', kDarkBlue2Color),
//   Items('Library', kDarkBlue2Color),
//   Items('Discipline', kDarkBlue2Color),
//   Items('Education', kDarkBlue2Color),
//   Items('Attendance', kDarkBlue2Color),
//   Items('Exams', kDarkBlue2Color),
//   Items('Schedule', kDarkBlue2Color),
//   Items('Library', kDarkBlue2Color),
//   Items('Discipline', kDarkBlue2Color),
//   Items('Education', kDarkBlue2Color),
// ];