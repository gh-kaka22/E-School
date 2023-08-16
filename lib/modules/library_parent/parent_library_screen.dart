
import 'package:e_school/language/language_constants.dart';
import 'package:e_school/modules/library_parent/cubit/parent_library_cubit.dart';
import 'package:e_school/modules/library_parent/cubit/parent_library_states.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParentLibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ParentLibraryCubit()..getFilesParent(kidID)..getBooksParent(kidID),
      child: BlocConsumer<ParentLibraryCubit, ParentLibraryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ParentLibraryCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(translation(context).library),
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
                            translation(context).files,
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
                            translation(context).books,
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
