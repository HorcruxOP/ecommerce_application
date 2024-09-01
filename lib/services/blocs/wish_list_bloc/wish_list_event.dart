part of 'wish_list_bloc.dart';

abstract final class WishListEvent {}

final class FetchWishListEvent extends WishListEvent {}

final class DeleteProductFromWishListEvent extends WishListEvent {
  final ProductModel product;
  DeleteProductFromWishListEvent(this.product);
}