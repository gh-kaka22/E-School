abstract class PostsStates{}

class PostsInitialState extends PostsStates{}

class PostsLoadingState extends PostsStates{}

class PostsSuccessState extends PostsStates{}

class PostsErrorState extends PostsStates{
  final String error;
  PostsErrorState(this.error);
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

class ShowCommentsLoadingState extends PostsStates{}

class ShowCommentsSuccessState extends PostsStates{}

class ShowCommentsErrorState extends PostsStates{
  final String error;
  ShowCommentsErrorState(this.error);
}