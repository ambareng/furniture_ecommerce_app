part of 'furniture_bloc.dart';

enum FurnitureStatus { loaded, failure, bookmarkLoading, loading, addedToCart }

class FurnitureState extends Equatable {
  final FurnitureStatus status;
  final Furniture? furniture;
  final List<Map<String, String>>? errors;

  const FurnitureState({required this.status, this.furniture, this.errors});

  @override
  List<Object?> get props => [status, furniture, errors];

  @override
  String toString() {
    return 'FurnitureState: $status-${furniture?.name}';
  }
}

class FurnitureListState extends FurnitureState {
  final List<Furniture>? furnitures;

  const FurnitureListState({required super.status, this.furnitures});

  @override
  List<Object?> get props => [status, furniture, furnitures];
}
