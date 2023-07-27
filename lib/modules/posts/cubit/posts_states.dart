import 'package:e_school/models/create_comment_model.dart';

abstract class PostsStates{}

class PostsInitialState extends PostsStates{}

class PostsLoadingState extends PostsStates{}

class PostsSuccessState extends PostsStates{}

class PostsErrorState extends PostsStates{
  final String error;
  PostsErrorState(this.error);
}

class DeletePostsInitialState extends PostsStates{}

class DeletePostsLoadingState extends PostsStates{}

class DeletePostsSuccessState extends PostsStates{}

class DeletePostsErrorState extends PostsStates{
  final String error;
  DeletePostsErrorState(this.error);
}

class EditPostsInitialState extends PostsStates{}

class EditPostsLoadingState extends PostsStates{}

class EditPostsSuccessState extends PostsStates{}

class EditPostsErrorState extends PostsStates{
  final String error;
  EditPostsErrorState(this.error);
}

///LIKE
class LikeLoadingState extends PostsStates{}

class LikeSuccessState extends PostsStates{}

class LikeErrorState extends PostsStates{
  final String error;
  LikeErrorState(this.error);
}

class ChangeIsLikedState extends PostsStates{}

class ShowLikesLoadingState extends PostsStates{}

class ShowLikesSuccessState extends PostsStates{}

class ShowLikesErrorState extends PostsStates{
  final String error;
  ShowLikesErrorState(this.error);
}
///COMMENTS
class ShowCommentsLoadingState extends PostsStates{}

class ShowCommentsSuccessState extends PostsStates{}

class ShowCommentsErrorState extends PostsStates{
  final String error;
  ShowCommentsErrorState(this.error);
}


class CreateCommentsLoadingState extends PostsStates{}

class CreateCommentsSuccessState extends PostsStates{
  final CreateCommentModel createCommentModel;

  CreateCommentsSuccessState(this.createCommentModel);
}

class CreateCommentsErrorState extends PostsStates{
  final String error;
  CreateCommentsErrorState(this.error);
}

class DeleteCommentInitialState extends PostsStates{}

class DeleteCommentLoadingState extends PostsStates{}

class DeleteCommentSuccessState extends PostsStates{}

class DeleteCommentErrorState extends PostsStates{
  final String error;
  DeleteCommentErrorState(this.error);
}

class EditCommentInitialState extends PostsStates{}

class EditCommentLoadingState extends PostsStates{}

class EditCommentSuccessState extends PostsStates{}

class EditCommentErrorState extends PostsStates{
  final String error;
  EditCommentErrorState(this.error);
}