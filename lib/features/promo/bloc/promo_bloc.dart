import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/auth/repositories/auth_repo.dart';
import 'package:furniture_ecommerce_app/features/my_cart/bloc/my_cart_total_bloc.dart';
import 'package:furniture_ecommerce_app/features/promo/models/promo.dart';
import 'package:furniture_ecommerce_app/features/promo/repositories/promo_repo.dart';

part 'promo_event.dart';
part 'promo_state.dart';

class PromoBloc extends Bloc<PromoEvent, PromoState> {
  final AuthRepo authRepo;
  final PromoRepo promoRepo;

  PromoBloc({required this.authRepo, required this.promoRepo})
      : super(const PromoState(status: PromoStateStatus.loading)) {
    on<PromoGetCurrentEvent>((event, emit) async {
      emit(const PromoState(status: PromoStateStatus.loading));
      final String? accessToken = await authRepo.getAccessToken();
      if (accessToken != null) {
        final Promo? currentPromo =
            await promoRepo.getCurrentPromo(accessToken: accessToken);
        if (currentPromo != null) {
          emit(
              PromoState(status: PromoStateStatus.loaded, promo: currentPromo));
          return;
        }
      }
      emit(const PromoState(status: PromoStateStatus.loaded));
    });
    on<PromoRemoveCurrentEvent>((event, emit) async {
      emit(const PromoState(status: PromoStateStatus.loading));
      final String? accessToken = await authRepo.getAccessToken();
      if (accessToken != null) {
        if (await promoRepo.removeCurrentPromo(
            accessToken: accessToken, promoName: event.promoName)) {
          emit(const PromoState(status: PromoStateStatus.loaded));
          return;
        }
      }
      if (event.context != null) {
        BlocProvider.of<MyCartTotalBloc>(event.context!)
            .add(GetMyCartTotalEvent());
      }
      emit(const PromoState(
          status: PromoStateStatus.loaded, error: 'Something went wrong!'));
    });
    on<PromoApplyEvent>((event, emit) async {
      emit(const PromoState(status: PromoStateStatus.loading));
      final String? accessToken = await authRepo.getAccessToken();
      if (accessToken != null) {
        final Promo? currentPromo = await promoRepo.applyPromo(
            accessToken: accessToken, promoName: event.promoName);
        if (currentPromo != null) {
          emit(
              PromoState(status: PromoStateStatus.loaded, promo: currentPromo));
          return;
        }
      }
      if (event.context != null) {
        BlocProvider.of<MyCartTotalBloc>(event.context!)
            .add(GetMyCartTotalEvent());
      }
      emit(const PromoState(
          status: PromoStateStatus.loaded, error: 'Invalid promo code!'));
    });
  }
}
