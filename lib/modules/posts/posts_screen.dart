import 'package:e_school/models/posts_model.dart';
import 'package:e_school/modules/posts/cubit/posts_cubit.dart';
import 'package:e_school/modules/posts/cubit/posts_states.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var commentController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => PostsCubit()..getPosts(),
      child: BlocConsumer<PostsCubit, PostsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = PostsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kDarkWhiteColor,
                title: Text('Timeline',style: TextStyle(color: kDarkBlue2Color),),
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
