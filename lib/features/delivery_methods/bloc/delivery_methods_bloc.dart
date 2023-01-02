import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_ecommerce_app/core/auth/repositories/auth_repo.dart';
import 'package:furniture_ecommerce_app/features/delivery_methods/models/delivery_method.dart';
import 'package:furniture_ecommerce_app/features/delivery_methods/repositories/delivery_method_repo.dart';

part 'delivery_methods_event.dart';
part 'delivery_methods_state.dart';

class DeliveryMethodsBloc
    extends Bloc<DeliveryMethodsEvent, DeliveryMethodsState> {
  final AuthRepo authRepo;
  final DeliveryMethodRepo deliveryMethodRepo;

  DeliveryMethodsBloc(
      {required this.authRepo, required this.deliveryMethodRepo})
      : super(
            const DeliveryMethodsState(status: DeliveryMethodStatus.loading)) {
    on<GetAllDeliveryMethodsEvent>((event, emit) async {
      emit(state.copyWith(status: DeliveryMethodStatus.loading));
      final String? accessToken = await authRepo.getAccessToken();
      if (accessToken != null) {
        final List<DeliveryMethod>? deliveryMethods = await deliveryMethodRepo
            .getAllDeliveryMethods(accessToken: accessToken);
        if (deliveryMethods != null) {
          emit(state.copyWith(
              status: DeliveryMethodStatus.loaded,
              deliveryMethods: deliveryMethods,
              selectedDeliveryMethod: deliveryMethods[0]));
        }
        return;
      }
    });
    on<SelectDeliveryMethodEvent>((event, emit) {
      emit(state.copyWith(
          status: DeliveryMethodStatus.loaded,
          selectedDeliveryMethod: event.selectedDeliveryMethod));
    });
  }
}
