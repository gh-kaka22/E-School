import 'package:e_school/models/create_comment_model.dart';

abstract class TeacherHomeStates{}

class TeacherHomeInitialState extends TeacherHomeStates{}

class TeacherHomeLoadingState extends TeacherHomeStates{}

class TeacherHomeSuccessState extends TeacherHomeStates{}

class TeacherHomeErrorState extends TeacherHomeStates{
  final String error;
  TeacherHomeErrorState(this.error);
}


class TeacherHomePostsLoadingState extends TeacherHomeStates{}

class TeacherHomePostsSuccessState extends TeacherHomeStates{}

class TeacherHomePostsErrorState extends TeacherHomeStates{
  final String error;
  TeacherHomePostsErrorState(this.error);
}

///LIKE
class LikeLoadingState extends TeacherHomeStates{}

class LikeSuccessState extends TeacherHomeStates{}

class LikeErrorState extends TeacherHomeStates{
  final String error;
  LikeErrorState(this.error);
}

class ChangeIsLikedState extends TeacherHomeStates{}

class ShowLikesLoadingState extends TeacherHomeStates{}

class ShowLikesSuccessState extends TeacherHomeStates{}

class ShowLikesErrorState extends TeacherHomeStates{
  final String error;
  ShowLikesErrorState(this.error);
}
///COMMENTS
class ShowCommentsLoadingState extends TeacherHomeStates{}

class ShowCommentsSuccessState extends TeacherHomeStates{}

class ShowCommentsErrorState extends TeacherHomeStates{
  final String error;
  ShowCommentsErrorState(this.error);
}


class CreateCommentsLoadingState extends TeacherHomeStates{}

class CreateCommentsSuccessState extends TeacherHomeStates{
  final CreateCommentModel createCommentModel;

  CreateCommentsSuccessState(this.createCommentModel);
}

class CreateCommentsErrorState extends TeacherHomeStates{
  final String error;
  CreateCommentsErrorState(this.error);
}

class DeleteCommentInitialState extends TeacherHomeStates{}

class DeleteCommentLoadingState extends TeacherHomeStates{}

class DeleteCommentSuccessState extends TeacherHomeStates{}

class DeleteCommentErrorState extends TeacherHomeStates{
  final String error;
  DeleteCommentErrorState(this.error);
}

class EditCommentInitialState extends TeacherHomeStates{}

class EditCommentLoadingState extends TeacherHomeStates{}

class EditCommentSuccessState extends TeacherHomeStates{}

class EditCommentErrorState extends TeacherHomeStates{
  final String error;
  EditCommentErrorState(this.error);
}