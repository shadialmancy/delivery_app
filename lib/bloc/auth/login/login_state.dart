part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class GetUserLoading extends LoginState {}

class GetUserSuccess extends LoginState {}

class GetUserError extends LoginState {}

class GetUserFailed extends LoginState {}

class ChangeVisibility extends LoginState {}
