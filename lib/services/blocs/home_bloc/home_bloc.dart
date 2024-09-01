import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ThemeMode themeMode = ThemeMode.system;
  int index = 0;
  HomeBloc() : super(HomeInitialState()) {
    on<HomeNavBarTappedEvent>(homeNavBarTappedEvent);
    on<ThemeModeChangeEvent>(themeModeChangeEvent);
  }

  FutureOr<void> homeNavBarTappedEvent(
    HomeNavBarTappedEvent event,
    Emitter<HomeState> emit,
  ) {
    index = event.index;
    emit(HomeChildChangedState(index));
  }

  FutureOr<void> themeModeChangeEvent(
      ThemeModeChangeEvent event, Emitter<HomeState> emit) async {
    if (event.switchValue) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    emit(HomeThemeChangedState());
  }
}
