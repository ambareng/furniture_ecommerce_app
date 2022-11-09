import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_ecommerce_app/core/auth/repositories/auth_repo.dart';
import 'package:furniture_ecommerce_app/features/home/models/furniture.dart';
import 'package:furniture_ecommerce_app/features/home/repositories/furniture_repo.dart';

part 'furniture_event.dart';
part 'furniture_state.dart';

class FurnitureBloc extends Bloc<FurnitureEvent, FurnitureState> {
  final FurnitureRepo repo;
  final AuthRepo authRepo;

  FurnitureBloc({required this.repo, required this.authRepo})
      : super(const FurnitureState(status: FurnitureStatus.loaded)) {
    on<FurnitureSelectedEvent>(
      (event, emit) {
        emit(FurnitureState(
            status: FurnitureStatus.loaded, furniture: event.furniture));
      },
    );
    on<FurnitureToggleBookmarkEvent>((event, emit) async {
      emit(FurnitureState(
          status: FurnitureStatus.bookmarkLoading, furniture: event.furniture));
      final String? accessToken = await authRepo.getAccessToken();
      if (accessToken != null) {
        final Furniture? furniture = await repo.toggleBookmark(
            accessToken: accessToken, furnitureId: event.furniture.id);
        if (furniture != null) {
          emit(FurnitureState(
              status: FurnitureStatus.loaded, furniture: furniture));
        }
      }
    });
  }
}
