import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/about_us/show/cubit/show_school_cubit.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/styles/colors.dart';
class ShowSchool extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double padding=MediaQuery.of(context).size.width/20;
    return BlocProvider(
      create: (BuildContext context) => ShowSchoolCubit()..getSchool(1),
      child: BlocConsumer<ShowSchoolCubit, ShowSchoolState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShowSchoolCubit.get(context);
          var model=ShowSchoolCubit.get(context).aboutUsModel;
          double padding=20;
          double radius=20;
          return ConditionalBuilder(
            condition: ShowSchoolCubit.get(context).aboutUsModel != null,
            builder: (context)=> Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: h,
                width: 4 / 5 * w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: h/20,
                    ),
                    MyText(name: 'About Our School'),
                    SizedBox(
                      height: h/20,
                    ),
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: Container(
                    width: w - (w / 6),
                    height: h / 10,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(radius)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.2), blurRadius: 20)
                        ]),
                    child: Row(
                      children: [
                        Container(
                          width: w / 7,
                          height: h / 10,
                          decoration: BoxDecoration(
                            color: kDarkBlue2Color,
                            borderRadius: BorderRadius.all(Radius.circular(radius)),

                          ),
                          child: Center(child: Text('School Name',style: TextStyle(
                            color: kDarkWhiteColor,
                            fontSize: 25,

                          ),)),

                        ),
                        Expanded(
                            child: Center(
                              child: Text('${model?.data?.name}',
                                  style: TextStyle(overflow: TextOverflow.ellipsis , color: kDarkBlue2Color)),
                            )),

                      ],
                    ),
                  ),
                ),

                    Padding(
                  padding: EdgeInsets.all(padding),
                  child: Container(
                    width: w - (w / 6),
                    height: h / 10,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(radius)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.2), blurRadius: 20)
                        ]),
                    child: Row(
                      children: [
                        Container(
                          width: w / 7,
                          height: h / 10,
                          decoration: BoxDecoration(
                            color: kDarkBlue2Color,
                            borderRadius: BorderRadius.all(Radius.circular(radius)),

                          ),
                          child: Center(child: Text('School Address',style: TextStyle(
                            color: kDarkWhiteColor,
                            fontSize: 25,

                          ),)),

                        ),
                        Expanded(
                            child: Center(
                              child: Text('${model?.data?.address}',
                                  style: TextStyle(overflow: TextOverflow.ellipsis , color: kDarkBlue2Color)),
                            )),

                      ],
                    ),
                  ),
                ),
                    Padding(
                  padding:  EdgeInsets.all(padding),
                  child: Container(
                    width: w - (w / 6),
                    height: h / 10,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(radius)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.2), blurRadius: 20)
                        ]),
                    child: Row(
                      children: [
                        Container(
                          width: w / 7,
                          height: h / 10,
                          decoration: BoxDecoration(
                            color: kDarkBlue2Color,
                            borderRadius: BorderRadius.all(Radius.circular(radius)),

                          ),
                          child: Center(child: Text('Phone Number',style: TextStyle(
                            color: kDarkWhiteColor,
                            fontSize: 25,

                          ),)),

                        ),
                        Expanded(
                            child: Center(
                              child: Text('${model!.data?.phone}',
                                  style: TextStyle(overflow: TextOverflow.ellipsis , color: kDarkBlue2Color)),
                            )),

                      ],
                    ),
                  ),
                ),
                    Padding(
                  padding:  EdgeInsets.all(padding),
                  child: Container(
                    width: w - (w / 6),
                    height: h / 10,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:BorderRadius.all(Radius.circular(radius)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.2), blurRadius: 20)
                        ]),
                    child: Row(
                      children: [
                        Container(
                          width: w / 7,
                          height: h / 10,
                          decoration: BoxDecoration(
                            color: kDarkBlue2Color,
                            borderRadius: BorderRadius.all(Radius.circular(radius)),

                          ),
                          child: Center(child: Text('Over View',style: TextStyle(
                            color: kDarkWhiteColor,
                            fontSize: 25,

                          ),)),

                        ),
                        Expanded(
                            child: Center(
                              child: Text('${model.data?.overview}',
                                  style: TextStyle(overflow: TextOverflow.ellipsis , color: kDarkBlue2Color)),
                            )),

                      ],
                    ),
                  ),
                ),

                  ],
                ),
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
