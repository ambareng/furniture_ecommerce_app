part of 'credit_card_bloc.dart';

enum CreditCardStatus { loaded, loading, saving, saveSuccess, saveError }

class CreditCardState extends Equatable {
  final CreditCardStatus status;
  final List<CreditCard>? creditCards;
  final CreditCard? defaultCreditCard;
  final Map<String, dynamic>? errors;

  const CreditCardState(
      {required this.status,
      this.creditCards,
      this.defaultCreditCard,
      this.errors});

  @override
  List<Object?> get props => [status, creditCards, defaultCreditCard, errors];

  CreditCardState copyWith(
      {final CreditCardStatus? status,
      final List<CreditCard>? creditCards,
      final CreditCard? defaultCreditCard,
      final Map<String, dynamic>? errors}) {
    return CreditCardState(
        status: status ?? this.status,
        creditCards: creditCards ?? this.creditCards,
        defaultCreditCard: defaultCreditCard ?? this.defaultCreditCard,
        errors: errors ?? this.errors);
  }
}
