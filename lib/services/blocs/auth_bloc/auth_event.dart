part of 'auth_bloc.dart';

abstract final class AuthEvent {}

final class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  final String fullName;
  LoginEvent(this.email, this.password, this.fullName);
}

final class SignUpEvent extends AuthEvent {}

final class GoogleEvent extends AuthEvent {
  
}

final class ShowPasswordTappedEvent extends AuthEvent {}
