import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_school/modules/exams/cubit/exams_cubit.dart';
import 'package:e_school/modules/exams/cubit/exams_states.dart';
import 'package:e_school/modules/library/cubit/library_cubit.dart';
import 'package:e_school/modules/library/cubit/library_states.dart';
import 'package:e_school/modules/teacher/files/add/add_files.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LibraryCubit()..getFiles()..getBooks(),
      child: BlocConsumer<LibraryCubit, LibraryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LibraryCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Library'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          cubit.type='Files';
                          cubit.changeToggle();
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              //border: Border.all(color: kDarkBlue2Color, width: 3),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.3),
                                    blurRadius: 8) //blur radius of shadow
                              ]),
                          child: Center(child: Text(
                            'Files',
                            style: TextStyle(fontSize: 18),
                          )),
                        ),
                      ),
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: (){
                          cubit.type = 'Books';
                          cubit.changeToggle();
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              //border: Border.all(color: kDarkBlue2Color, width: 3),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.3),
                                    blurRadius: 8) //blur radius of shadow
                              ]),
                          child: Center(child: Text(
                            'Books',
                            style: TextStyle(fontSize: 18),
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  cubit.type=='Files' ?
                  Expanded(
                    child: ShowFilesBuilder(400, cubit.files, context, state)
                  ) :
                  Expanded(
                      child: ShowBooksBuilder(400, cubit.book, context, state)
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
