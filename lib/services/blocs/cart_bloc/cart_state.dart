part of 'cart_bloc.dart';

abstract final class CartState {}

final class CartInitial extends CartState {}

final class CartLoadingState extends CartState {}

final class CartLoadedState extends CartState {}

final class ProductDeletedState extends CartState {}

final class CartErrorState extends CartState {
  final String error;
  CartErrorState(this.error);
}
