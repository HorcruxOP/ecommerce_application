part of 'home_page_bloc.dart';

abstract final class HomePageEvent {}

final class FetchHomePageEvent extends HomePageEvent {}

final class SearchIconTappedEvent extends HomePageEvent {}

final class AllProductsViewTappedEvent extends HomePageEvent {
  final BuildContext context;
  final List<ProductModel> list;
  AllProductsViewTappedEvent(this.context, this.list);
}

final class CategoryTappedEvent extends HomePageEvent {}

final class ProductTappedEvent extends HomePageEvent {
  final ProductModel data;
  final BuildContext context;
  ProductTappedEvent(this.data, this.context);
}

final class ProductLikedEvent extends HomePageEvent {
  final ProductModel product;
  ProductLikedEvent(this.product);
}
