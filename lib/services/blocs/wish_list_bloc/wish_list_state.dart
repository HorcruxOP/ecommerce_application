part of 'wish_list_bloc.dart';

abstract final class WishListState {}

final class WishListInitialState extends WishListState {}

final class WishListLoadingState extends WishListState {}

final class WishListLoadedState extends WishListState {}

final class ProductDeletedState extends WishListState {}


final class WishListErrorState extends WishListState {
  final String error;
  WishListErrorState(this.error);
}
