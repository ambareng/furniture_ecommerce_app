import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'category_bar_event.dart';
part 'category_bar_state.dart';

class CategoryBarBloc extends Bloc<CategoryBarEvent, CategoryBarState> {
  CategoryBarBloc() : super(const CategoryBarInitial()) {
    on<CategoryBarSelectedEvent>((event, emit) {
      debugPrint('===================================');
      debugPrint('${event.categoryIndex}');
      debugPrint('===================================');
      emit(CategoryBarSelectedState(categoryIndex: event.categoryIndex));
    });
  }
}
