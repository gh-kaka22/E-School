import 'package:e_school/models/change_like_model.dart';
import 'package:e_school/models/create_comment_model.dart';
import 'package:e_school/models/posts_model.dart';
import 'package:e_school/models/show_comments_model.dart';
import 'package:e_school/models/show_likes_model.dart';
import 'package:e_school/modules/posts_parent/cubit/parent_posts_states.dart';
import 'package:e_school/shared/components/constants.dart';
import 'package:e_school/shared/network/end_points.dart';
import 'package:e_school/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParentPostsCubit extends Cubit<ParentPostsStates>{
  ParentPostsCubit() : super(ParentPostsInitialState());
  static ParentPostsCubit get(context) => BlocProvider.of(context);

  ///GET POSTS
  PostsModel? postsModel;
  List<dynamic>? posts;
  void getParentPosts(id)
  {
    emit(ParentPostsLoadingState());
    DioHelper.getData(
      url: '${GETPOSTSPARENT}/${id}',
      token: token,
    ).then((value) {
      print(value?.data);
      postsModel = PostsModel.fromJson(value?.data);
      print(postsModel?.status);
      print(postsModel?.message);
      print(postsModel?.data[0]);
      posts = postsModel?.data;
      emit(ParentPostsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ParentPostsErrorState(error.toString()));
    });
  }


  // ///Delete Post
  // void deletePost(id)
  // {
  //   emit(DeleteParentPostsLoadingState());
  //   DioHelper.getData(
  //     url: '${DELETEPOST}/${id}',
  //     token: token,
  //   ).then((value) {
  //     print(value?.data);
  //     emit(DeleteParentPostsSuccessState());
  //   }).catchError((error){
  //     print(error.toString());
  //     emit(DeleteParentPostsErrorState(error.toString()));
  //   });
  // }
  //
  // ///Edit Post
  // void editPost(
  //     {
  //       required postId,
  //       required  body,
  //       required  token,
  //     }
  //     )
  // {
  //   emit(
  //     EditParentPostsLoadingState(),
  //   );
  //   DioHelper.postData(
  //     token: token,
  //     url: '${EDITPOST}/${postId}',
  //     data: {
  //       'body': body,
  //     },
  //   ).then((value) {
  //     print(value?.data);
  //     emit(EditParentPostsSuccessState());
  //   }).catchError((error) {
  //     print(" ${error.response.data}");
  //     emit(
  //       EditParentPostsErrorState(error.toString()),
  //     );
  //   });
  //
  //
  // }


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