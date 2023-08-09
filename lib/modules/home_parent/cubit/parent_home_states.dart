import 'package:e_school/models/create_comment_model.dart';

abstract class ParentHomeStates{}

class ParentHomeInitialState extends ParentHomeStates{}

class ParentHomeLoadingState extends ParentHomeStates{}

class ParentHomeSuccessState extends ParentHomeStates{}

class ParentHomeErrorState extends ParentHomeStates{
  final String error;
  ParentHomeErrorState(this.error);
}
class ChangeKidState extends ParentHomeStates{}

class ParentHomePostsLoadingState extends ParentHomeStates{}

class ParentHomePostsSuccessState extends ParentHomeStates{}

class ParentHomePostsErrorState extends ParentHomeStates{
  final String error;
  ParentHomePostsErrorState(this.error);
}


///LIKE
class LikeLoadingState extends ParentHomeStates{}

class LikeSuccessState extends ParentHomeStates{}

class LikeErrorState extends ParentHomeStates{
  final String error;
  LikeErrorState(this.error);
}

class ChangeIsLikedState extends ParentHomeStates{}

class ShowLikesLoadingState extends ParentHomeStates{}

class ShowLikesSuccessState extends ParentHomeStates{}

class ShowLikesErrorState extends ParentHomeStates{
  final String error;
  ShowLikesErrorState(this.error);
}
///COMMENTS
class ShowCommentsLoadingState extends ParentHomeStates{}

class ShowCommentsSuccessState extends ParentHomeStates{}

class ShowCommentsErrorState extends ParentHomeStates{
  final String error;
  ShowCommentsErrorState(this.error);
}


class CreateCommentsLoadingState extends ParentHomeStates{}

class CreateCommentsSuccessState extends ParentHomeStates{
  final CreateCommentModel createCommentModel;

  CreateCommentsSuccessState(this.createCommentModel);
}

class CreateCommentsErrorState extends ParentHomeStates{
  final String error;
  CreateCommentsErrorState(this.error);
}

class DeleteCommentInitialState extends ParentHomeStates{}

class DeleteCommentLoadingState extends ParentHomeStates{}

class DeleteCommentSuccessState extends ParentHomeStates{}

class DeleteCommentErrorState extends ParentHomeStates{
  final String error;
  DeleteCommentErrorState(this.error);
}

class EditCommentInitialState extends ParentHomeStates{}

class EditCommentLoadingState extends ParentHomeStates{}

class EditCommentSuccessState extends ParentHomeStates{}

class EditCommentErrorState extends ParentHomeStates{
  final String error;
  EditCommentErrorState(this.error);
}