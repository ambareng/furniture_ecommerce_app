part of 'promo_bloc.dart';

enum PromoStateStatus { loading, loaded }

class PromoState extends Equatable {
  final PromoStateStatus status;
  final Promo? promo;
  final String? error;

  const PromoState({required this.status, this.promo, this.error});

  @override
  List<Object?> get props => [status, promo, error];
}
