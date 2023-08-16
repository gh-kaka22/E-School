
import 'package:e_school/language/language_constants.dart';
import 'package:e_school/modules/posts_teacher/cubit/teacher_posts_cubit.dart';
import 'package:e_school/modules/posts_teacher/cubit/teacher_posts_states.dart';
import 'package:e_school/modules/teacher/posts_teacher/add/create_post.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherPostsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => TeacherPostsCubit()..getTeacherPosts(),
      child: BlocConsumer<TeacherPostsCubit, TeacherPostsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = TeacherPostsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(onPressed: (){
                    navigateTo(context, CreatePost());
                  }, icon: Icon(Icons.add,color: kTeal,))
                ],
                backgroundColor: kDarkWhiteColor,
                title: Text(translation(context).timeline,style: TextStyle(color: kDarkBlue2Color),),
              ),
              backgroundColor: kDarkWhiteColor,
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                   PostsBuilder(
                       cubit.postsModel?.data,
                       cubit,
                       context,
                       state,

                   )
                  ],
                ),
              ),
            );
  }
    ));

}}
