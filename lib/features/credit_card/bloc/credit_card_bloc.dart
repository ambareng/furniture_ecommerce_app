import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_ecommerce_app/core/auth/repositories/auth_repo.dart';
import 'package:furniture_ecommerce_app/features/credit_card/models/credit_card.dart';
import 'package:furniture_ecommerce_app/features/credit_card/repositories/credit_card_repo.dart';

part 'credit_card_event.dart';
part 'credit_card_state.dart';

class CreditCardBloc extends Bloc<CreditCardEvent, CreditCardState> {
  final AuthRepo authRepo;
  final CreditCardRepo creditCardRepo;

  CreditCardBloc({required this.authRepo, required this.creditCardRepo})
      : super(const CreditCardState(status: CreditCardStatus.loading)) {
    on<GetAllCreditCardEvent>((event, emit) async {
      emit(state.copyWith(status: CreditCardStatus.loading));
      final String? accessToken = await authRepo.getAccessToken();
      if (accessToken != null) {
        final List<CreditCard>? creditCards =
            await creditCardRepo.getAllCreditCards(accessToken: accessToken);
        if (creditCards != null && creditCards.isNotEmpty) {
          CreditCard? defaultCreditCard;
          for (CreditCard card in creditCards) {
            if (card.is_default) {
              defaultCreditCard = card;
              break;
            }
          }
          emit(state.copyWith(
              status: CreditCardStatus.loaded,
              creditCards: creditCards,
              defaultCreditCard: defaultCreditCard));
          return;
        }
      }
      emit(state.copyWith(status: CreditCardStatus.loaded));
    });
    on<ErrorCreditCardEvent>((event, emit) async {
      emit(state.copyWith(errors: event.errors));
    });
    on<SaveCreditCardEvent>((event, emit) async {
      emit(state.copyWith(status: CreditCardStatus.saving));
      final String? accessToken = await authRepo.getAccessToken();
      if (accessToken != null) {
        final CreditCard? createdCreditCard =
            await creditCardRepo.saveCreditCard(
                accessToken: accessToken,
                creditCardPayload: event.creditCardPayload);
        if (createdCreditCard != null) {
          emit(state.copyWith(status: CreditCardStatus.saveSuccess));
        }
      }
    });
  }
}
