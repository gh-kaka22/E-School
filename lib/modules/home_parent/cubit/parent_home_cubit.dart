import 'package:e_school/models/change_like_model.dart';
import 'package:e_school/models/create_comment_model.dart';
import 'package:e_school/models/parent_home_model.dart';
import 'package:e_school/models/posts_model.dart';
import 'package:e_school/models/show_comments_model.dart';
import 'package:e_school/models/show_likes_model.dart';
import 'package:e_school/modules/Timetable/timetable_screen.dart';
import 'package:e_school/modules/attendance/attendance_screen.dart';
import 'package:e_school/modules/attendance_parent/parent_attendance_screen.dart';
import 'package:e_school/modules/complaints/add/complaints_screen.dart';
import 'package:e_school/modules/complaints/show/show_complaints.dart';
import 'package:e_school/modules/exam_schedule/exam_schedule.dart';
import 'package:e_school/modules/exams_parent/parent_exams_screen.dart';
import 'package:e_school/modules/home_parent/cubit/parent_home_states.dart';
import 'package:e_school/modules/library/library_screen.dart';
import 'package:e_school/modules/library_parent/parent_library_screen.dart';
import 'package:e_school/modules/notes/notes_screen.dart';
import 'package:e_school/modules/notes_parent/parent_notes_screen.dart';
import 'package:e_school/modules/timetable_parent/parent_timetable_screen.dart';
import 'package:e_school/shared/components/category_card.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/local/cache_helper.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParentHomeCubit extends Cubit<ParentHomeStates>{
  ParentHomeCubit() : super(ParentHomeInitialState());
  static ParentHomeCubit get(context) => BlocProvider.of(context);

  List<CategoryCard> categories =[
    CategoryCard('Attendance', 'assets/icons/attendance.png', kWhiteColor,ParentAttendanceScreen()),
    CategoryCard('Marks', 'assets/icons/exam.png', kWhiteColor,ParentExamsScreen()),
    CategoryCard('Schedule', 'assets/icons/schedule.png', kWhiteColor,ParentTimetableScreen()),
    CategoryCard('Library', 'assets/icons/books.png', kWhiteColor,ParentLibraryScreen()),
    CategoryCard('Notices', 'assets/icons/post-it.png', kWhiteColor,ParentNotesScreen()),
    CategoryCard('Complaints', 'assets/icons/report.png', kWhiteColor,ShowComplaints()),
  ];
  ParentHomeModel? parentHomeModel ;

  void changeChild(newId,newName){
    CacheHelper.saveData(key: 'kidId', value: newId).then((value) {
      kidID=newId;
    });
    CacheHelper.saveData(key: 'kidName', value: newName).then((value) {
      kidName=newName;
    });
    emit(ChangeKidState());
  }

  void getParentHomeData()
  {
    emit(ParentHomeLoadingState());
    print(token);
    DioHelper.getData(
        url: PARENTHOME,
      token: token
    ).then((value) {
      print(value?.data);
      parentHomeModel = ParentHomeModel.fromJson(value?.data);
      kidID=parentHomeModel?.data.children[0].kidId;
      print(parentHomeModel?.data);
      print(parentHomeModel?.status);
      print(parentHomeModel?.message);
      print(parentHomeModel?.data.children);

      emit(ParentHomeSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ParentHomeErrorState(error.toString()));
    });



  }
  ///GET POSTS
  PostsModel? postsModel;
  List<dynamic>? posts;
  void getPostsParent(id)
  {
    emit(ParentHomePostsLoadingState());
    DioHelper.getData(
      url: '${GETPOSTSPARENT}/${id}',
      token: token,
    ).then((value) {
      print(value?.data);
      postsModel = PostsModel.fromJson(value?.data);
      print(postsModel?.status);
      print(postsModel?.message);
      //print(postsModel?.data[0]);
      posts = postsModel?.data;
      emit(ParentHomePostsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ParentHomePostsErrorState(error.toString()));
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