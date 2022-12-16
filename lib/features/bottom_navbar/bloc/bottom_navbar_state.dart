part of 'bottom_navbar_bloc.dart';

class BottomNavbarState extends Equatable {
  final int selectedIndex;

  const BottomNavbarState({this.selectedIndex = 0});

  @override
  List<Object> get props => [selectedIndex];
}
