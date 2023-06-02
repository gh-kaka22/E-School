import 'package:e_school/modules/profile/cubit/profile_cubit.dart';
import 'package:e_school/modules/profile/cubit/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/colors.dart';


class ProfileStudent extends StatelessWidget {

  ProfileStudent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=>ProfileCubit()..getProfileData(),
    child: BlocConsumer<ProfileCubit,ProfileStates>(
        listener: (context, state){},
      builder: (context,state){
          var cubit = ProfileCubit.get(context);
          List item = [
            {
              "desc":"E-Mail :",
              "text": "${cubit.profileModel?.data?.email}",
            },
            {
              "desc":"Password :",
              "text": "${cubit.profileModel?.data?.password}",
            },
            {
              "desc":"Grade :",
              "text": "${cubit.profileModel?.data?.grade_id}",
            },
            {
              "desc":"Classroom :",
              "text": "${cubit.profileModel?.data?.classroom}",
            },
            {
              "desc":"Date of Birth :",
              "text": "${cubit.profileModel?.data?.date_of_birth}",
            },
            {
              "desc":"Father Name :",
              "text": "${cubit.profileModel?.data?.father_first_name}",
            },
            {
              "desc":"Mother Name :",
              "text": "${cubit.profileModel?.data?.mother_first_name}",
            },
            {
              "desc":"Religion :",
              "text": "${cubit.profileModel?.data?.religion}",
            },
            {
              "desc":"Address :" ,
              "text": "${cubit.profileModel?.data?.address}",
            },
          ];
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
                                backgroundImage: AssetImage(
                                  cubit.profileModel?.data?.gender_id == 0 ?
                                  'assets/icons/graduating-student-g.png':
                                  'assets/icons/graduating-student-b.png',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${cubit.profileModel?.data?.first_name} ${cubit.profileModel?.data?.last_name}',
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
                            Expanded(
                              child: Text(
                                item[index]['text'],
                                overflow: TextOverflow.ellipsis,

                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),


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
      },
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
