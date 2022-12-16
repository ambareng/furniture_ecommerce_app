import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_ecommerce_app/core/auth/repositories/auth_repo.dart';
import 'package:furniture_ecommerce_app/features/my_cart/repositories/my_cart_total_repo.dart';

part 'my_cart_total_event.dart';
part 'my_cart_total_state.dart';

class MyCartTotalBloc extends Bloc<MyCartTotalEvent, MyCartTotalState> {
  final AuthRepo authRepo;
  final MyCartTotalRepo myCartTotalRepo;

  MyCartTotalBloc({required this.authRepo, required this.myCartTotalRepo})
      : super(const MyCartTotalState(status: MyCartTotalStatus.loading)) {
    on<GetMyCartTotalEvent>((event, emit) async {
      emit(const MyCartTotalState(status: MyCartTotalStatus.loading));
      final String? accessToken = await authRepo.getAccessToken();
      if (accessToken != null) {
        final double? total =
            await myCartTotalRepo.getMyCartTotal(accessToken: accessToken);
        if (total != null) {
          emit(
              MyCartTotalState(status: MyCartTotalStatus.loaded, total: total));
        }
      }
    });
  }
}
