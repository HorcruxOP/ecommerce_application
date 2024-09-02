part of 'cart_bloc.dart';

abstract final class CartEvent {}

final class FetchCartEvent extends CartEvent {}

final class CalculateCartTotalEvent extends CartEvent {}

final class PaymentInitiatedEvent extends CartEvent {}

final class DeleteProductFromCartEvent extends CartEvent {
  final CartModel product;
  DeleteProductFromCartEvent(this.product);
}
