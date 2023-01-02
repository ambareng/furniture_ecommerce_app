part of 'credit_card_bloc.dart';

abstract class CreditCardEvent extends Equatable {
  const CreditCardEvent();

  @override
  List<Object> get props => [];
}

class GetAllCreditCardEvent extends CreditCardEvent {}

class ErrorCreditCardEvent extends CreditCardEvent {
  final Map<String, dynamic> errors;

  const ErrorCreditCardEvent({required this.errors});

  @override
  List<Object> get props => [errors];
}

class SaveCreditCardEvent extends CreditCardEvent {
  final Map<String, dynamic> creditCardPayload;

  const SaveCreditCardEvent({required this.creditCardPayload});

  @override
  List<Object> get props => [creditCardPayload];
}

class ToggleCreditCardDefaultEvent extends CreditCardEvent {
  final int creditCardId;

  const ToggleCreditCardDefaultEvent({required this.creditCardId});

  @override
  List<Object> get props => [creditCardId];
}
