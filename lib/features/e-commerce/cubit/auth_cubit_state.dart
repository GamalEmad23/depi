part of 'auth_cubit_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}
final class AuthCubitSuccess extends AuthCubitState {
  final loginModel loginData;

  AuthCubitSuccess({required this.loginData});
}
final class AuthCubitLoading extends AuthCubitState {}
final class AuthCubitFailed extends AuthCubitState {
  final String message;

  AuthCubitFailed({required this.message});
}
