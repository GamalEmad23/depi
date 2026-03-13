part of 'comments_cubit.dart';

@immutable
sealed class CommentsState {}

final class CommentsInitial extends CommentsState {}
final class CommentsLoading extends CommentsState {}
final class CommentsSuccess extends CommentsState {
  final List<CommentModel> comments;

  CommentsSuccess({required this.comments});
}
final class CommentsFailed extends CommentsState {
  final String message;

  CommentsFailed({required this.message});
}
