part of 'home_page_bloc.dart';

abstract final class HomePageState {}

abstract final class HomePageActionState extends HomePageState{}

final class HomePageInitialState extends HomePageState {}

final class HomePageLoadingState extends HomePageState {}

final class HomePageLoadedState extends HomePageState {
 
}

final class HomePageErrorState extends HomePageState {
  final String error;
  HomePageErrorState(this.error);
}
 
final class AllCategoriesTappedState extends HomePageActionState{}