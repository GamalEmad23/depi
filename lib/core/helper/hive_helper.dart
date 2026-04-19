import 'package:hive/hive.dart';

class  HiveHelper {

  static const tokenBox="token";

  static void setToken(String token){
    Hive.box(tokenBox).put(tokenBox, token);
  }

  static String getToken(){
    if (Hive.box(tokenBox).isNotEmpty) {
      return Hive.box(tokenBox).get(tokenBox);
    }else{
      return "";
    }
  }
}