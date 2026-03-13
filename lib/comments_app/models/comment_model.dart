// ignore_for_file: public_member_api_docs, sort_constructors_first
class CommentModel {
  int? postId;
  String? name;
  String? email;
  String? body;
  CommentModel({
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  CommentModel.fromJson(Map json){
   postId=json['postId'];
   name=json['name'];
   email=json['email'];
   body=json['body'];
  }
}

