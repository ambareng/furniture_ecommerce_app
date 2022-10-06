part of 'category_bar_bloc.dart';

abstract class CategoryBarState extends Equatable {
  const CategoryBarState();

  @override
  List<Object> get props => [];
}

class CategoryBarInitial extends CategoryBarState {
  final int categoryIndex;

  const CategoryBarInitial({this.categoryIndex = 0});

  @override
  List<Object> get props => [categoryIndex];
}

class CategoryBarSelectedState extends CategoryBarState {
  final int categoryIndex;

  const CategoryBarSelectedState({required this.categoryIndex});

  @override
  List<Object> get props => [categoryIndex];
}
