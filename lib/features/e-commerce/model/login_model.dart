class loginModel {
  int? statusCode;
  Data? data;
  String? message;

  loginModel({this.statusCode, this.data, this.message});

  loginModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    message = json['message'];
  }

}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }


}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;

  User({this.id, this.name, this.email, this.phone, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
  }

}