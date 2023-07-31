import 'package:e_school/models/change_like_model.dart';
import 'package:e_school/models/create_comment_model.dart';
import 'package:e_school/models/home_model.dart';
import 'package:e_school/models/posts_model.dart';
import 'package:e_school/models/show_comments_model.dart';
import 'package:e_school/models/show_likes_model.dart';
import 'package:e_school/models/teacher_home_model.dart';
import 'package:e_school/modules/Timetable/timetable_screen.dart';
import 'package:e_school/modules/attendance/attendance_screen.dart';
import 'package:e_school/modules/exam_schedule/exam_schedule.dart';
import 'package:e_school/modules/exams/exams_screen.dart';
import 'package:e_school/modules/home_teacher/cubit/teacher_home_states.dart';
import 'package:e_school/modules/library/library_screen.dart';
import 'package:e_school/modules/notes/notes_screen.dart';
import 'package:e_school/shared/components/category_card.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/components/schedule_card.dart';

import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherHomeCubit extends Cubit<TeacherHomeStates>{
  TeacherHomeCubit() : super(TeacherHomeInitialState());
  static TeacherHomeCubit get(context) => BlocProvider.of(context);

  List<OptionCard> categories =[
    OptionCard('Timetable', 'See your daily timetables here...', 'assets/icons/schedule.png', kTeal),
    OptionCard('Files', 'Browse & Upload files here...', 'assets/icons/folders.png', kTeal)
  ];
  TeacherHomeModel? teacherHomeModel ;
  void getTeacherHomeData()
  {
    emit(TeacherHomeLoadingState());
    print(token);
    DioHelper.getData(
        url: TEACHERHOME,
      token: token
    ).then((value) {
      print(value?.data);
      teacherHomeModel = TeacherHomeModel.fromJson(value?.data);
      print(teacherHomeModel?.data);
      print(teacherHomeModel?.status);
      print(teacherHomeModel?.message);
      print(teacherHomeModel?.data.subjectName);
      emit(TeacherHomeSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(TeacherHomeErrorState(error.toString()));
    });



  }
  ///GET POSTS
  PostsModel? postsModel;
  List<dynamic>? posts;
  void getPosts()
  {
    emit(TeacherHomeLoadingState());
    DioHelper.getData(
      url: GETPOSTS,
      token: token,
    ).then((value) {
      print(value?.data);
      postsModel = PostsModel.fromJson(value?.data);
      print(postsModel?.status);
      print(postsModel?.message);
      print(postsModel?.data[0]);
      posts = postsModel?.data;
      emit(TeacherHomeSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(TeacherHomeErrorState(error.toString()));
    });
  }

  ///SEND LIKES
  ChangeLikeModel? changeLikeModel;
  void Like(id)
  {
    emit(LikeLoadingState());
    DioHelper.getData(
      url: '${TOGGLELIKE}/${id}',
      token: token,
    ).then((value) {
      print(value?.data);
      changeLikeModel = ChangeLikeModel.fromJson(value?.data);
      print(changeLikeModel?.status);
      print(changeLikeModel?.message);
      print(changeLikeModel?.data);
      emit(LikeSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(LikeErrorState(error.toString()));
    });
  }

  ///SHOW LIKES
  ShowLikesModel? showLikesModel;
  List<dynamic>? likes;
  void getLikes(id)
  {
    emit(ShowLikesLoadingState());
    DioHelper.getData(
      url: '${GETLIKES}/${id}',
      token: token,
    ).then((value) {
      print(value?.data);
      showLikesModel = ShowLikesModel.fromJson(value?.data);
      print(showLikesModel?.status);
      print(showLikesModel?.message);
      print(showLikesModel?.data[0]);
      likes = showLikesModel?.data;
      emit(ShowLikesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ShowLikesErrorState(error.toString()));
    });
  }

  ///SHOW COMMENTS
  ShowCommentsModel? showCommentsModel;
  List<dynamic>? comments;
  void getComments(id)
  {
    emit(ShowCommentsLoadingState());
    DioHelper.getData(
      url: '${GETCOMMENTS}/${id}',
      token: token,
    ).then((value) {
      print(value?.data);
      showCommentsModel = ShowCommentsModel.fromJson(value?.data);
      print(showCommentsModel?.status);
      print(showCommentsModel?.message);
      print(showCommentsModel?.data[0].body);
      comments = showCommentsModel?.data;
      emit(ShowCommentsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ShowCommentsErrorState(error.toString()));
    });
  }

  ///SEND COMMENT
  CreateCommentModel? createCommentModel;
  void sendComment(
      {
        required postId,
        required  body,
        required  token,
      }
      )
  {
    emit(
      CreateCommentsLoadingState(),
    );
    DioHelper.postData(
      token: token,
      url: CREATECOMMENT,
      data: {
        'post_id':postId,
        'body': body,
      },
    ).then((value) {
      print(value?.data);
      createCommentModel = CreateCommentModel.fromJson(value?.data);
      emit(CreateCommentsSuccessState(createCommentModel!));
    })
        .catchError((error) {
      print(" ${error.response.data}");
      emit(
        CreateCommentsErrorState(error.toString()),
      );
    });


  }

  ///DELETE COMMENT
  void deleteComment(id)
  {
    emit(DeleteCommentLoadingState());
    DioHelper.getData(
      url: '${DELETECOMMENT}/${id}',
      token: token,
    ).then((value) {
      print(value?.data);
      emit(DeleteCommentSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(DeleteCommentErrorState(error.toString()));
    });
  }

  ///Edit Comment
  void editComment(
      {
        required postId,
        required commentId,
        required  body,
        required  token,
      }
      )
  {
    emit(
      EditCommentLoadingState(),
    );
    DioHelper.postData(
      token: token,
      url: EDITCOMMENT,
      data: {
        'post_id': postId,
        'comment_id': commentId,
        'body': body,
      },
    ).then((value) {
      print(value?.data);
      emit(EditCommentSuccessState());
    }).catchError((error) {
      print(" ${error.response.data}");
      emit(
        EditCommentErrorState(error.toString()),
      );
    });


  }



}