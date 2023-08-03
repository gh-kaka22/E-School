import 'package:e_school/models/create_comment_model.dart';

abstract class TeacherPostsStates{}

class TeacherPostsInitialState extends TeacherPostsStates{}

class TeacherPostsLoadingState extends TeacherPostsStates{}

class TeacherPostsSuccessState extends TeacherPostsStates{}

class TeacherPostsErrorState extends TeacherPostsStates{
  final String error;
  TeacherPostsErrorState(this.error);
}

class DeleteTeacherPostsInitialState extends TeacherPostsStates{}

class DeleteTeacherPostsLoadingState extends TeacherPostsStates{}

class DeleteTeacherPostsSuccessState extends TeacherPostsStates{}

class DeleteTeacherPostsErrorState extends TeacherPostsStates{
  final String error;
  DeleteTeacherPostsErrorState(this.error);
}

class EditTeacherPostsInitialState extends TeacherPostsStates{}

class EditTeacherPostsLoadingState extends TeacherPostsStates{}

class EditTeacherPostsSuccessState extends TeacherPostsStates{}

class EditTeacherPostsErrorState extends TeacherPostsStates{
  final String error;
  EditTeacherPostsErrorState(this.error);
}

///LIKE
class LikeLoadingState extends TeacherPostsStates{}

class LikeSuccessState extends TeacherPostsStates{}

class LikeErrorState extends TeacherPostsStates{
  final String error;
  LikeErrorState(this.error);
}

class ChangeIsLikedState extends TeacherPostsStates{}

class ShowLikesLoadingState extends TeacherPostsStates{}

class ShowLikesSuccessState extends TeacherPostsStates{}

class ShowLikesErrorState extends TeacherPostsStates{
  final String error;
  ShowLikesErrorState(this.error);
}
///COMMENTS
class ShowCommentsLoadingState extends TeacherPostsStates{}

class ShowCommentsSuccessState extends TeacherPostsStates{}

class ShowCommentsErrorState extends TeacherPostsStates{
  final String error;
  ShowCommentsErrorState(this.error);
}


class CreateCommentsLoadingState extends TeacherPostsStates{}

class CreateCommentsSuccessState extends TeacherPostsStates{
  final CreateCommentModel createCommentModel;

  CreateCommentsSuccessState(this.createCommentModel);
}

class CreateCommentsErrorState extends TeacherPostsStates{
  final String error;
  CreateCommentsErrorState(this.error);
}

class DeleteCommentInitialState extends TeacherPostsStates{}

class DeleteCommentLoadingState extends TeacherPostsStates{}

class DeleteCommentSuccessState extends TeacherPostsStates{}

class DeleteCommentErrorState extends TeacherPostsStates{
  final String error;
  DeleteCommentErrorState(this.error);
}

class EditCommentInitialState extends TeacherPostsStates{}

class EditCommentLoadingState extends TeacherPostsStates{}

class EditCommentSuccessState extends TeacherPostsStates{}

class EditCommentErrorState extends TeacherPostsStates{
  final String error;
  EditCommentErrorState(this.error);
}