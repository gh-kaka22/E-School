import 'package:e_school/models/create_comment_model.dart';

abstract class ParentPostsStates{}

class ParentPostsInitialState extends ParentPostsStates{}

class ParentPostsLoadingState extends ParentPostsStates{}

class ParentPostsSuccessState extends ParentPostsStates{}

class ParentPostsErrorState extends ParentPostsStates{
  final String error;
  ParentPostsErrorState(this.error);
}

class DeleteParentPostsInitialState extends ParentPostsStates{}

class DeleteParentPostsLoadingState extends ParentPostsStates{}

class DeleteParentPostsSuccessState extends ParentPostsStates{}

class DeleteParentPostsErrorState extends ParentPostsStates{
  final String error;
  DeleteParentPostsErrorState(this.error);
}

class EditParentPostsInitialState extends ParentPostsStates{}

class EditParentPostsLoadingState extends ParentPostsStates{}

class EditParentPostsSuccessState extends ParentPostsStates{}

class EditParentPostsErrorState extends ParentPostsStates{
  final String error;
  EditParentPostsErrorState(this.error);
}

///LIKE
class LikeLoadingState extends ParentPostsStates{}

class LikeSuccessState extends ParentPostsStates{}

class LikeErrorState extends ParentPostsStates{
  final String error;
  LikeErrorState(this.error);
}

class ChangeIsLikedState extends ParentPostsStates{}

class ShowLikesLoadingState extends ParentPostsStates{}

class ShowLikesSuccessState extends ParentPostsStates{}

class ShowLikesErrorState extends ParentPostsStates{
  final String error;
  ShowLikesErrorState(this.error);
}
///COMMENTS
class ShowCommentsLoadingState extends ParentPostsStates{}

class ShowCommentsSuccessState extends ParentPostsStates{}

class ShowCommentsErrorState extends ParentPostsStates{
  final String error;
  ShowCommentsErrorState(this.error);
}


class CreateCommentsLoadingState extends ParentPostsStates{}

class CreateCommentsSuccessState extends ParentPostsStates{
  final CreateCommentModel createCommentModel;

  CreateCommentsSuccessState(this.createCommentModel);
}

class CreateCommentsErrorState extends ParentPostsStates{
  final String error;
  CreateCommentsErrorState(this.error);
}

class DeleteCommentInitialState extends ParentPostsStates{}

class DeleteCommentLoadingState extends ParentPostsStates{}

class DeleteCommentSuccessState extends ParentPostsStates{}

class DeleteCommentErrorState extends ParentPostsStates{
  final String error;
  DeleteCommentErrorState(this.error);
}

class EditCommentInitialState extends ParentPostsStates{}

class EditCommentLoadingState extends ParentPostsStates{}

class EditCommentSuccessState extends ParentPostsStates{}

class EditCommentErrorState extends ParentPostsStates{
  final String error;
  EditCommentErrorState(this.error);
}