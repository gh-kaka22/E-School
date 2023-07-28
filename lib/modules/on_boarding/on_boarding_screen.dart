import 'package:e_school/layout/home_layout/home_layout.dart';
import 'package:e_school/layout/home_layout/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/components/components.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/styles/colors.dart';
import '../attendance/attendance_screen.dart';
import '../school_login/login_screen.dart';

class BoardingModel{
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}


class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardingController = PageController();

  List<BoardingModel> boarding =[
    BoardingModel(
      image: 'assets/images/onboard1.jpg',
      title: 'Welcome Back to School',
      body: 'Have an Exceptional School Experiment...',
    ),
    BoardingModel(
      image: 'assets/images/onboard2.jpg',
      title: 'Track Your Exams Marks',
      body: 'With One Tap...',
    ),
    BoardingModel(
      image: 'assets/images/onboard3.jpg',
      title: 'Manage Your Schedule',
      body: 'To Make Sure You\'re on Time...',
    ),
  ];

  bool isLast = false;
   void submit()
   {
     CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
       navigateAndFinish(context, SchoolLoginScreen());
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        actions: [
          TextButton(
            onPressed: (){
              submit();
            },
            child: Text(
              'SKIP',
              style: TextStyle(
                color: kGold1Color,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardingController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buildOnboardItem(boarding[index]),
                itemCount: boarding.length,
                onPageChanged: (index){
                  if(index==boarding.length - 1)
                  {
                    setState(() {
                      isLast=true;
                    });
                  } else {
                    setState(() {
                      isLast=false;
                    });
                  }
                },
              ),
            ),

            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardingController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    expansionFactor: 3,
                    activeDotColor: kGold1Color,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                    onPressed: ()
                    {
                      if(isLast)
                      {
                       submit();
                      } else {
                        boardingController.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child:Icon(Icons.arrow_forward_ios)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnboardItem(BoardingModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 24.0,

        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 14.0,

        ),
      ),
      SizedBox(
        height: 15.0,
      ),
    ],
  );
}


