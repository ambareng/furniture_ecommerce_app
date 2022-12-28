part of 'credit_card_bloc.dart';

enum CreditCardStatus { loaded, loading }

class CreditCardState extends Equatable {
  final CreditCardStatus status;
  final List<CreditCard>? creditCards;
  final CreditCard? defaultCreditCard;

  const CreditCardState(
      {required this.status, this.creditCards, this.defaultCreditCard});

  @override
  List<Object?> get props => [status, creditCards, defaultCreditCard];

  CreditCardState copyWith(
      {final CreditCardStatus? status,
      final List<CreditCard>? creditCards,
      final CreditCard? defaultCreditCard}) {
    return CreditCardState(
        status: status ?? this.status,
        creditCards: creditCards ?? this.creditCards,
        defaultCreditCard: defaultCreditCard ?? this.defaultCreditCard);
  }
}
