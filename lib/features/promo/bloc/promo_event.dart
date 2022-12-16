part of 'promo_bloc.dart';

abstract class PromoEvent extends Equatable {
  const PromoEvent();

  @override
  List<Object?> get props => [];
}

class PromoGetCurrentEvent extends PromoEvent {}

class PromoRemoveCurrentEvent extends PromoEvent {
  final String promoName;
  final BuildContext? context;

  const PromoRemoveCurrentEvent({required this.promoName, this.context});

  @override
  List<Object?> get props => [promoName, context];
}

class PromoApplyEvent extends PromoEvent {
  final String promoName;
  final BuildContext? context;

  const PromoApplyEvent({required this.promoName, this.context});

  @override
  List<Object?> get props => [promoName, context];
}
