import 'package:e_school/modules/teacher/profie_teacher/cubit/profile_teacher_cubit.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTeacher extends StatelessWidget {
  ProfileTeacher({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ProfileTeacherCubit()..getTeacherProfile(1),
      child: BlocConsumer<ProfileTeacherCubit, ProfileTeacherState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProfileTeacherCubit.get(context);
          List item = [
            {
              "desc": "First Name :",
              "text": "${cubit.profileTeacher?.data?.firstName}",
            },
            {
              "desc": "Last Name :",
              "text": "${cubit.profileTeacher?.data?.lastName}",
            },
            {
              "desc": "Phone Number :",
              "text": "${cubit.profileTeacher?.data?.phoneNumber}",
            },
            {
              "desc": "Email:",
              "text": "${cubit.profileTeacher?.data?.email}",
            },
            {
              "desc": "Subject :",
              "text": "${cubit.profileTeacher?.data?.subjectName}",
            },
            {
              "desc": "Details :",
              "text": "${cubit.profileTeacher?.data?.details}",
            },
            {
              "desc": "Address :",
              "text": "${cubit.profileTeacher?.data?.address}",
            },
            {
              "desc": "Classrooms :",
              "text": "${cubit.profileTeacher?.data?.classrooms.toString()}",
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
                          color: kDarkBlue2Color,
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
                                  cubit.profileTeacher?.data?.subjectId == 0
                                      ? 'assets/icons/graduating-student-g.png'
                                      : 'assets/icons/graduating-student-b.png',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${cubit.profileTeacher?.data?.firstName} ${cubit.profileTeacher?.data?.lastName}',
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
                            Text(
                              item[index]['desc'],
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
