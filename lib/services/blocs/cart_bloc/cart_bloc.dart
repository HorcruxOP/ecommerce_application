import 'dart:async';

import 'package:ecommerce_application/services/functions/cart_functions.dart';
import 'package:ecommerce_application/services/models/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<CartModel> cartList = [];
  double total = 0;
  CartBloc() : super(CartInitial()) {
    on<FetchCartEvent>(fetchCartEvent);
    add(FetchCartEvent());
    on<DeleteProductFromCartEvent>(deleteProductFromCartEvent);
    on<CalculateCartTotalEvent>(calculateCartTotalEvent);
    on<PaymentInitiatedEvent>(paymentInitiatedEvent);
  }

  FutureOr<void> fetchCartEvent(
      FetchCartEvent event, Emitter<CartState> emit) async {
    try {
      total = 0;
      emit(CartLoadingState());
      cartList = await CartFunctions.fetchCart();
      for (var element in cartList) {
        total += (element.price) * element.quantity;
      }
      emit(CartLoadedState());
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  FutureOr<void> calculateCartTotalEvent(
      CalculateCartTotalEvent event, Emitter<CartState> emit) async {
    try {
      total = 0;
      cartList = await CartFunctions.fetchCart();
      for (var element in cartList) {
        total += (element.price) * element.quantity;
      }
      emit(CartLoadedState());
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  FutureOr<void> deleteProductFromCartEvent(
      DeleteProductFromCartEvent event, Emitter<CartState> emit) async {
    try {
      await CartFunctions.removeFromCart(event.product);
      cartList = await CartFunctions.fetchCart();
      emit(ProductDeletedState());
    } catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }

  FutureOr<void> paymentInitiatedEvent(
      PaymentInitiatedEvent event, Emitter<CartState> emit) async {
    try {} catch (e) {
      emit(CartErrorState(e.toString()));
    }
  }
}
