import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'furniture_order_quantity_event.dart';
part 'furniture_order_quantity_state.dart';

class FurnitureOrderQuantityBloc
    extends Bloc<FurnitureOrderQuantityEvent, FurnitureOrderQuantityState> {
  FurnitureOrderQuantityBloc() : super(const FurnitureOrderQuantityState()) {
    on<FurnitureOrderQuantityAddEvent>((event, emit) {
      emit(FurnitureOrderQuantityState(quantity: event.currentQuantity + 1));
    });
    on<FurnitureOrderQuantityRemoveEvent>((event, emit) {
      emit(FurnitureOrderQuantityState(
          quantity: event.currentQuantity > 1 ? event.currentQuantity - 1 : 1));
    });
    on<FurnitureOrderQuantityResetEvent>((event, emit) {
      emit(const FurnitureOrderQuantityState());
    });
  }
}
