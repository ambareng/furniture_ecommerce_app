import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/auth/repositories/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;

  AuthBloc({required this.authRepo}) : super(AuthLoadingState()) {
    on<AuthLoadAuthenticationEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final accessToken = await authRepo.getAccessToken();
        debugPrint('=========================================');
        debugPrint(accessToken);
        debugPrint('=========================================');
        if (accessToken != null) {
          emit(AuthAuthenticatedState());
        }
        emit(AuthUnauthenticatedState());
      } catch (err) {
        emit(const AuthErrorState(
            errorList: {'error': 'Something went wrong!'}));
      }
    });
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthAuthenticatingState());
      try {
        final res =
            await authRepo.login(email: event.email, password: event.password);
        if (res.containsKey('access')) {
          emit(AuthAuthenticatedState());
        } else {
          emit(AuthErrorState(errorList: res));
        }
      } catch (err) {
        emit(const AuthErrorState(
            errorList: {'error': 'Something went wrong!'}));
      }
    });
  }
}
