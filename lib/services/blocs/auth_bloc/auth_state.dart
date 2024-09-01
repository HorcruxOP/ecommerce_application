part of 'auth_bloc.dart';

abstract final class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {
 
}

final class AuthSuccessState extends AuthState {
  
}

final class EyeToggleState extends AuthState {
  final bool obscureText;
  EyeToggleState(this.obscureText);
}

final class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}
