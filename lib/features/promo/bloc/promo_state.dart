part of 'promo_bloc.dart';

enum PromoStateStatus { loading, loaded }

class PromoState extends Equatable {
  final PromoStateStatus status;
  final Promo? promo;

  const PromoState({required this.status, this.promo});

  @override
  List<Object?> get props => [status, promo];
}
