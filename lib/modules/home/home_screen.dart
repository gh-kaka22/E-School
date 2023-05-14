import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_school/modules/Timetable/timetable_screen.dart';
import 'package:e_school/modules/attendance/attendance_screen.dart';
import 'package:e_school/modules/exams/exams_screen.dart';
import 'package:e_school/shared/components/category_card.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';

List<CategoryCard> categories =[
  CategoryCard('Attendance', 'assets/icons/attendance.png', kWhiteColor,AttendanceScreen()),
  CategoryCard('Exams', 'assets/icons/exam.png', kWhiteColor,ExamsScreen()),
  CategoryCard('Schedule', 'assets/icons/schedule.png', kWhiteColor,TimetableScreen()),
  CategoryCard('Library', 'assets/icons/bookshelf.png', kWhiteColor,AttendanceScreen()),
  CategoryCard('Discipline', 'assets/icons/behavior.png', kWhiteColor,AttendanceScreen()),
  CategoryCard('Education', 'assets/icons/homework.png', kWhiteColor,AttendanceScreen()),
];
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
                children:[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Background.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3.5,
                      decoration: BoxDecoration(
                        color: kDarkBlue2Color.withOpacity(0.6),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25, left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.cyan,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3, left: 3),
                                  child: CircleAvatar(
                                    radius: 47,
                                    backgroundColor: kYellowColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    left: 5,
                                  ),
                                  child: CircleAvatar(
                                    radius: 45,
                                    backgroundColor: kWhiteColor,
                                    child: Image.asset(
                                      'assets/icons/graduating-student-g.png',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Student Name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Grade : 6 ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Section : B ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),

                ]),
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              items: [
                Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/announcements1.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/announcements2.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/announcements3.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
              options: CarouselOptions(
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayAnimationDuration: Duration(
                  seconds: 1,
                ),
                autoPlayCurve: Curves.decelerate,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20,),
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                children: List.generate(
                  6,
                      (index) => categories[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
