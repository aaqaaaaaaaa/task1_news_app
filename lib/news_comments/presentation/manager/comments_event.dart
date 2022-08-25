part of 'comments_bloc.dart';

@immutable
abstract class CommentsEvent {}

class GetCommentsEvent extends CommentsEvent {
  final int id;

  GetCommentsEvent(this.id);
}
