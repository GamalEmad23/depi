// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:depi_03/core/network/dio_helper.dart';
import 'package:depi_03/core/network/k_apis.dart';
import 'package:depi_03/features/e-commerce/model/login_model.dart';
import 'package:meta/meta.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthCubitCubit() : super(AuthCubitInitial());

  void login({required String email, required String password})async {
    emit(AuthCubitLoading());

    try {
      final response =await DioHelper.postData(KApis.login, {
        "email": email,
        "password": password,
      });

      final loginData = loginModel.fromJson(response.data);
      print(loginData);
      emit(AuthCubitSuccess(loginData: loginData));
    } catch (e) {
      emit(AuthCubitFailed(message: e.toString()));
    }
  }
}
