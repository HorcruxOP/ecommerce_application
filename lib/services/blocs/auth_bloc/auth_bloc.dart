import 'dart:async';

import 'package:ecommerce_application/services/functions/auth_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  bool obscureText = true;
  String? initialValue = "";
  AuthBloc() : super(AuthInitialState()) {
    on<ShowPasswordTappedEvent>(showPasswordTappedEvent);
    on<LoginEvent>(loginEvent);
    on<GoogleEvent>(googleEvent);
  }

  FutureOr<void> showPasswordTappedEvent(
      ShowPasswordTappedEvent event, Emitter<AuthState> emit) {
    obscureText = !obscureText;
    emit(EyeToggleState(obscureText));
  }

  FutureOr<void> loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoadingState());
      await AuthFunctions.createAccount(
          event.email, event.password, event.fullName);

      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }

  FutureOr<void> googleEvent(GoogleEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoadingState());
      await AuthFunctions.signInWithGoogle();
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }
}
