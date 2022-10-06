part of 'category_bar_bloc.dart';

abstract class CategoryBarEvent extends Equatable {
  const CategoryBarEvent();

  @override
  List<Object> get props => [];
}

class CategoryBarSelectedEvent extends CategoryBarEvent {
  final int categoryIndex;

  const CategoryBarSelectedEvent({required this.categoryIndex});

  @override
  List<Object> get props => [categoryIndex];
}
