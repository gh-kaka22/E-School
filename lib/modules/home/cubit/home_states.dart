import 'package:e_school/models/create_comment_model.dart';

abstract class HomeStates{}

class HomeInitialState extends HomeStates{}

class HomeLoadingState extends HomeStates{}

class HomeSuccessState extends HomeStates{}

class HomeErrorState extends HomeStates{
  final String error;
  HomeErrorState(this.error);
}


///LIKE
class LikeLoadingState extends HomeStates{}

class LikeSuccessState extends HomeStates{}

class LikeErrorState extends HomeStates{
  final String error;
  LikeErrorState(this.error);
}

class ChangeIsLikedState extends HomeStates{}

class ShowLikesLoadingState extends HomeStates{}

class ShowLikesSuccessState extends HomeStates{}

class ShowLikesErrorState extends HomeStates{
  final String error;
  ShowLikesErrorState(this.error);
}
///COMMENTS
class ShowCommentsLoadingState extends HomeStates{}

class ShowCommentsSuccessState extends HomeStates{}

class ShowCommentsErrorState extends HomeStates{
  final String error;
  ShowCommentsErrorState(this.error);
}


class CreateCommentsLoadingState extends HomeStates{}

class CreateCommentsSuccessState extends HomeStates{
  final CreateCommentModel createCommentModel;

  CreateCommentsSuccessState(this.createCommentModel);
}

class CreateCommentsErrorState extends HomeStates{
  final String error;
  CreateCommentsErrorState(this.error);
}

class DeleteCommentInitialState extends HomeStates{}

class DeleteCommentLoadingState extends HomeStates{}

class DeleteCommentSuccessState extends HomeStates{}

class DeleteCommentErrorState extends HomeStates{
  final String error;
  DeleteCommentErrorState(this.error);
}

class EditCommentInitialState extends HomeStates{}

class EditCommentLoadingState extends HomeStates{}

class EditCommentSuccessState extends HomeStates{}

class EditCommentErrorState extends HomeStates{
  final String error;
  EditCommentErrorState(this.error);
}