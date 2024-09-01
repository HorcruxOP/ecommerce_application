import 'dart:async';

import 'package:ecommerce_application/services/functions/wishlist_functions.dart';
import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  List<ProductModel> wishList = [];
  WishListBloc() : super(WishListInitialState()) {
    on<FetchWishListEvent>(fetchWishListEvent);
    add(FetchWishListEvent());
    on<DeleteProductFromWishListEvent>(deleteProductFromWishListEvent);
  }

  FutureOr<void> fetchWishListEvent(
      FetchWishListEvent event, Emitter<WishListState> emit) async {
    try {
      emit(WishListLoadingState());
      wishList = await WishlistFunctions.fetchWishList();
      emit(WishListLoadedState());
    } catch (e) {
      emit(WishListErrorState(e.toString()));
    }
  }

  FutureOr<void> deleteProductFromWishListEvent(
      DeleteProductFromWishListEvent event, Emitter<WishListState> emit) async {
    try {
      await WishlistFunctions.removeFromWishList(event.product);
      wishList = await WishlistFunctions.fetchWishList();
      emit(ProductDeletedState());
    } catch (e) {
      emit(WishListErrorState(e.toString()));
    }
  }

  
}
