import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navbar_event.dart';
part 'bottom_navbar_state.dart';

class BottomNavbarBloc extends Bloc<BottomNavbarEvent, BottomNavbarState> {
  BottomNavbarBloc() : super(const BottomNavbarState()) {
    on<BottomNavbarSelectEvent>((event, emit) {
      emit(BottomNavbarState(selectedIndex: event.selectedIndex));
    });
  }
}
