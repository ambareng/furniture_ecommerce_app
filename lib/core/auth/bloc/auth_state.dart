part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {}

class AuthAuthenticatedState extends AuthState {
  final String accessToken;
  final String refreshToken;

  const AuthAuthenticatedState(
      {required this.accessToken, required this.refreshToken});

  @override
  List<Object> get props => [accessToken, refreshToken];
}

class AuthUnauthenticatedState extends AuthState {}

class AuthErrorState extends AuthState {
  final Map<String, dynamic> errorList;

  const AuthErrorState({required this.errorList});

  @override
  List<Object> get props => [errorList];
}

class AuthAuthenticatingState extends AuthState {}
