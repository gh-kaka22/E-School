import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';


class ProfileStudent extends StatelessWidget {
  List item = [

    {
      "desc":"Father Name :",
      "text": "Rafiq",
    },
    {
      "desc":"Mother Name :",
      "text": "Ghofran",
    },
    {
      "desc":"Password :",
      "text": "1234567",
    },
    {
      "desc":"Relegion :",
      "text": "Muslim",
    },
    {
      "desc":"Date of Birth :",
      "text": "21/7/2000",
    },
    {
      "desc":"Address :" ,
      "text": "Homs",
    },
    {
      "desc":"Grade :",
      "text": "2",
    },

  ];
  ProfileStudent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              child: Stack(children: [
                Container(),
                ClipPath(
                  clipper: Myclip(),
                  child: Container(
                    height: 250,
                    color:kDarkBlue2Color,
                  ),
                ),
                SafeArea(
                    child: IconButton(
                      onPressed: () {},
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                    )),
                Align(
                  alignment: Alignment(0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 70,
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('\assets\images\woman.png'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Maysa droubi',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 25,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(item[index]['desc'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: kDarkBlue2Color,
                        ),

                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        item[index]['text'],

                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),


                      ),
                    ],
                  ),
                ),
                shadowColor: Colors.indigoAccent,
              ),
              itemCount: item.length,
              shrinkWrap: true,
              padding: EdgeInsets.all(15),
            )
          ],
        ),
      ),
    );
  }
}

class Myclip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 160);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
