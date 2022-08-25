part of 'comments_bloc.dart';

@immutable
abstract class CommentsState {}

class CommentsInitial extends CommentsState {}

class CommentsLoadingState extends CommentsState {}

class CommentsNoInternetState extends CommentsState {}

class CommentsNoDataState extends CommentsState {
  final String message;

  CommentsNoDataState({required this.message});
}

class CommentsDataSuccessState extends CommentsState {
  final List<CommentsModel> list;

  CommentsDataSuccessState({required this.list});
}
