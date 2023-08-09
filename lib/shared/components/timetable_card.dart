
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class TimetableCard extends StatelessWidget {
  String? subject;
  String? from;
  String? to;
  String? imageUrl;
  Color? color;

  TimetableCard({
      this.subject, this.from, this.to, this.imageUrl}){
    switch (subject) {
      case 'Math':
        imageUrl = 'assets/icons/subjects/math.png';
        color = Colors.lightGreen;
        break;
      case 'Science':
        imageUrl = 'assets/icons/subjects/science.png';
        color = Colors.orangeAccent;
        break;
      case 'Physics':
        imageUrl = 'assets/icons/subjects/test.png';
        color = Colors.teal;
        break;
      case 'Arabic':
        imageUrl = 'assets/icons/subjects/arabic.png';
        color = Colors.grey;
        break;
      case 'English':
        imageUrl = 'assets/icons/subjects/linguistics.png';
        color = Colors.red;
        break;
      case 'Geography':
        imageUrl = 'assets/icons/subjects/geo.png';
        color = Colors.blueAccent;
        break;
      case 'Music':
        imageUrl = 'assets/icons/subjects/music.png';
        color = Colors.pinkAccent;
        break;
      case 'Sport':
        imageUrl = 'assets/icons/subjects/sports.png';
        color = Colors.yellow;
        break;
      default:
        imageUrl = 'assets/icons/subjects/keys.png';
        color = Colors.purpleAccent;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: 50,
        height: 90,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kWhiteColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  blurRadius: 10) //blur radius of shadow
            ]),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    '${imageUrl}',
                    color: kWhiteColor,
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Container(
                  height: 60.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "From ${from} to ${to}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '${subject}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
