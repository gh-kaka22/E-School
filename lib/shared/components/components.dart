import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_school/models/timetable_model.dart';
import 'package:e_school/modules/posts/cubit/posts_states.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../styles/colors.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = defaultColor,
  bool isUpperCase = true,
  required Function onPressed,
  required String text,
  double radius = 0.0,
}) =>
    Container(
      width: width,
      color: background,
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
      ),
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
  required FormFieldValidator validate,
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
      color = Colors.amber;
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


Widget buildPostItem(post,context,cubit) => Card(
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
                       showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('People who liked this'),
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
                                fallback: (context) => Center(child: Text('No likes yet...')),
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
                          '${post.likesCount} likes',
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
                        'write a comment...',
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
                    'Like',
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
          buildPostItem(posts[index],context,cubit),
      separatorBuilder: (context,index) => SizedBox(height: 8,),
      itemCount: posts.length),
  fallback: (context) => Center(child: CircularProgressIndicator()),
);

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
                          title: Text('People who liked this'),
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
                              fallback: (context) => Center(child: Text('No likes yet...')),
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
                          '${post.likesCount} likes',
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
                        'write a comment...',
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
                    'Like',
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