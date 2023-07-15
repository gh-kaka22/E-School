
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/modules/teachers/show/cubit/show_teachers_cubit.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/teacher.dart';
import 'package:untitled/styles/colors.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/3,
      height: MediaQuery.of(context).size.height/20,
      child: Row(
        children: <Widget>[
          Container(
            height:50 ,
            width: MediaQuery.of(context).size.width/5,
            padding: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: kSearchBackgroundColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText:'Search for students...',
                ),
              ),
            ),
          ),
          MaterialButton(
            height: 50,
            onPressed: () {
            },
            color: kDarkBlue2Color,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(Icons.search,color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
class ASearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/3,
      height: MediaQuery.of(context).size.height/20,
      child: Row(
        children: <Widget>[
          Container(
            height:50 ,
            width: MediaQuery.of(context).size.width/5,
            padding: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: kSearchBackgroundColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText:'Search for Admins...',
                ),
              ),
            ),
          ),
          MaterialButton(
            height: 50,
            onPressed: () {
            },
            color: kDarkBlue2Color,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(Icons.search,color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
// class TSearchBar extends StatelessWidget {
//   var searchController=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//   create: (context) => ShowTeachersCubit(),
//   child: BlocConsumer<ShowTeachersCubit, ShowTeachersState>(
//   listener: (context, state) {
//     // TODO: implement listener
//   },
//   builder: (context, state) {
//     var list= ShowTeachersCubit.get(context).search;
//     double w=MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width/5);
//     return
//      Column(
//         children: [
//           Row(
//             children: <Widget>[
//               Container(
//                 height:50 ,
//                 width: MediaQuery.of(context).size.width/5,
//                // padding: EdgeInsets.symmetric(horizontal: 30),
//                 decoration: BoxDecoration(
//                  // color: kSearchBackgroundColor,
//                   color: Colors.red,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: defaultFormField(
//                     controller: searchController,
//                     type: TextInputType.text,
//                     onChange: (value){
//                       ShowTeachersCubit.get(context).getSearch(value);
//                     },
//                     label: 'Search For Teachers'),
//
//
//               ),
//               MaterialButton(
//                 height: 50,
//                 onPressed: () {
//                 },
//                 color: kDarkBlue2Color,
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 10,
//                   vertical: 15,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Icon(Icons.search,color: Colors.white,),
//               ),
//             ],
//           ),
//           SizedBox(height: 50,),
//           Expanded(
//             child: SearchTeachersBuilder(
//                 w,
//                 ShowTeachersCubit.get(context).search,
//                 ShowTeachersCubit.get(context).search,
//                 context,
//                 state),
//           ),
//         ],
//
//     );
//   },
// ),
// );
//   }
// }
