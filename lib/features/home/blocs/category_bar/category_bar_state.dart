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

  const CategoryBarSelectedState({required this.index, this.category});

  @override
  List<Object?> get props => [index, category];
}

class CategoryBarLoadingState extends CategoryBarState {
  @override
  List<Object> get props => [];
}
