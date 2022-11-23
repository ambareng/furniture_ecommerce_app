import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_ecommerce_app/core/auth/repositories/auth_repo.dart';
import 'package:furniture_ecommerce_app/features/home/models/furniture.dart';
import 'package:furniture_ecommerce_app/features/home/repositories/furniture_repo.dart';
import 'package:http/http.dart';

part 'furniture_event.dart';
part 'furniture_state.dart';

class FurnitureBloc extends Bloc<FurnitureEvent, FurnitureState> {
  final FurnitureRepo repo;
  final AuthRepo authRepo;

  FurnitureBloc({required this.repo, required this.authRepo})
      : super(const FurnitureState(status: FurnitureStatus.loaded)) {
    on<FurnitureSelectedEvent>(
      (event, emit) async {
        emit(const FurnitureState(status: FurnitureStatus.loading));
        final String? accessToken = await authRepo.getAccessToken();
        if (accessToken != null) {
          final Furniture? furniture = await repo.getFurniture(
              accessToken: accessToken, furnitureId: event.furniture.id);
          if (furniture != null) {
            emit(FurnitureState(
                status: FurnitureStatus.loaded, furniture: furniture));
          }
        }
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
    on<FurnitureGetBookmarkedEvent>((event, emit) async {
      emit(const FurnitureState(status: FurnitureStatus.loading));
      final String? accessToken = await authRepo.getAccessToken();
      if (accessToken != null) {
        final List<Furniture>? bookmarkedFurnitures =
            await repo.getBookmarkedFurnitures(accessToken: accessToken);
        if (bookmarkedFurnitures != null) {
          emit(FurnitureListState(
              status: FurnitureStatus.loaded,
              furnitures: bookmarkedFurnitures));
        }
      }
    });
    on<FurnitureRemoveFromBookmarkEvent>((event, emit) async {
      final List<Furniture> cleanedFurnitures = event.furnitures
          .where((furniture) => furniture.id != event.furnitureId)
          .toList();
      emit(FurnitureListState(
          status: FurnitureStatus.loaded, furnitures: cleanedFurnitures));
      final String? accessToken = await authRepo.getAccessToken();
      if (accessToken != null) {
        await repo.toggleBookmark(
            accessToken: accessToken, furnitureId: event.furnitureId);
      }
    });
    on<FurnitureAddToCartEvent>((event, emit) async {
      final String? accessToken = await authRepo.getAccessToken();
      if (accessToken != null) {
        final Response res = await repo.addToCart(
            accessToken: accessToken,
            furnitureId: event.furniture.id,
            quantity: event.quantity);
        if (res.statusCode == 200) {
          emit(FurnitureState(
              status: FurnitureStatus.addedToCart, furniture: event.furniture));
        } else {
          debugPrint(res.body);
          emit(FurnitureState(
              status: FurnitureStatus.failure, furniture: event.furniture));
        }
        emit(FurnitureState(
            status: FurnitureStatus.loaded, furniture: event.furniture));
      }
    });
  }
}
