import 'package:e_school/modules/teacher/posts_teacher/add/cubit/create_post_cubit.dart';
import 'package:e_school/modules/teacher/posts_teacher/add/cubit/create_post_states.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/components/posts_components.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePost extends StatelessWidget {

  var bodyController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => CreatePostCubit()..getClassrooms(),
      child: BlocConsumer<CreatePostCubit, CreatePostStates>(
        listener: (context, state) {
          if (state is CreatePostSuccessState) {
            if (state.createPostModel.status ?? true) {
              showToast(text: 'Post Sent.', state: ToastStates.SUCCESS);
              Navigator.pop(context);
            } else {
              showToast(text: '${state.createPostModel.message}', state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          var cubit = CreatePostCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('New Post'),
            ),
            body: Container(

              decoration: BoxDecoration(
                color: Colors.white24,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        height: h / 10,
                      ),
                      Form(
                        key: formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "To: ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: kDarkBlue2Color),
                                ),
                                SizedBox(
                                  width: w / 40,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: kDarkBlue2Color,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: DropdownButton<dynamic>(
                                      value: cubit.dropDownValueSection,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: kGold1Color,
                                      ),
                                      iconSize: 24,
                                      elevation: 40,
                                      borderRadius: BorderRadius.circular(40),
                                      underline: SizedBox(),
                                      hint: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
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
                          ? Center(
                            child: ElevatedButton(
                                child:Text ('Send'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: kWhiteColor,//change background color of button
                              backgroundColor: kDarkBlue2Color,//change text color of button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              elevation: 15.0,
                            ),

                                onPressed: () {
                                  cubit.CreatePostByTeacher(
                                    body: bodyController.text,
                                    classroomId: cubit.dropDownValueSection,
                                  );
                                  }),
                          )
                          : Center(child: CircularProgressIndicator()),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
