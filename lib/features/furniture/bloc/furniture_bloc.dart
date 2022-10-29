import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/features/home/models/furniture.dart';

part 'furniture_event.dart';
part 'furniture_state.dart';

class FurnitureBloc extends Bloc<FurnitureEvent, FurnitureState> {
  FurnitureBloc()
      : super(const FurnitureState(status: FurnitureStatus.loaded)) {
    on<FurnitureSelectedEvent>((event, emit) {
      debugPrint('${event.furniture}');
    });
  }
}
