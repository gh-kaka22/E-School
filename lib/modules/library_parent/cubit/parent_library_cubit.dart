
import 'package:e_school/models/book_model.dart';
import 'package:e_school/models/files_model.dart';
import 'package:e_school/modules/library_parent/cubit/parent_library_states.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParentLibraryCubit extends Cubit<ParentLibraryStates> {
  ParentLibraryCubit() : super(ParentLibraryInitialState());

  static ParentLibraryCubit get(context) => BlocProvider.of(context);


  String type='Files';
  changeToggle(){
    emit(ToggleState());
  }

  FilesModel? filesModel;
  List<dynamic>? files;
  void getFilesParent(id)
  {
    emit(ParentLibraryLoadingState());
    DioHelper.getData(
      url: '${PARENTFILES}/${id}',
      token: token,
    ).then((value) {
      print(value?.data);
      filesModel = FilesModel.fromJson(value?.data);
      print(filesModel?.status);
      print(filesModel?.message);
      print(filesModel?.data[0]);
      files = filesModel?.data;
      print(files?[1].name);
      emit(ParentLibrarySuccessState(filesModel!));
    }).catchError((error){
      print(error.toString());
      emit(ParentLibraryErrorState(error.toString()));
    });
  }

  BookModel? bookModel;
  List<dynamic>? book;
  void getBooksParent(id)
  {
    emit(ParentBooksLoadingState());
    DioHelper.getData(
      url: '${PARENTBOOKS}/${id}',
      token: token,
    ).then((value) {
      print(value?.data);
      bookModel = BookModel.fromJson(value?.data);
      print(bookModel?.status);
      print(bookModel?.message);
      print(bookModel?.data[0]);
      book = bookModel?.data;
      print(book?[1].name);
      emit(ParentBooksSuccessState(bookModel!));
    }).catchError((error){
      print(error.toString());
      emit(ParentBooksErrorState(error.toString()));
    });
  }



}