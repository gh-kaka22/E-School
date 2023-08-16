import 'dart:io';

import 'package:cubit_form/cubit_form.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/files/add/cubit/add_file_cubit.dart';
import 'package:untitled/modules/files/add/cubit/add_file_states.dart';

import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/styles/colors.dart';
import '../../../shared/components/components.dart';

class AddFile extends StatelessWidget {
  const AddFile({Key? key}) : super(key: key);

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
      var response = dio.post("http://127.0.0.1:8000/api/upload_file",data: data,
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
    var nameController = TextEditingController();

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
      create: (context) => AddFileCubit()..getClassrooms(7),
      child: BlocConsumer<AddFileCubit, AddFileStates>(
        listener: (context, state) {
          if (state is AddFileSuccessState) {
            if(state.addFileModel.status == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content:
                  Center(
                    child: Text(
                        '${state.addFileModel.message}',
                        style: TextStyle(color: Colors.white)),
                  )));
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
        },
        builder: (context, state) {
          var cubit = AddFileCubit.get(context);
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
                        "Add File: ",
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
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: kDarkBlue2Color,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: DropdownButton<dynamic>(
                                        value: cubit.dropDownValueClass,
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
                                        onChanged: (newValue) {
                                          cubit.changeClassDropDownButton(newValue!);
                                        },

                                        items: cubit.menuItemsClass,
                                      ),
                                    ),
                                  ),
                                ),
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
                                          padding: const EdgeInsets.only(
                                            right: 150,
                                            left: 20,
                                          ),
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
                    defaultButton(
                        text: 'Choose File',
                        width: w / 5,
                        height: h / 20,
                        onPressed: () {
                          cubit.selectFile();
                        }),
                    SizedBox(height: 20,),
                    if (cubit.selectedFile != null)
                      Center(child: Text(cubit.fileName!)), // show the selected file path, if there is one
                    SizedBox(height: 20,),
                    state is! AddFileLoadingState
                        ? defaultButton(
                        text: 'Upload',
                        width: w / 5,
                        height: h / 20,
                        onPressed: () {

                        cubit.sendFile(
                            filePath: cubit.filePath,
                            fileName: cubit.fileName,
                            name: nameController.text,
                            gradeId: cubit.dropDownValueClass,
                          roomNumber: cubit.dropDownValueSection,
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



