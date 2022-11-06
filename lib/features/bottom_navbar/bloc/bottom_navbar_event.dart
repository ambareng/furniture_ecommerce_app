part of 'bottom_navbar_bloc.dart';

abstract class BottomNavbarEvent extends Equatable {
  const BottomNavbarEvent();

  @override
  List<Object> get props => [];
}

class BottomNavbarSelectEvent extends BottomNavbarEvent {
  final int selectedIndex;

  const BottomNavbarSelectEvent({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}
