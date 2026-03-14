import 'package:bloc/bloc.dart';
import 'package:depi_03/comments_app/models/comment_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(CommentsInitial());

  void getComments() async {
    emit(CommentsLoading());

    try {
      Dio dio = Dio();
      Response res = await dio.get(
        "http://jsonplaceholder.typicode.com/comments",
        options: Options(
          headers: {"Accept": "application/json"},
        ),
      );
      List data = res.data;
      var comments = data.map((e) => CommentModel.fromJson(e)).toList();
      emit(CommentsSuccess(comments: comments));
    } catch (e) {
      emit(CommentsFailed(message: e.toString()));
    }
  }
}
