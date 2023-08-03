import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_school/modules/teacher/files/add/cubit/add_file_cubit.dart';
import 'package:e_school/modules/teacher/files/add/cubit/add_file_states.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/components/posts_components.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddFile extends StatelessWidget {
  var nameController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  Future uploadTest() async{
    var dio = Dio();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if(result != null){
      File file = File(result.files.single.path ?? "");
      String fileName = file.path.split(r'\').last;
      print(fileName);
      String filePath = file.path;
      print(filePath);
      FormData data = FormData.fromMap({
        'name' : 'anas',
        'classroom_id': 2,
        'pdf_file': await MultipartFile.fromFile(filePath,filename: fileName)
      });
      try {
      var response = dio.post("http://192.168.1.5/api/upload_file",data: data,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
          onSendProgress: (int sent,int total){
        print('$sent $total');
          });
      print(response.toString());
      } catch (e) {
        //print(e);
      }
    }else{
      print('result is null');
    }

  }

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return BlocProvider(
      create: (context) => AddFileCubit()..getClassrooms()..getGrades(),
      child: BlocConsumer<AddFileCubit, AddFileStates>(
        listener: (context, state) {
          if (state is AddFileSuccessState) {
            if(state.addFileModel.status == true) {
              showToast(text: 'File Uploaded Successfuly.', state: ToastStates.SUCCESS);
            } else  {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                    child: Text(
                      '${state.addFileModel.message}',
                      style: TextStyle(color: Colors.white),
                    ),
                  )));

            }}
          if(state is AddFileErrorState){
            showToast(text: 'Check the classroom you entered!', state: ToastStates.WARNING);
          }
        },
        builder: (context, state) {
          var cubit = AddFileCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title:  Text(
              "Add File",
            ),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(

                  children: [

                    Form(
                      key: formkey,
                      child: Column(

                        children: [
                          SizedBox(height: h/50,),
                          Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [




                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kDarkBlue2Color,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: DropdownButton<dynamic>(
                                    value: cubit.dropDownValueSection,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: kGold1Color,
                                    ),
                                    iconSize: 24,
                                    elevation: 40,
                                    borderRadius: BorderRadius.circular(40),

                                    underline: Container(),

                                    hint: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        'Choose Classroom',
                                        style: TextStyle(
                                            color: kDarkBlue2Color,
                                            fontSize: 16),
                                      ),
                                    ),
                                    //  style: ,
                                    onChanged: (newValue) {
                                      cubit.changeSectionDropDownButton(newValue!);
                                    },

                                    items: cubit.menuItemsSection,
                                  ),
                                ),
                              ),

                              SizedBox(width:w/40),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kDarkBlue2Color,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: DropdownButton<dynamic>(
                                    value: cubit.dropDownValueClassroom,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: kGold1Color,
                                    ),
                                    iconSize: 24,
                                    elevation: 40,
                                    borderRadius: BorderRadius.circular(40),

                                    underline: Container(),

                                    hint: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        'Choose Classroom',
                                        style: TextStyle(
                                            color: kDarkBlue2Color,
                                            fontSize: 16),
                                      ),
                                    ),
                                    //  style: ,
                                    onChanged: (newValue) {
                                      cubit.changeClassRoomDropDownButton(newValue!);
                                    },

                                    items: cubit.menuItemsClassroom,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(height: h/50,),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: buildSForm(
                              controller: nameController,
                              labeltext: 'Name',
                            ),
                          ),



                        ],
                      ),
                    ),

                    Center(
                      child: ElevatedButton(
                          child:Text ('Choose File'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.orange,//change background color of button
                            backgroundColor: kDarkBlue2Color,//change text color of button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 15.0,
                          ),

                          onPressed: () {
                            cubit.selectFile();
                          }),
                    ),
                    SizedBox(height: 20,),
                    if (cubit.selectedFile != null)
                      Center(child: Text(cubit.fileName!)), // show the selected file path, if there is one
                    SizedBox(height: 20,),
                    state is! AddFileLoadingState
                        ? Center(
                          child: ElevatedButton(

                          child:Text ('Upload'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.lightGreen,//change background color of button
                                backgroundColor: kDarkBlue2Color,//change text color of button
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                elevation: 15.0,
                              ),

                          onPressed: () {

                          cubit.sendFile(
                              filePath: cubit.filePath,
                              fileName: cubit.fileName,
                              name: nameController.text,
                            roomNumber: cubit.dropDownValueSection,
                            gradeId: cubit.dropDownValueClassroom,

                          );



                          }),
                        )
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



