import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/books/show/cubit/show_books_cubit.dart';
import 'package:untitled/modules/books/show/cubit/show_books_states.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/search_bar.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/styles/colors.dart';

class BooksShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double padding=MediaQuery.of(context).size.width/20;
    return BlocProvider(
      create: (BuildContext context) => ShowBooksCubit()..getBooksByGrade(7),
      child: BlocConsumer<ShowBooksCubit, ShowBooksStates>(
        listener: (context, state) {
          if (state is DeleteBooksSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content:
                  Center(
                    child: Text(
                        'Deleted Successfully',
                        style: TextStyle(color: Colors.white)),
                  )));
            }
          if (state is DeleteBooksErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content:
                Center(
                  child: Text(
                      'Deleting Failed',
                      style: TextStyle(color: Colors.white)),
                )));
          }

        },
        builder: (context, state) {
          var cubit = ShowBooksCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: h,
              width: 4 / 5 * w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  MyText(name: 'Books'),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: kDarkBlue2Color,
                            border: Border.all(color: kGold1Color, width: 3),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.57),
                                  //shadow for button
                                  blurRadius: 5) //blur radius of shadow
                            ]),
                        child: Padding(
                          padding:
                             EdgeInsets.only(left: padding, right: padding),
                          child: DropdownButton<dynamic>(
                            underline: const SizedBox(),
                            value: cubit.dropDownValueClass,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: kGold1Color,
                            ),
                            iconSize: 24,
                            elevation: 40,
                            hint: Text('Choose Class'),
                            style:
                                TextStyle(color: kGold1Color, fontSize: 16),
                            onChanged: (newValue) {
                              cubit.changeClassDropDownButton(newValue!);
                              cubit.getBooksByGrade(newValue);
                            },
                            items: cubit.menuItems,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 4 / 5 * w,
                    height: 50,
                    decoration: BoxDecoration(
                        color:  Colors.white ,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                              blurRadius: 20) //blur radius of shadow
                        ]),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Center(
                                child: ShowText(name:'Id',
                                  ),
                              )),
                          Expanded(
                              child: Center(
                                child: ShowText(name:'Name',
                                    ),
                              )),
                          Expanded(
                            child: Center(child: ShowText(name:'URL')),
                          ),
                          Expanded(
                            child: Center(child: ShowText(name:'Open')),
                          ),
                          Expanded(
                            child: Center(child: ShowText(name:'Delete')),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: ShowBooksBuilder(
                          w,
                          cubit.showBookModel?.data,
                        context,
                        state,
                        cubit
                          )
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
