import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/books/add/cubit/add_book_cubit.dart';
import 'package:untitled/modules/books/add/cubit/add_book_states.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/styles/colors.dart';
import '../../../shared/components/components.dart';

class AddBook extends StatelessWidget {
  const AddBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();

    var urlController = TextEditingController();

    var formkey = GlobalKey<FormState>();
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return BlocProvider(
      create: (context) => AddBookCubit(),
      child: BlocConsumer<AddBookCubit, AddBookStates>(
        listener: (context, state) {
          if (state is AddBookSuccessState) {
            if(state.addBookModel.status == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content:
                  Center(
                    child: Text(
                        '${state.addBookModel.message}',
                        style: TextStyle(color: Colors.white)),
                  )));
            } else  {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                    child: Text(
                      '${state.addBookModel.message}',
                      style: TextStyle(color: Colors.white),
                    ),
                  )));

            }}
        },
        builder: (context, state) {
          var cubit = AddBookCubit.get(context);
          return Container(
            width: w - (w / 5) - 5,
            decoration: BoxDecoration(
              color: Colors.white24,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enter Book: ",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: kDarkBlue2Color),
                      ),
                    ),
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: buildSForm(
                                    controller: nameController,
                                    labeltext: 'Name',
                                  ),
                                ),
                                SizedBox(
                                  width: w / 30,
                                ),
                                Expanded(
                                    child: buildSForm(
                                        controller: urlController,
                                        labeltext: 'URL')),
                                SizedBox(
                                  width: w / 30,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: kDarkBlue2Color,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: DropdownButton<String>(
                                      value: cubit.grade,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: kGold1Color,
                                      ),
                                      iconSize: 24,
                                      elevation: 40,
                                      borderRadius: BorderRadius.circular(40),

                                      underline: Container(),

                                      hint: Padding(
                                        padding: const EdgeInsets.only(
                                          right: 150,
                                          left: 20,
                                        ),
                                        child: Text(
                                          'Choose Grade',
                                          style: TextStyle(
                                              color: kDarkBlue2Color,
                                              fontSize: 16),
                                        ),
                                      ),
                                      //  style: ,
                                      onChanged: (gr) {
                                        cubit.changeGradeDropDownButton(gr!);
                                      },

                                      items: cubit.GradeItems,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                          ),


                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                    ),
                    state is! AddBookLoadingState
                        ? defaultButton(
                        text: 'Add',
                        width: w / 5,
                        height: h / 20,
                        onPressed: () {
                          cubit.AddBook(
                              token: token,
                              name: nameController.text,
                              url: urlController.text,
                              gradeId: cubit.grade
                          );
                        })
                        : Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



