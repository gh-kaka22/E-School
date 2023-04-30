
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background= defaultColor,
  bool isUpperCase = true,
  required Function onPressed,
  required String text,
  double radius = 0.0,

}) => Container(
  width: width,
  color: background,
  child: MaterialButton(
    onPressed: onPressed(),
    child: Text(
      isUpperCase ? text.toUpperCase() :text,
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

Widget defaultTextButton ({
  required Function function,
  required String text,
}) => TextButton(
    onPressed: function(),
    child: Text(text.toUpperCase()),
);

////


Widget defaultFormField ({
  required TextEditingController controller ,
  required TextInputType type ,
  ValueChanged? onSubmit,
  ValueChanged? onChange,
  VoidCallback? suffixPressed,
  required FormFieldValidator validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,

})=> TextFormField(
  controller: controller,
  keyboardType: type,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  validator: validate,
  obscureText: isPassword,

  decoration: InputDecoration(

    labelText: label,
    prefixIcon: Icon(prefix),
    suffixIcon: suffix != null ? IconButton(
        onPressed: suffixPressed,
        icon: Icon(suffix))
        :null,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: kSearchTextColor),
    ),
    focusedBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.indigo),
  ),
  )
);

/////

Widget MyDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(start: 20.0,),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey,
  ),
);

////

Widget buildArticleItem(article, context) =>  InkWell(
  onTap: (){
   // navigateTo(context, WebViewScreen(article['url']),);
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),

    child:  Row(

      children: [

        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0),

            image: DecorationImage(

              image: NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/004/216/831/original/3d-world-news-background-loop-free-video.jpg'),

              fit: BoxFit.cover,

            ),

          ),

        ),

        SizedBox(width: 20.0,),

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

Widget articlesBuilder(list,context, {isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder:(context) =>
      ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context,index)=> buildArticleItem(list[index],context),
        separatorBuilder: (context,index)=> MyDivider(),
        itemCount: 10,
      ),
  fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator(),),

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
  (Route<dynamic> route)=> false,
);