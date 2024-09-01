part of 'categories_bloc.dart';

abstract final class CategoriesState {}

final class CategoriesInitialState extends CategoriesState {}

final class CategoriesLoadingState extends CategoriesState {}

final class CategoriesLoadedState extends CategoriesState {}

final class CategoriesErrorState extends CategoriesState {}
