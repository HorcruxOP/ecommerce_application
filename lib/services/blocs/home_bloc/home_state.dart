part of 'home_bloc.dart';

abstract final class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeThemeChangedState extends HomeState {}

final class HomeChildChangedState extends HomeState {
  final int index;
  HomeChildChangedState(this.index);
}

final class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
}
