import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_ecommerce_app/core/auth/repositories/auth_repo.dart';
import 'package:http/http.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;

  AuthBloc({required this.authRepo}) : super(AuthLoadingState()) {
    on<AuthLoadAuthenticationEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final accessToken = await authRepo.getAccessToken();
        final refreshToken = await authRepo.getRefreshToken();
        if (accessToken != null && refreshToken != null) {
          emit(AuthAuthenticatedState(
              accessToken: accessToken, refreshToken: refreshToken));
        } else {
          emit(AuthUnauthenticatedState());
        }
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
          await authRepo.saveTokens(
              accessToken: res['access'], refreshToken: res['refresh']);
          emit(AuthAuthenticatedState(
              accessToken: res['access'], refreshToken: res['refresh']));
        } else {
          emit(AuthErrorState(errorList: res));
        }
      } catch (err) {
        emit(const AuthErrorState(
            errorList: {'error': 'Something went wrong!'}));
      }
    });
    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthAuthenticatingState());
      final Response res = await authRepo.register(
          email: event.email,
          password: event.password,
          confirmPassword: event.confirmPassword,
          firstName: event.firstName,
          lastName: event.lastName);
      if (res.statusCode == 201) {
        final resJson = jsonDecode(res.body);
        await authRepo.saveTokens(
            accessToken: resJson['access'], refreshToken: resJson['refresh']);
        emit(AuthAuthenticatedState(
            accessToken: resJson['access'], refreshToken: resJson['refresh']));
      } else {
        emit(AuthErrorState(errorList: jsonDecode(res.body)));
      }
    });
  }
}
