import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/classrooms/show/cubit/show_classrooms_cubit.dart';
import 'package:untitled/modules/classrooms/show/cubit/show_classrooms_states.dart';
import 'package:untitled/modules/news/show/cubit/get_posts_cubit.dart';
import 'package:untitled/modules/news/show/cubit/get_posts_states.dart';

import 'package:untitled/shared/components/components.dart';

import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/styles/colors.dart';


class GetPosts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => GetPostsCubit()..getPosts(),
      child: BlocConsumer<GetPostsCubit, GetPostsStates>(
        listener: (context, state) {
          if (state is CreateCommentsSuccessState) {
            if(state.createCommentModel.status == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content:
                  Center(
                    child: Text(
                        'Comment Sended Successfully',
                        style: TextStyle(color: Colors.white)),
                  )));
            } else  {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                    child: Text(
                      'Failed Sending Comment',
                      style: TextStyle(color: Colors.white),
                    ),
                  )));

            }}
        },
        builder: (context, state) {
          var cubit = GetPostsCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 4 / 5 * w,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Timeline",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w400,
                            color: kDarkBlue2Color,
                          ),
                        ),
                        SizedBox(width: 30,),
                        Icon(Icons.newspaper_rounded,size: 50,color: kGold1Color,),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    PostsBuilder(
                      cubit.postsModel?.data,
                      cubit,
                      context,
                      state,
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
