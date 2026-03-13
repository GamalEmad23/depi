import 'package:bloc/bloc.dart';
import 'package:depi_03/comments_app/models/comment_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(CommentsInitial());

  
  void getComments() async{
    emit(CommentsLoading());
    Dio dio= Dio();

    try {
      var res =await dio.get("https://jsonplaceholder.typicode.com/comments");
      var data = res.data as List;
      var comments = data.map((e) => CommentModel.fromJson(e),).toList();
      emit(CommentsSuccess(comments: comments));
    } catch (e) {
       emit(CommentsFailed(message: e.toString()));
    }


  }
}
