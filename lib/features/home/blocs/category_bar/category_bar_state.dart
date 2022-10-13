part of 'category_bar_bloc.dart';

abstract class CategoryBarState extends Equatable {
  const CategoryBarState();
}

class CategoryBarInitial extends CategoryBarState {
  final int index;
  final String? category;

  const CategoryBarInitial({this.index = 0, this.category});

  @override
  List<Object?> get props => [index, category];
}

class CategoryBarSelectedState extends CategoryBarState {
  final int index;
  final String? category;
  final List<Furniture> furnitures;

  const CategoryBarSelectedState(
      {required this.index, this.category, required this.furnitures});

  @override
  List<Object?> get props => [index, category];
}

class CategoryBarLoadingState extends CategoryBarState {
  final int index;
  final String? category;

  const CategoryBarLoadingState({required this.index, this.category});

  @override
  List<Object?> get props => [index, category];
}

class CategoryBarErrorState extends CategoryBarState {
  final String error;

  const CategoryBarErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
