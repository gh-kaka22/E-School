
import 'package:e_school/models/book_model.dart';
import 'package:e_school/models/files_model.dart';
import 'package:e_school/modules/library/cubit/library_states.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryCubit extends Cubit<LibraryStates> {
  LibraryCubit() : super(LibraryInitialState());

  static LibraryCubit get(context) => BlocProvider.of(context);


  String type='Files';
  changeToggle(){
    emit(ToggleState());
  }

  FilesModel? filesModel;
  List<dynamic>? files;
  void getFiles()
  {
    emit(LibraryLoadingState());
    DioHelper.getData(
      url: FILES,
      token: token,
    ).then((value) {
      print(value?.data);
      filesModel = FilesModel.fromJson(value?.data);
      print(filesModel?.status);
      print(filesModel?.message);
      print(filesModel?.data[0]);
      files = filesModel?.data;
      print(files?[1].name);
      emit(LibrarySuccessState(filesModel!));
    }).catchError((error){
      print(error.toString());
      emit(LibraryErrorState(error.toString()));
    });
  }

  BookModel? bookModel;
  List<dynamic>? book;
  void getBooks()
  {
    emit(BooksLoadingState());
    DioHelper.getData(
      url: BOOKS,
      token: token,
    ).then((value) {
      print(value?.data);
      bookModel = BookModel.fromJson(value?.data);
      print(bookModel?.status);
      print(bookModel?.message);
      print(bookModel?.data[0]);
      book = bookModel?.data;
      print(book?[1].name);
      emit(BooksSuccessState(bookModel!));
    }).catchError((error){
      print(error.toString());
      emit(BooksErrorState(error.toString()));
    });
  }



}