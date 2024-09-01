import 'dart:async';

import 'package:ecommerce_application/services/functions/homepage_functions.dart';
import 'package:ecommerce_application/services/models/categories_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  List<CategoriesModel> categoriesList = [];
  CategoriesBloc() : super(CategoriesInitialState()) {
    on<FetchCategoriesEvent>(fetchCategoriesEvent);
    add(FetchCategoriesEvent());
  }

  FutureOr<void> fetchCategoriesEvent(
      FetchCategoriesEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoadingState());
    categoriesList = await HomepageFunctions.fetchCategories();
    emit(CategoriesLoadedState());
  }
}
