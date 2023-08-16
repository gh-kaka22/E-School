import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:e_school/language/language_constants.dart';
import 'package:e_school/modules/library/cubit/library_states.dart';
import 'package:e_school/modules/posts/cubit/posts_states.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';


import '../styles/colors.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = defaultColor,
  bool isUpperCase = true,
  double height = 20,
  required Function onPressed,
  required String text,
  double radius = 0.0,
  double fontsize = 23,
  FontWeight fontWeight = FontWeight.w400,
  Color buttColor = kDarkBlue2Color,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: onPressed(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: kDarkBlue2Color,

      ),
    );
////////////////////////

Widget defaultButton2({
  double width = 100,
  required void Function() onPressed,
  double height = 20,
  Color buttColor = kDarkBlue2Color,
  Color colortext = Colors.white,
  double fontsize = 20,
  FontWeight fontWeight = FontWeight.w300,
  required String text,
}) =>
    Center(
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: buttColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kGold1Color, width: 3),
          ),
          child: MaterialButton(
            onPressed: onPressed,
            child: Text(
              text.toUpperCase(),
              style: TextStyle(
                fontWeight: fontWeight,
                color: colortext,
                fontSize: fontsize,
              ),
            ),
          )),
    );


/////

Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: function(),
      child: Text(text.toUpperCase()),
    );

////

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  ValueChanged? onChange,
  VoidCallback? suffixPressed,
  FormFieldValidator? validate,
  required String label,
   IconData? prefix,
  IconData? suffix,
  bool isPassword = false,
}) =>
    TextFormField(
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        validator: validate,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(prefix),
          suffixIcon: suffix != null
              ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: kSearchTextColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.indigo),
          ),
        ));

/////

Widget MyDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey,
      ),
    );

////

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://static.vecteezy.com/system/resources/thumbnails/004/216/831/original/3d-world-news-background-loop-free-video.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
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
    );

////

Widget articlesBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => MyDivider(),
        itemCount: 10,
      ),
      fallback: (context) => isSearch
          ? Container()
          : Center(
              child: CircularProgressIndicator(),
            ),
    );

////

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

////

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

////

void showToast({required String? text, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: text!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

////

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.orange.shade900;
      break;
  }
  return color;
}

////

Widget TimetableItemBuilder(imageUrl,from,to,subject) => Padding(
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
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    imageUrl,
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
                        "From ${from}:00 am to ${to}:00 am",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        subject,
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



Widget timetableBuilder(periods,day, context,) => ConditionalBuilder(
  condition: day != 5,
  builder: (context) => ListView.builder(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) => periods[index],
    itemCount: 6,
  ),
  fallback: (context) => ListView.builder(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) => periods[index],
    itemCount: 7,
  ),
);


Widget buildPostItem(post,context,cubit,state) => Card(
  clipBehavior: Clip.antiAliasWithSaveLayer,
  elevation: 7.0,
  margin: EdgeInsets.symmetric(horizontal: 8.0),
  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundColor: kWhiteColor,
              backgroundImage: post.publisher=='E-School' ? AssetImage('assets/icons/Blue-Icon.jpg') :AssetImage('assets/icons/teacher.png'),
            ),
            SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${post.publisher}',
                        style: TextStyle(
                            height: 1.3
                        ),
                      ),
                      SizedBox(width: 8.0,),
                      post.publisher=='E-School' ?
                      Icon(Icons.verified,color: Colors.lightBlue,size: 16,):
                      SizedBox(width: 1.0,),
                    ],
                  ),
                  Text(
                      '${post.date}',
                      style:Theme.of(context).textTheme.bodySmall!.copyWith(height: 1.3)
                  ),
                ],
              ),
            ),
            post.isMine == true ?
            Expanded(
              child: Row(
                children: [
                  Spacer(),
                  InkWell(
                    onTap: (){
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(''),
                            content: SizedBox(
                                width: 40,
                                height: 80,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    InkWell(
                                        onTap:(){
                                          var editedPostController = TextEditingController(text: '${post.body}');
                                          showDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Edit Post:'),
                                                content: SizedBox(
                                                  width: double.maxFinite,
                                                  child: defaultFormField(
                                                      type: TextInputType.text,
                                                      label: 'type here',
                                                      controller: editedPostController
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text('OK'),
                                                    onPressed: () {
                                                      cubit.editPost(
                                                          postId : post.postId,
                                                          body : editedPostController.text,
                                                          token : token
                                                      );
                                                      cubit.getTeacherPosts();
                                                      Navigator.of(context).pop();
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Text('Edit Post',style: TextStyle(color: Colors.orange),)),
                                    SizedBox(height: 20,),
                                    InkWell(
                                        onTap:(){
                                          showDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Are You Sure'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text('Delete'),
                                                    onPressed: () {
                                                      cubit.deletePost(post.postId);
                                                      cubit.getTeacherPosts();
                                                      Navigator.of(context).pop();
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text('Cancel'),
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Text('Delete Post',style: TextStyle(color: Colors.red))),
                                  ],
                                )
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                          'assets/icons/dots.png'
                      ),
                    ),
                  )
                ],
              ),
            ) :
            SizedBox()
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 15.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        Text(
          '${post.body}',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.3,fontSize: 14,fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap:(){
                    cubit.getLikes(post.postId);
                    Future.delayed(Duration(seconds: 1), () {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(translation(context).likescreen),
                            content: SizedBox(
                              width: double.maxFinite,
                              child: ConditionalBuilder(
                                condition: cubit.likes != null ,
                                builder: (context) => ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: cubit.likes.length,
                                  separatorBuilder: (BuildContext context, int index) => Divider(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListTile(
                                      leading: CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: kWhiteColor,
                                        backgroundImage: commentImage(cubit.likes[index].role),
                                      ),
                                      title: Text(cubit.likes[index].publisher),
                                      trailing: Icon(
                                        Icons.thumb_up,
                                        size: 16.0,
                                        color: Colors.blue,
                                      ),
                                    );
                                  },
                                ),
                                fallback: (context) => Center(child: Text(translation(context).nolikes)),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  cubit.likes = null;
                                },
                              ),
                            ],
                          );
                        },
                      );
                    });

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.thumb_up_outlined,
                          size: 16.0,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          '${post.likesCount} ${translation(context).likes}',
                          style: Theme.of(context).textTheme.bodySmall,

                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap:() {
                    cubit.getComments(post.postId);
                    Future.delayed(Duration(seconds: 1), () {
                      showDialog<Future<void>>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(translation(context).commentsscreen),
                            content: SizedBox(
                              width: double.maxFinite,
                              child: ConditionalBuilder(
                                condition: cubit.comments != null ,
                                builder: (context) => ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: cubit.comments.length,
                                  separatorBuilder: (BuildContext context, int index) => SizedBox(height: 20,),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius: BorderRadius.circular(10.0), // set the radius of the corners
                                          border: Border.all(
                                            color: Colors.grey[300]!, // set the color of the border
                                            width: 1.0, // set the width of the border
                                          ),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: Color.fromRGBO(0, 0, 0, 0.2),
                                                blurRadius: 5) //blur radius of shadow
                                          ]
                                      ),
                                      child: ListTile(
                                          leading: CircleAvatar(
                                            radius: 20.0,
                                            backgroundColor: kWhiteColor,
                                            backgroundImage: commentImage(cubit.comments[index].role),
                                          ),
                                          title: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(cubit.comments[index].publisher,),
                                              Text(cubit.comments[index].body,style: TextStyle(fontSize: 13),),
                                            ],
                                          ),
                                          subtitle: Text(
                                              '${cubit.comments[index].date}',
                                              style:Theme.of(context).textTheme.bodySmall!.copyWith(height: 1.3)
                                          ),
                                          trailing:
                                          cubit.comments[index].isMine== true ?
                                          IconButton(
                                              onPressed: (){
                                                showDialog<void>(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text('What do you want to do'),
                                                      content: SizedBox(
                                                          width: 40,
                                                          height: 80,
                                                          child: Column(
                                                            children: [
                                                              SizedBox(height: 10,),
                                                              InkWell(
                                                                  onTap:(){
                                                                    var editedCommentController = TextEditingController(text: '${cubit.comments[index].body}');
                                                                    showDialog<void>(
                                                                      context: context,
                                                                      builder: (BuildContext context) {
                                                                        return AlertDialog(
                                                                          title: Text('Edit Comment:'),
                                                                          content: SizedBox(
                                                                            width: double.maxFinite,
                                                                            child: defaultFormField(
                                                                                type: TextInputType.text,
                                                                                label: 'type here',
                                                                                controller: editedCommentController
                                                                            ),
                                                                          ),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              child: Text('OK'),
                                                                              onPressed: () {
                                                                                cubit.editComment(
                                                                                    postId : post.postId,
                                                                                    commentId : cubit.comments[index].id,
                                                                                    body : editedCommentController.text,
                                                                                    token : token
                                                                                );
                                                                                //cubit.getComments(post.postId);
                                                                                Navigator.of(context).pop();
                                                                                Navigator.of(context).pop();
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Text('Edit Comment',style: TextStyle(color: Colors.orange),)),
                                                              SizedBox(height: 20,),
                                                              InkWell(
                                                                  onTap:(){
                                                                    showDialog<void>(
                                                                      context: context,
                                                                      builder: (BuildContext context) {
                                                                        return AlertDialog(
                                                                          title: Text('Are You Sure'),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              child: Text('Delete'),
                                                                              onPressed: () {
                                                                                cubit.deleteComment(cubit.comments[index].id);
                                                                                cubit.getComments(post.postId);
                                                                                post.comentsCount = post.comentsCount - 1;
                                                                                Navigator.of(context).pop();
                                                                                Navigator.of(context).pop();
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                            ),
                                                                            TextButton(
                                                                              child: Text('Cancel'),
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Text('Delete Comment',style: TextStyle(color: Colors.red))),
                                                            ],
                                                          )
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: Text('Cancel'),
                                                          onPressed: () {
                                                            Navigator.of(context).pop();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              icon: Icon(Icons.edit,color: kGold1Color,)
                                          ) :
                                          SizedBox()
                                      ),
                                    );
                                  },
                                ),
                                fallback: (context) => Center(child: Text(translation(context).nocomments)),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  cubit.comments = null;
                                },
                              ),
                            ],
                          );
                        },
                      );
                    });


                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.chat_outlined,
                          size: 16.0,
                          color: kGold1Color,
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          '${post.comentsCount} ${translation(context).comments}',
                          style: Theme.of(context).textTheme.bodySmall,

                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(bottom: 10.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap:(){
                  var commentController = TextEditingController();
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(translation(context).writeComment),
                        content: SizedBox(
                          width: double.maxFinite,
                          child: defaultFormField(
                              type: TextInputType.text,
                              label: 'type here',
                              controller: commentController
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              cubit.sendComment(
                                  postId : post.postId,
                                  body : commentController.text,
                                  token : token
                              );
                              post.comentsCount = post.comentsCount + 1;
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );

                },
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18.0,
                      backgroundColor: Colors.white,
                      backgroundImage: commentAddImage(userType),
                    ),
                    SizedBox(width: 15,),
                    Text(
                        translation(context).writeComment,
                        style:Theme.of(context).textTheme.bodySmall
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap:(){
                if(post.isLiked==false) {
                  print(post.postId);
                  cubit.Like(post.postId);
                  post.likesCount = post.likesCount + 1;
                  post.isLiked = !post.isLiked;
                }else
                {
                  print(post.postId);
                  cubit.Like(post.postId);
                  post.likesCount = post.likesCount - 1;
                  post.isLiked = !post.isLiked;
                }

              },
              child: Row(
                children: [
                  post.isLiked == false ?
                  Icon(
                    Icons.thumb_up_outlined,
                    size: 16.0,
                    color: Colors.blue,
                  ) :
                  Icon(
                    Icons.thumb_up,
                    size: 16.0,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 5.0,),
                  Text(
                    translation(context).like,
                    style: Theme.of(context).textTheme.bodySmall,

                  )
                ],
              ),
            ),
          ],
        ),


      ],
    ),
  ),
);
Widget buildHomePostItem(post,context,cubit,state) => Card(
  clipBehavior: Clip.antiAliasWithSaveLayer,
  elevation: 7.0,
  margin: EdgeInsets.symmetric(horizontal: 8.0),
  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundColor: kWhiteColor,
              backgroundImage: post.publisher=='E-School' ? AssetImage('assets/icons/Blue-Icon.jpg') :AssetImage('assets/icons/teacher.png'),
            ),
            SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${post.publisher}',
                        style: TextStyle(
                            height: 1.3
                        ),
                      ),
                      SizedBox(width: 8.0,),
                      post.publisher=='E-School' ?
                      Icon(Icons.verified,color: Colors.lightBlue,size: 16,):
                      SizedBox(width: 1.0,),
                    ],
                  ),
                  Text(
                      '${post.date}',
                      style:Theme.of(context).textTheme.bodySmall!.copyWith(height: 1.3)
                  ),
                ],
              ),
            ),
            post.isMine == true ?
            Expanded(
              child: Row(
                children: [
                  Spacer(),
                  InkWell(
                    onTap: (){
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(''),
                            content: SizedBox(
                                width: 40,
                                height: 80,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    InkWell(
                                        onTap:(){
                                          var editedPostController = TextEditingController(text: '${post.body}');
                                          showDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Edit Post:'),
                                                content: SizedBox(
                                                  width: double.maxFinite,
                                                  child: defaultFormField(
                                                      type: TextInputType.text,
                                                      label: 'type here',
                                                      controller: editedPostController
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text('OK'),
                                                    onPressed: () {
                                                      cubit.editPost(
                                                          postId : post.postId,
                                                          body : editedPostController.text,
                                                          token : token
                                                      );
                                                      cubit.getTeacherPosts();
                                                      Navigator.of(context).pop();
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Text('Edit Post',style: TextStyle(color: Colors.orange),)),
                                    SizedBox(height: 20,),
                                    InkWell(
                                        onTap:(){
                                          showDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Are You Sure'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text('Delete'),
                                                    onPressed: () {
                                                      cubit.deletePost(post.postId);
                                                      cubit.getTeacherPosts();
                                                      Navigator.of(context).pop();
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text('Cancel'),
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Text('Delete Post',style: TextStyle(color: Colors.red))),
                                  ],
                                )
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                          'assets/icons/dots.png'
                      ),
                    ),
                  )
                ],
              ),
            ) :
            SizedBox()
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 15.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        Text(
          '${post.body}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.3,fontSize: 14,fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap:(){
                    cubit.getLikes(post.postId);
                    Future.delayed(Duration(seconds: 1), () {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(translation(context).likescreen),
                            content: SizedBox(
                              width: double.maxFinite,
                              child: ConditionalBuilder(
                                condition: cubit.likes != null ,
                                builder: (context) => ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: cubit.likes.length,
                                  separatorBuilder: (BuildContext context, int index) => Divider(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListTile(
                                      leading: CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: kWhiteColor,
                                        backgroundImage: commentImage(cubit.likes[index].role),
                                      ),
                                      title: Text(cubit.likes[index].publisher),
                                      trailing: Icon(
                                        Icons.thumb_up,
                                        size: 16.0,
                                        color: Colors.blue,
                                      ),
                                    );
                                  },
                                ),
                                fallback: (context) => Center(child: Text(translation(context).nolikes)),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  cubit.likes = null;
                                },
                              ),
                            ],
                          );
                        },
                      );
                    });

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.thumb_up_outlined,
                          size: 16.0,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          '${post.likesCount} ${translation(context).likes}',
                          style: Theme.of(context).textTheme.bodySmall,

                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap:() {
                    cubit.getComments(post.postId);
                    Future.delayed(Duration(seconds: 1), () {
                      showDialog<Future<void>>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Latest Comments'),
                            content: SizedBox(
                              width: double.maxFinite,
                              child: ConditionalBuilder(
                                condition: cubit.comments != null ,
                                builder: (context) => ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: cubit.comments.length,
                                  separatorBuilder: (BuildContext context, int index) => SizedBox(height: 20,),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius: BorderRadius.circular(10.0), // set the radius of the corners
                                          border: Border.all(
                                            color: Colors.grey[300]!, // set the color of the border
                                            width: 1.0, // set the width of the border
                                          ),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: Color.fromRGBO(0, 0, 0, 0.2),
                                                blurRadius: 5) //blur radius of shadow
                                          ]
                                      ),
                                      child: ListTile(
                                          leading: CircleAvatar(
                                            radius: 20.0,
                                            backgroundColor: kWhiteColor,
                                            backgroundImage: commentImage(cubit.comments[index].role),
                                          ),
                                          title: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(cubit.comments[index].publisher,),
                                              Text(cubit.comments[index].body,style: TextStyle(fontSize: 13),),
                                            ],
                                          ),
                                          subtitle: Text(
                                              '${cubit.comments[index].date}',
                                              style:Theme.of(context).textTheme.bodySmall!.copyWith(height: 1.3)
                                          ),
                                          trailing:
                                          cubit.comments[index].isMine== true ?
                                          IconButton(
                                              onPressed: (){
                                                showDialog<void>(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text('What do you want to do'),
                                                      content: SizedBox(
                                                          width: 40,
                                                          height: 80,
                                                          child: Column(
                                                            children: [
                                                              SizedBox(height: 10,),
                                                              InkWell(
                                                                  onTap:(){
                                                                    var editedCommentController = TextEditingController(text: '${cubit.comments[index].body}');
                                                                    showDialog<void>(
                                                                      context: context,
                                                                      builder: (BuildContext context) {
                                                                        return AlertDialog(
                                                                          title: Text('Edit Comment:'),
                                                                          content: SizedBox(
                                                                            width: double.maxFinite,
                                                                            child: defaultFormField(
                                                                                type: TextInputType.text,
                                                                                label: 'type here',
                                                                                controller: editedCommentController
                                                                            ),
                                                                          ),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              child: Text('OK'),
                                                                              onPressed: () {
                                                                                cubit.editComment(
                                                                                    postId : post.postId,
                                                                                    commentId : cubit.comments[index].id,
                                                                                    body : editedCommentController.text,
                                                                                    token : token
                                                                                );
                                                                                //cubit.getComments(post.postId);
                                                                                Navigator.of(context).pop();
                                                                                Navigator.of(context).pop();
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Text('Edit Comment',style: TextStyle(color: Colors.orange),)),
                                                              SizedBox(height: 20,),
                                                              InkWell(
                                                                  onTap:(){
                                                                    showDialog<void>(
                                                                      context: context,
                                                                      builder: (BuildContext context) {
                                                                        return AlertDialog(
                                                                          title: Text('Are You Sure'),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              child: Text('Delete'),
                                                                              onPressed: () {
                                                                                cubit.deleteComment(cubit.comments[index].id);
                                                                                cubit.getComments(post.postId);
                                                                                post.comentsCount = post.comentsCount - 1;
                                                                                Navigator.of(context).pop();
                                                                                Navigator.of(context).pop();
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                            ),
                                                                            TextButton(
                                                                              child: Text('Cancel'),
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Text('Delete Comment',style: TextStyle(color: Colors.red))),
                                                            ],
                                                          )
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: Text('Cancel'),
                                                          onPressed: () {
                                                            Navigator.of(context).pop();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              icon: Icon(Icons.edit,color: kGold1Color,)
                                          ) :
                                          SizedBox()
                                      ),
                                    );
                                  },
                                ),
                                fallback: (context) => Center(child: Text('No comments yet...')),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  cubit.comments = null;
                                },
                              ),
                            ],
                          );
                        },
                      );
                    });


                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.chat_outlined,
                          size: 16.0,
                          color: kGold1Color,
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          '${post.comentsCount} ${translation(context).comments}',
                          style: Theme.of(context).textTheme.bodySmall,

                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(bottom: 10.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap:(){
                  var commentController = TextEditingController();
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(translation(context).writeComment),
                        content: SizedBox(
                          width: double.maxFinite,
                          child: defaultFormField(
                              type: TextInputType.text,
                              label: 'type here',
                              controller: commentController
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              cubit.sendComment(
                                  postId : post.postId,
                                  body : commentController.text,
                                  token : token
                              );
                              post.comentsCount = post.comentsCount + 1;
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );

                },
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18.0,
                      backgroundColor: Colors.white,
                      backgroundImage: commentAddImage(userType),
                    ),
                    SizedBox(width: 15,),
                    Text(
                        translation(context).writeComment,
                        style:Theme.of(context).textTheme.bodySmall
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap:(){
                if(post.isLiked==false) {
                  print(post.postId);
                  cubit.Like(post.postId);
                  post.likesCount = post.likesCount + 1;
                  post.isLiked = !post.isLiked;
                }else
                {
                  print(post.postId);
                  cubit.Like(post.postId);
                  post.likesCount = post.likesCount - 1;
                  post.isLiked = !post.isLiked;
                }

              },
              child: Row(
                children: [
                  post.isLiked == false ?
                  Icon(
                    Icons.thumb_up_outlined,
                    size: 16.0,
                    color: Colors.blue,
                  ) :
                  Icon(
                    Icons.thumb_up,
                    size: 16.0,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 5.0,),
                  Text(
                    translation(context).like,
                    style: Theme.of(context).textTheme.bodySmall,

                  )
                ],
              ),
            ),
          ],
        ),


      ],
    ),
  ),
);
Widget PostsBuilder(posts,cubit, context, state) => ConditionalBuilder(
  condition: state is! PostsLoadingState && posts != null,
  builder: (context) => ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>
          buildPostItem(posts[index],context,cubit,state),
      separatorBuilder: (context,index) => SizedBox(height: 8,),
      itemCount: posts.length),
  fallback: (context) => Center(child: CircularProgressIndicator()),
);
AssetImage commentImage(role){
  if(role == 0 || role == 1)
    {
      return AssetImage('assets/icons/Blue-Icon.jpg');
    } else if(role == 2){
    return AssetImage('assets/icons/graduating-student-b.png');
  } else if(role==4){
    return AssetImage('assets/icons/teacher.png');
  }else{
    return AssetImage('assets/icons/parents (1).png');
  }
}
AssetImage commentAddImage(user){
   if(user == 'student'){
    return AssetImage('assets/icons/graduating-student-b.png');
  } else if(user=='teacher'){
    return AssetImage('assets/icons/teacher.png');
  }else{
    return AssetImage('assets/icons/parents (1).png');
  }
}

Widget test(cubit) =>  Container(
width: 350,
decoration: BoxDecoration(
color: kWhiteColor,
borderRadius: BorderRadius.circular(20),
),
child: Center(
child: Text(
cubit.posts?[cubit.posts!.length - 2].body,
style: TextStyle(
color: kDarkBlue2Color,
fontSize: 30,
fontWeight: FontWeight.w400
),

)),
);
Widget buildPostItemH(post,context,cubit) => Card(
  clipBehavior: Clip.antiAliasWithSaveLayer,
  elevation: 7.0,
  margin: EdgeInsets.symmetric(horizontal: 8.0),
  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: post.publisher=='E-School' ? AssetImage('assets/icons/Blue-Icon.jpg') :AssetImage('assets/icons/graduating-student-b.png'),
            ),
            SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${post.publisher}',
                        style: TextStyle(
                            height: 1.3
                        ),
                      ),
                      SizedBox(width: 8.0,),
                      post.publisher=='E-School' ?
                      Icon(Icons.verified,color: Colors.lightBlue,size: 16,):
                      SizedBox(width: 1.0,),
                    ],
                  ),
                  Text(
                      '${post.date}',
                      style:Theme.of(context).textTheme.bodySmall!.copyWith(height: 1.3)
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 15.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        Text(
          '${post.body}',

          style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.3,fontSize: 14,fontWeight: FontWeight.w600).copyWith(overflow: TextOverflow.ellipsis),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap:(){
                    cubit.getLikes(post.postId);
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(translation(context).likescreen),
                          content: SizedBox(
                            width: double.maxFinite,
                            child: ConditionalBuilder(
                              condition: cubit.likes != null ,
                              builder: (context) => ListView.separated(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: cubit.likes.length,
                                separatorBuilder: (BuildContext context, int index) => Divider(),
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    leading: CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: kWhiteColor,
                                      backgroundImage: cubit.likes[index].name=='E-School' ? AssetImage('assets/icons/Blue-Icon.jpg') :AssetImage('assets/icons/graduating-student-b.png'),
                                    ),
                                    title: Text(cubit.likes[index].name),
                                    trailing: Icon(
                                      Icons.thumb_up,
                                      size: 16.0,
                                      color: Colors.blue,
                                    ),
                                  );
                                },
                              ),
                              fallback: (context) => Center(child: Text(translation(context).nolikes)),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.thumb_up_outlined,
                          size: 16.0,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          '${post.likesCount} ${translation(context).likes}',
                          style: Theme.of(context).textTheme.bodySmall,

                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap:(){
                    cubit.getComments(post.postId);
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(translation(context).commentsscreen),
                          content: SizedBox(
                            width: double.maxFinite,
                            child: ConditionalBuilder(
                              condition: cubit.comments != null ,
                              builder: (context) => ListView.separated(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: cubit.comments.length,
                                separatorBuilder: (BuildContext context, int index) => SizedBox(height: 20,),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(10.0), // set the radius of the corners
                                        border: Border.all(
                                          color: Colors.grey[300]!, // set the color of the border
                                          width: 1.0, // set the width of the border
                                        ),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0, 0.2),
                                              blurRadius: 5) //blur radius of shadow
                                        ]
                                    ),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 20.0,
                                        backgroundColor: kWhiteColor,
                                        backgroundImage: cubit.comments[index].publisher=='E-School' ? AssetImage('assets/icons/Blue-Icon.jpg') :AssetImage('assets/icons/graduating-student-b.png'),
                                      ),
                                      title: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(cubit.comments[index].publisher,),
                                          Text(cubit.comments[index].body,style: TextStyle(fontSize: 13),),
                                        ],
                                      ),
                                      subtitle: Text(
                                          '${cubit.comments[index].date}',
                                          style:Theme.of(context).textTheme.bodySmall!.copyWith(height: 1.3)
                                      ),
                                    ),
                                  );
                                },
                              ),
                              fallback: (context) => Center(child: Text('No comments yet...')),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.chat_outlined,
                          size: 16.0,
                          color: kGold1Color,
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          '${post.comentsCount} comments',
                          style: Theme.of(context).textTheme.bodySmall,

                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(bottom: 10.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap:(){

                },
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/icons/graduating-student-b.png'),
                    ),
                    SizedBox(width: 15,),
                    Text(
                        translation(context).writeComment,
                        style:Theme.of(context).textTheme.bodySmall
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap:(){
                if(post.isLiked==false) {
                  print(post.postId);
                  cubit.Like(post.postId);
                  post.likesCount = post.likesCount + 1;
                  post.isLiked = !post.isLiked;
                }else
                {
                  print(post.postId);
                  cubit.Like(post.postId);
                  post.likesCount = post.likesCount - 1;
                  post.isLiked = !post.isLiked;
                }

              },
              child: Row(
                children: [
                  post.isLiked == false ?
                  Icon(
                    Icons.thumb_up_outlined,
                    size: 16.0,
                    color: Colors.blue,
                  ) :
                  Icon(
                    Icons.thumb_up,
                    size: 16.0,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 5.0,),
                  Text(
                    translation(context).like,
                    style: Theme.of(context).textTheme.bodySmall,

                  )
                ],
              ),
            ),
          ],
        ),


      ],
    ),
  ),
);




Widget ShowFilesBuilder(w, files, context, state) => ConditionalBuilder(
  condition:  state is! LibraryLoadingState && files != null,
  builder: (context) => ListView.separated(
    physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) =>
          ShowFilesItem(w, files[index], index, context),
      separatorBuilder: (context, index) {
        return SizedBox();
      },
      itemCount: files.length ),//files.length),
  fallback: (context) => Center(child: CircularProgressIndicator()),
);
Widget ShowFilesItem(w, file, index, context) => Padding(
  padding: const EdgeInsets.all(15.0),
  child: ListTile(
    leading:InkWell(
      onTap: () =>launchUrl(
          Uri.parse('${baseUrl}${file.path}'),
          mode: LaunchMode.externalApplication
      ),
      child: Image.asset(
        'assets/icons/pdf.png',
      ),
    ),
    title: Text(
      '${file.name}',
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    subtitle:Text(
      '${file.createdAt}',
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.grey,
      ),
    ) ,
    trailing: InkWell(
      onTap: (){

          // downloadFile(
          //     '${baseUrl}${file.path}',
          //     file.name
          // );
        downloadFileA(context, '${baseUrl}${file.path}');
          // showToast(
          //     text: 'File Downloaded...',
          //     state: ToastStates.SUCCESS
          // );


      },
      child: Container(
        height: 30,
        width: 30,
        child: Image.asset(
          'assets/icons/download.png',

        ),
      ),
    ),
  ),
);

Future<void> downloadFileA(context,String url) async {
  try {
    // Get the temporary directory of the device
    Directory tempDir = await getTemporaryDirectory();

    // Generate a unique file name
    String fileName ='schoolFile';

    // Create a new file in the temporary directory with the generated file name
    File file = File('${tempDir.path}/$fileName');

    // Download the file from the URL and save it to the new file using Dio
    Dio dio = Dio();
    await dio.download(url, file.path);

    // Show a success message to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('File downloaded successfully'),backgroundColor: Colors.lightGreen,),
    );
  } catch (error) {
    // Show an error message to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error downloading file: $error')),
    );
  }
}

///open file
Future openFile ({required String url , String? fileName})async{
  // final name = fileName ?? url.split('/').last;
  // final file = await downloadFile(url,name);
  // if (file== null)  return;
  // print('path : ${file.path}');
  OpenFile.open(url);
}

///download file
Future<File?> downloadFile(String url,String name)async{
  final appStorage = await getApplicationDocumentsDirectory();
  final file =File('${appStorage.path}/$name');
  try {
    final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,

        )
    );
    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    return file;
  }catch(e){
    return null;
  }
}



Widget ShowFilessItem(w, file, index, context) => Padding(
  padding: const EdgeInsets.all(15.0),
  child: Container(
    width: w,
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
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/icons/pdf.png',
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
                    '${file.name}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'pdf',
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

//Books
Widget ShowBooksBuilder(w, books, context, state) => ConditionalBuilder(
  condition:  state is! LibraryLoadingState && books != null,
  builder: (context) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) =>
          ShowBooksItem(w, books[index], index, context),
      separatorBuilder: (context, index) {
        return SizedBox();
      },
      itemCount: books.length ),//files.length),
  fallback: (context) => Center(child: CircularProgressIndicator()),
);
Widget ShowBooksItem(w, book, index, context) => Padding(
  padding: const EdgeInsets.all(15.0),
  child: ListTile(
    leading:InkWell(
      onTap: () {
        launchUrl(
            Uri.parse(book.url),
            mode: LaunchMode.externalApplication
        );

      },
      child: Image.asset(
        'assets/icons/book.png',
      ),
    ),
    title: Text(
      '${book.name}',
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    subtitle:Text(
      '${book.createdAt}',
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.grey,
      ),
    ) ,
  ),
);