import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/features/home/models/furniture.dart';
import 'package:furniture_ecommerce_app/features/home/repositories/furniture_repo.dart';

part 'category_bar_event.dart';
part 'category_bar_state.dart';

class CategoryBarBloc extends Bloc<CategoryBarEvent, CategoryBarState> {
  FurnitureRepo furnitureRepo;

  CategoryBarBloc({required this.furnitureRepo})
      : super(const CategoryBarInitial()) {
    on<CategoryBarSelectedEvent>((event, emit) async {
      emit(CategoryBarLoadingState(
          index: event.index, category: event.category));
      late List<Furniture>? furnitures;
      if (event.category != null) {
        furnitures = await furnitureRepo.getFurnituresByCategory(
            category: event.category!);
      } else {
        furnitures = await furnitureRepo.getAllFurnitures();
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
    on<CategoryBarOnScrollEvent>((event, emit) async {
      emit(CategoryLoadMoreState(
          index: event.index,
          category: event.category,
          furnitures: event.furnitures));
      furnitureRepo.addPageOffset();
      final furnitures = await furnitureRepo.getAllFurnitures();
      debugPrint('$furnitures');
      if (furnitures != null) {
        debugPrint('ok!?');
        emit(CategoryBarSelectedState(
            index: event.index,
            category: event.category,
            furnitures: [...event.furnitures, ...furnitures]));
      } else {
        emit(const CategoryBarErrorState(error: 'Unable to load furnitures!'));
      }
    });
  }
}
