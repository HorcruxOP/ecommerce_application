import 'dart:async';

import 'package:ecommerce_application/pages/others/product_detail_page.dart';
import 'package:ecommerce_application/services/functions/homepage_functions.dart';
import 'package:ecommerce_application/services/functions/wishlist_functions.dart';
import 'package:ecommerce_application/services/models/categories_model.dart';
import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  List<ProductModel> productsList = [];
  List<CategoriesModel> categoriesList = [];
  HomePageBloc() : super(HomePageInitialState()) {
    on<FetchHomePageEvent>(homePageEvent);
    add(FetchHomePageEvent());
    on<ProductTappedEvent>(productTappedEvent);
    on<ProductLikedEvent>(productLikedEvent);
  }

  FutureOr<void> homePageEvent(
      FetchHomePageEvent event, Emitter<HomePageState> emit) async {
    try {
      emit(HomePageLoadingState());
      categoriesList = await HomepageFunctions.fetchCategories();
      productsList = await HomepageFunctions.fetchProductsList();
      emit(HomePageLoadedState());
    } catch (e) {
      emit(HomePageErrorState(e.toString()));
    }
  }

  FutureOr<void> productTappedEvent(
      ProductTappedEvent event, Emitter<HomePageState> emit) {
    Navigator.push(
      event.context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(product: event.data),
      ),
    );
  }

  FutureOr<void> productLikedEvent(
      ProductLikedEvent event, Emitter<HomePageState> emit) async {
    try {
      await WishlistFunctions.addToWishList(event.product);
    } catch (e) {
      emit(HomePageErrorState(e.toString()));
    }
  }
}
