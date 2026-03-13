// ignore_for_file: public_member_api_docs, sort_constructors_first
class UsersModel {
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  UsersModel({
     this.name,
     this.username,
     this.email,
     this.address,
     this.phone,
  });

  UsersModel.fromJson(Map json){
    name=json["name"];
    username=json["username"];
    email=json["email"];
    address= json['address'] != null ?  Address.fromJson(json['address']) : null; 
    phone=json["phone"];
  }
  
}

class Address {
  String? city;
  String? street;
  Address({
     this.city,
     this.street,
  });
  
Address.fromJson(Map json){
  city=json["city"];
  street=json["street"];
}
}






