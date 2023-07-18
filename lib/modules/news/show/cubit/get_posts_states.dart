import 'package:untitled/models/create_comment_model.dart';

abstract class GetPostsStates{}

class GetPostsInitialState extends GetPostsStates{}

class GetPostsLoadingState extends GetPostsStates{}

class GetPostsSuccessState extends GetPostsStates{}

class GetPostsErrorState extends GetPostsStates{
  final String error;
  GetPostsErrorState(this.error);
}

class DeletePostsInitialState extends GetPostsStates{}

class DeletePostsLoadingState extends GetPostsStates{}

class DeletePostsSuccessState extends GetPostsStates{}

class DeletePostsErrorState extends GetPostsStates{
  final String error;
  DeletePostsErrorState(this.error);
}

class EditPostsInitialState extends GetPostsStates{}

class EditPostsLoadingState extends GetPostsStates{}

class EditPostsSuccessState extends GetPostsStates{}

class EditPostsErrorState extends GetPostsStates{
  final String error;
  EditPostsErrorState(this.error);
}

///LIKE
class LikeLoadingState extends GetPostsStates{}

class LikeSuccessState extends GetPostsStates{}

class LikeErrorState extends GetPostsStates{
  final String error;
  LikeErrorState(this.error);
}

class ChangeIsLikedState extends GetPostsStates{}

class ShowLikesLoadingState extends GetPostsStates{}

class ShowLikesSuccessState extends GetPostsStates{}

class ShowLikesErrorState extends GetPostsStates{
  final String error;
  ShowLikesErrorState(this.error);
}
///COMMENTS
class ShowCommentsLoadingState extends GetPostsStates{}

class ShowCommentsSuccessState extends GetPostsStates{}

class ShowCommentsErrorState extends GetPostsStates{
  final String error;
  ShowCommentsErrorState(this.error);
}


class CreateCommentsLoadingState extends GetPostsStates{}

class CreateCommentsSuccessState extends GetPostsStates{
  final CreateCommentModel createCommentModel;

  CreateCommentsSuccessState(this.createCommentModel);
}

class CreateCommentsErrorState extends GetPostsStates{
  final String error;
  CreateCommentsErrorState(this.error);
}

class DeleteCommentInitialState extends GetPostsStates{}

class DeleteCommentLoadingState extends GetPostsStates{}

class DeleteCommentSuccessState extends GetPostsStates{}

class DeleteCommentErrorState extends GetPostsStates{
  final String error;
  DeleteCommentErrorState(this.error);
}

class EditCommentInitialState extends GetPostsStates{}

class EditCommentLoadingState extends GetPostsStates{}

class EditCommentSuccessState extends GetPostsStates{}

class EditCommentErrorState extends GetPostsStates{
  final String error;
  EditCommentErrorState(this.error);
}