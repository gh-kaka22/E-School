import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/news/add/cubit/create_post_cubit.dart';
import 'package:untitled/modules/news/add/cubit/create_post_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/styles/colors.dart';
import '../../../shared/components/components.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bodyController = TextEditingController();

    var formkey = GlobalKey<FormState>();
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return BlocProvider(
      create: (context) => CreatePostCubit()..getClassrooms(),
      child: BlocConsumer<CreatePostCubit, CreatePostStates>(
        listener: (context, state) {
          if (state is CreatePostSuccessState) {
            if(state.createPostModel.status == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content:
                  Center(
                    child: Text(
                        '${state.createPostModel.message}',
                        style: TextStyle(color: Colors.white)),
                  )));
            } else  {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                    child: Text(
                      '${state.createPostModel.message}',
                      style: TextStyle(color: Colors.white),
                    ),
                  )));

            }}
        },
        builder: (context, state) {
          var cubit = CreatePostCubit.get(context);
          return Container(
            width: w - (w / 5) - 5,
            decoration: BoxDecoration(
              color: Colors.white24,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Add New Post: ",
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: kDarkBlue2Color),
                    ),
                  ),
                  SizedBox(
                    height: h / 10,
                  ),
                  Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "To: ",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: kDarkBlue2Color),
                            ),
                            SizedBox(
                              width: w / 40,
                            ),
                            Container(
                              width: w / 7,
                              child: CheckboxListTile(
                                checkColor: Colors.white,
                                activeColor: kDarkBlue2Color,
                                title: Center(
                                  child: Text(
                                    'General',
                                    style: TextStyle(
                                      color: kGold1Color,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                value: cubit.isCheckedGeneral,
                                onChanged: cubit.changeCheck,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kDarkBlue2Color,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            SizedBox(
                              width: w / 40,
                            ),
                            Visibility(
                              visible: !cubit.isCheckedGeneral,
                              child: Container(
                                width: w / 7,
                                child: CheckboxListTile(
                                  checkColor: Colors.white,
                                  activeColor: kDarkBlue2Color,
                                  title: Center(
                                    child: Text(
                                      'Grade',
                                      style: TextStyle(
                                        color: kGold1Color,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  value: cubit.isCheckedGrade,
                                  onChanged: cubit.changeCheckGrade,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kDarkBlue2Color,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: w / 40,
                            ),
                            Visibility(
                              visible: !cubit.isCheckedGeneral && !cubit.isCheckedGrade,
                              child: Container(
                                width: w / 7,
                                child: CheckboxListTile(
                                  checkColor: Colors.white,
                                  activeColor: kDarkBlue2Color,
                                  title: Center(
                                    child: Text(
                                      'Classroom',
                                      style: TextStyle(
                                        color: kGold1Color,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  value: cubit.isCheckedClassroom,
                                  onChanged: cubit.changeCheckClassroom,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kDarkBlue2Color,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: w / 40,
                            ),
                            Visibility(
                              visible: cubit.isCheckedGrade && !cubit.isCheckedGeneral ,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kDarkBlue2Color,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: DropdownButton<String>(
                                    value: cubit.grade,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: kGold1Color,
                                    ),
                                    iconSize: 24,
                                    elevation: 40,
                                    borderRadius: BorderRadius.circular(40),

                                    underline: Container(),

                                    hint: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20
                                      ),
                                      child: Text(
                                        'Choose Grade',
                                        style: TextStyle(
                                            color: kDarkBlue2Color,
                                            fontSize: 16),
                                      ),
                                    ),
                                    //  style: ,
                                    onChanged: (value) {
                                      cubit.changeGradeDropDownButton(value!);
                                    },

                                    items: cubit.GradeItems,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: w / 40,
                            ),
                            Visibility(
                              visible: cubit.isCheckedClassroom && !cubit.isCheckedGrade && !cubit.isCheckedGeneral,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kDarkBlue2Color,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: DropdownButton<String>(
                                    value: cubit.dropDownValueSection,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: kGold1Color,
                                    ),
                                    iconSize: 24,
                                    elevation: 40,
                                    borderRadius: BorderRadius.circular(40),

                                    underline: Container(),

                                    hint: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20
                                      ),
                                      child: Text(
                                        'Choose Classroom',
                                        style: TextStyle(
                                            color: kDarkBlue2Color,
                                            fontSize: 16),
                                      ),
                                    ),
                                    //  style: ,
                                    onChanged: (value) {
                                      cubit.changeSectionDropDownButton(value!);
                                    },

                                    items: cubit.menuItemsSection,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 15,
                        ),
                        buildPostForm(
                          bordercolor: Colors.grey,
                          controller: bodyController,
                          labeltext: 'New Post',
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                  ),
                  state is! CreatePostLoadingState
                      ? defaultButton(
                      text: 'Send',
                      width: w / 5,
                      height: h / 20,
                      onPressed: () {
                        if(cubit.isCheckedGeneral)
                          {
                            cubit.CreatePostSchool(
                                body: bodyController.text,
                                token: token
                            );
                          } else
                        if(cubit.isCheckedGrade)
                        {
                          cubit.CreatePostGrade(
                              body: bodyController.text,
                              gradeId: cubit.grade,
                              token: token
                          );
                        } else
                        if(cubit.isCheckedClassroom)
                        {
                          cubit.CreatePostClassroom(
                              body: bodyController.text,
                              classroomId: cubit.dropDownValueSection,
                              token: token
                          );
                        }

                      })
                      : Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}



