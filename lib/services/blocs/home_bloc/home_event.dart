part of 'home_bloc.dart';

abstract final class HomeEvent {}

final class HomeNavBarTappedEvent extends HomeEvent {
  final int index;
  HomeNavBarTappedEvent(this.index);
}

final class ThemeModeChangeEvent extends HomeEvent {
  final bool switchValue;
  ThemeModeChangeEvent(this.switchValue);
}
