part of 'category_bar_bloc.dart';

abstract class CategoryBarEvent extends Equatable {
  const CategoryBarEvent();
}

class CategoryBarSelectedEvent extends CategoryBarEvent {
  final int index;
  final String? category;

  const CategoryBarSelectedEvent({required this.index, this.category});

  @override
  List<Object?> get props => [index, category];
}

class CategoryBarOnScrollEvent extends CategoryBarEvent {
  final int index;
  final String? category;
  final List<Furniture> furnitures;

  const CategoryBarOnScrollEvent(
      {required this.furnitures, required this.index, this.category});

  @override
  List<Object?> get props => [index, category, furnitures];
}
