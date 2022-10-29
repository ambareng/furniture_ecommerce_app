part of 'furniture_bloc.dart';

enum FurnitureStatus { loaded, failure }

class FurnitureState extends Equatable {
  final FurnitureStatus status;
  final Furniture? furniture;

  const FurnitureState({required this.status, this.furniture});

  @override
  List<Object?> get props => [status, furniture];

  @override
  String toString() {
    return 'FurnitureState: $status-${furniture?.name}';
  }
}
