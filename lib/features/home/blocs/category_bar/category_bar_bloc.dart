import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/auth/repositories/auth_repo.dart';
import 'package:furniture_ecommerce_app/features/home/models/furniture.dart';
import 'package:furniture_ecommerce_app/features/home/repositories/furniture_repo.dart';

part 'category_bar_event.dart';
part 'category_bar_state.dart';

class CategoryBarBloc extends Bloc<CategoryBarEvent, CategoryBarState> {
  FurnitureRepo furnitureRepo;
  AuthRepo authRepo;

  CategoryBarBloc({required this.furnitureRepo, required this.authRepo})
      : super(const CategoryBarInitial()) {
    on<CategoryBarSelectedEvent>((event, emit) async {
      emit(CategoryBarLoadingState(
          index: event.index, category: event.category));
      late List<Furniture>? furnitures;
      final String accessToken = await authRepo.getAccessToken() as String;
      if (event.category != null) {
        furnitures = await furnitureRepo.getFurnituresByCategory(
            category: event.category!, accessToken: accessToken);
      } else {
        furnitures =
            await furnitureRepo.getAllFurnitures(accessToken: accessToken);
      }
      if (furnitures != null) {
        emit(CategoryBarSelectedState(
            index: event.index,
            category: event.category,
            furnitures: furnitures));
      } else {
        emit(const CategoryBarErrorState(error: 'Unable to load furnitures!'));
      }
    });
  }
}
