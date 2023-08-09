
import 'package:e_school/modules/posts_parent/cubit/parent_posts_cubit.dart';
import 'package:e_school/modules/posts_parent/cubit/parent_posts_states.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParentPostsScreen extends StatelessWidget {
  Future<void> _refresh(){
    return Future.delayed(Duration(seconds: 2));
  }


  @override
  Widget build(BuildContext context) {
    var commentController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => ParentPostsCubit()..getParentPosts(kidID),
      child: BlocConsumer<ParentPostsCubit, ParentPostsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ParentPostsCubit.get(context);
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
                   RefreshIndicator(
                     onRefresh: _refresh,
                     child: PostsBuilder(
                         cubit.postsModel?.data,
                         cubit,
                         context,
                         state,

                     ),
                   )
                  ],
                ),
              ),
            );
  }
    ));

}}
