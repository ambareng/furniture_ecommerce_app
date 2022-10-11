import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
      await Future.delayed(const Duration(seconds: 2));
      // await furnitureRepo.getAllFurnitures();
      emit(CategoryBarSelectedState(
          index: event.index, category: event.category));
    });
  }
}
