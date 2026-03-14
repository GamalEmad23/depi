// ignore_for_file: unused_field

import 'package:depi_03/core/network/k_apis.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static final _dio = Dio(
  BaseOptions(
    baseUrl: KApis.baseUrl
  )
  );
  
  
  DioHelper._();

 static Future<Response> getData(){
  final response=_dio.get(KApis.baseUrl+KApis.login);
  return response;
  }


  static Future<Response> postData( String path ,Map <String,dynamic> body) async{
    final response =await _dio.post(path , data:body );
    return response;
  }
}