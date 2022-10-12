part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailed extends RegisterState {}

class ChangeVisibility extends RegisterState {}

class RegisterEmailDuplicated extends RegisterState {}
